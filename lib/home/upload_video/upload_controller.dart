import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiktok_remake/global_variables.dart';
import 'package:tiktok_remake/home/upload_video/video.dart';
import 'package:video_compress/video_compress.dart';

import '../home_screen.dart';

class UploadController extends GetxController{
  compressVideoFile(String videoFilePath) async{

    final compressedVideoFilePath = await VideoCompress.compressVideo(videoFilePath, quality: VideoQuality.MediumQuality);
    return compressedVideoFilePath!.file;

  }
  getThumbnailImage(String videoFilePath) async{
    final thumbnailImage = await VideoCompress.getFileThumbnail(videoFilePath);
    return thumbnailImage;
  }

  uploadCompressedVideoFileToFirebaseStorage(String videoID, String videoFilePath) async{
    UploadTask videoUploadTask = FirebaseStorage
        .instance
        .ref()
        .child("all_videos")
        .child(videoID)
        .putFile(await compressVideoFile(videoFilePath));

    TaskSnapshot snapshot = await videoUploadTask;
    String downloadUrlOfUploadedVideo = await snapshot.ref.getDownloadURL();
    return downloadUrlOfUploadedVideo;
  }

  uploadThumbnailImageFileToFirebaseStorage(String videoID, String videoFilePath) async{
    UploadTask thumbnailUploadTask = FirebaseStorage
        .instance
        .ref()
        .child("all_thumbnails")
        .child(videoID)
        .putFile(await getThumbnailImage(videoFilePath));

    TaskSnapshot snapshot = await thumbnailUploadTask;
    String downloadUrlOfUploadedThumbnail = await snapshot.ref.getDownloadURL();
    return downloadUrlOfUploadedThumbnail;
  }

  saveVideoInformationToFirestoreDatabase(String artistSongName, String descriptionText, String videoFilePath, BuildContext context) async{
    try{
      String videoID = DateTime.now().millisecondsSinceEpoch.toString();
      DocumentSnapshot usersDocumentSnapshot = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();

      //1. Upload video to Firebase storage
      String videoDownloadUrl = await uploadCompressedVideoFileToFirebaseStorage(videoID, videoFilePath);

      //2. Upload Thumbnail to Firebase storage
      String thumbnailDownloadUrl = await uploadThumbnailImageFileToFirebaseStorage(videoID, videoFilePath);

      //3. Save overall video information to FirebaseFirestore Database
      Video videoObject = Video(
        userID: FirebaseAuth.instance.currentUser!.uid,
        userName: (usersDocumentSnapshot.data() as Map<String, dynamic>)["name"],
        userProfileImage: (usersDocumentSnapshot.data() as Map<String, dynamic>)["image"],
        videoID: videoID,
        totalComments: 0,
        totalShares: 0,
        likesList: [],
        artistSongName: artistSongName,
        descriptionTags: descriptionText,
        videoUrl: videoDownloadUrl,
        thumbNailUrl: thumbnailDownloadUrl,
        publishedDateTime: DateTime.now().millisecondsSinceEpoch,
      );

      await FirebaseFirestore.instance.collection("videos").doc(videoID).set(videoObject.toJson());
      showProgressBar = false;
      Get.to(const HomeScreen());
      Get.snackbar("New Video", "The video was uploaded successfully");
    }
    catch(errorMsg){
      Get.snackbar("Upload Unsuccessful", "Error occurred, Your video is not Uploaded, Try again.");
    }
  }

}