import 'package:flutter/material.dart';
import 'package:tiktok_clone/ui/video_page.dart';
import 'package:tiktok_clone/widget/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: controller,
                    scrollDirection: Axis.vertical,
                    children: [
                      MyPageWidget(video: 'assets/videos/video-1.mp4'),
                      MyPageWidget(video: 'assets/videos/video-2.mp4'),
                      MyPageWidget(video: 'assets/videos/video-3.mp4'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Following',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '|',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'For You',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}
