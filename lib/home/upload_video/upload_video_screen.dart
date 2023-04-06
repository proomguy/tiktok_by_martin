import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({Key? key}) : super(key: key);

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {

  displayDialogBox(){
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          backgroundColor: Colors.blueGrey,
          children: [
            SimpleDialogOption(
              onPressed: (){

              },
              child: const Row(
                children: [
                  Icon(
                    Icons.image,
                    size: 24,
                    color: Colors.green,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Get from Gallery',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.green
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SimpleDialogOption(
              onPressed: (){

              },
              child: const Row(
                children: [
                  Icon(
                    Icons.camera_enhance_outlined,
                    size: 24,
                    color: Colors.orange,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Capture with Phone Camera',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SimpleDialogOption(
              onPressed: (){
                Get.back();

              },
              child: const Row(
                children: [
                  Icon(
                    Icons.cancel_outlined,
                    size: 24,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/upload.jpg',
              width: 260,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                //Open a dialog Box for user to choose source of video
                displayDialogBox();
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                  'Upload New Video',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
