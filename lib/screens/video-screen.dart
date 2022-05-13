import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  static String routeName = '/video-screen';

  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text("Video"),
            color: Colors.amber,
            width: MediaQuery.of(context).size.width * 0.91,
            height: MediaQuery.of(context).size.height * 0.27,
          )
        ],
      ),
    );
  }
}
