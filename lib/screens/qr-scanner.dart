import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:task_tracker/screens/qr-generate.dart';
import 'package:url_launcher/url_launcher.dart';

class QRScanner extends StatefulWidget {
  static String routeName = "/qr-scanner";
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    // if (Platform.isAndroid) {
    controller!.pauseCamera();

    // controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  _buildQrView(context),
                  Positioned(
                      top: 35,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            color: Colors.green,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.teal,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.teal)),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(GenerateQR.routeName);
                              },
                              icon: const Icon(Icons.qr_code_sharp),
                              label: const Text("Generate QR"))
                        ],
                      )),
                ],
              )),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal[100],
                              borderRadius: BorderRadius.circular(6)),
                          child: result != null
                              ? Text('  ${result!.code}  ')
                              : Text(""),
                        ),
                        IconButton(
                            onPressed: () {
                              if (result!.code == null) {
                                FlutterClipboard.copy("");
                              } else {
                                FlutterClipboard.copy(result!.code ?? "");
                              }
                            },
                            icon: Icon(Icons.copy)),
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(result!.code ?? "");
                              if (await canLaunch(result!.code ?? ""))
                                await launchUrl(url);
                              else
                                throw "Could not launch ${result!.code}";
                            },
                            icon: Icon(Icons.arrow_forward))
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green[100])),
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                if (snapshot.data == true) {
                                  return const Icon(Icons.flash_on_outlined,
                                      color: Colors.yellowAccent);
                                } else {
                                  return const Icon(Icons.flash_off_outlined,
                                      color: Colors.black);
                                }
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green[100])),
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('Pause',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green[100])),
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('Resume',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 230.0
        : 380.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Color.fromARGB(255, 19, 135, 79),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
