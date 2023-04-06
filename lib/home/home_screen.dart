import 'package:flutter/material.dart';
import 'package:tiktok_remake/home/following/followings_video_screen.dart';
import 'package:tiktok_remake/home/for_you/for_you_video_screen.dart';
import 'package:tiktok_remake/home/profile/profile_screen.dart';
import 'package:tiktok_remake/home/search/search_screen.dart';
import 'package:tiktok_remake/home/upload_video/upload_custom_icon.dart';
import 'package:tiktok_remake/home/upload_video/upload_video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int screenIndex = 0;
  List screenList = [
    ForYouVideoScreen(),
    SearchScreen(),
    UploadVideoScreen(),
    FollowingsVideoScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            screenIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                size: 30,
              ),
              label: 'Discover'
          ),
          BottomNavigationBarItem(
              icon: UploadCustomIcon(),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.inbox_sharp,
                size: 30,
              ),
              label: 'Following'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30,
              ),
              label: 'Me'
          ),
        ],
      ),
      body: screenList[screenIndex],
    );
  }
}
