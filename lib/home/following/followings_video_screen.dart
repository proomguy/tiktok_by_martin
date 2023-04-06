import 'package:flutter/material.dart';

class FollowingsVideoScreen extends StatefulWidget {
  const FollowingsVideoScreen({Key? key}) : super(key: key);

  @override
  State<FollowingsVideoScreen> createState() => _FollowingsVideoScreenState();
}

class _FollowingsVideoScreenState extends State<FollowingsVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Following video Screen',
          style: TextStyle(
            color: Colors.red
          ),
        ),
      ),
    );
  }
}
