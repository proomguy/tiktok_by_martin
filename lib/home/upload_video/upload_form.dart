import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok_remake/global_variables.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/input_text_widget.dart';

class UploadForm extends StatefulWidget {

  final File videoFile;
  final String videoPath;

  UploadForm({required this.videoFile, required this.videoPath});

  @override
  State<UploadForm> createState() => _UploadFormState();
}



class _UploadFormState extends State<UploadForm> {

  VideoPlayerController? playerController;
  TextEditingController artistSongTextEditingController = TextEditingController();
  TextEditingController descriptionTagsTextEditingController = TextEditingController();


  @override
  void initState() {
    super.initState();
    setState(() {
      playerController = VideoPlayerController.file(widget.videoFile);
    });
    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(2);
    playerController!.setLooping(true);
  }

  @override
  void dispose() {
    playerController!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //We will display the video here
            SizedBox(
              width: size.width,
              height: size.height/1.6,
              child: VideoPlayer(playerController!),
            ),
            const SizedBox(height: 30,),
            //Upload Button is clicked
            //Circular progress bar else
            //Input filed

            showProgressBar == true ? Container(
              child: const SimpleCircularProgressBar(
                progressColors: [
                  Colors.lightGreenAccent,
                  Colors.blueAccent,
                  Colors.redAccent,
                  Colors.amber,
                  Colors.purpleAccent,
                ],
                animationDuration: 5,
                backColor: Colors.white30,
              ),
            ) : Column(
              children: [
                //Artist song
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: InputTextWidget(
                    textEditingController: artistSongTextEditingController,
                    labelString: "Artist - Song",
                    isObscure: false,
                    iconData: Icons.music_video_sharp,
                  ),
                ),
                const SizedBox(height: 10,),
                //Description tags
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: InputTextWidget(
                    textEditingController: descriptionTagsTextEditingController,
                    labelString: "Description tags",
                    isObscure: false,
                    iconData: Icons.slideshow_sharp,
                  ),
                ),
                const SizedBox(height: 10,),
                //Upload now Button
                Container(
                  width: MediaQuery.of(context).size.width - 38,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: InkWell(
                    onTap: (){

                    },
                    child: const Center(
                      child: Text(
                        "Upload Now",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),

                  ),
                ),
                const SizedBox(height: 15,),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
