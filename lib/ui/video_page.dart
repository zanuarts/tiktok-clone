import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyPageWidget extends StatefulWidget {
  final String video;

  MyPageWidget({required this.video});

  @override
  _MyPageWidgetState createState() => _MyPageWidgetState();
}

class _MyPageWidgetState extends State<MyPageWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@dicoding',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '#dicoding #dicodingindonesia',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset('assets/icons/music.png'),
                    SizedBox(width: 8),
                    Text(
                      'Indonesia Raya',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Column(
                children: [
                  CircleAvatar(
                      backgroundImage: AssetImage('assets/icons/dicoding.jpg')),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Image.asset('assets/icons/love.png'),
                      Text(
                        '4758',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Image.asset('assets/icons/message.png'),
                      Text(
                        '75',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Image.asset('assets/icons/share.png'),
                      Text(
                        '788',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Image.asset('assets/icons/disc.png'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
