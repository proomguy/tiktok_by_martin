import 'package:cloud_firestore/cloud_firestore.dart';

class Video{

  String? userID;
  String? userName;
  String? userProfileImage;
  String? videoID;
  int? totalComments;
  int? totalShares;
  List? likesList;
  String? artistSongName;
  String? descriptionTags;
  String? videoUrl;
  String? thumbNailUrl;
  int? publishedDateTime;

  Video({
    this.userID,
    this.userName,
    this.userProfileImage,
    this.videoID,
    this.totalComments,
    this.totalShares,
    this.likesList,
    this.artistSongName,
    this.descriptionTags,
    this.videoUrl,
    this.thumbNailUrl,
    this.publishedDateTime
  });

  Map<String, dynamic> toJson() => {
    "userID": userID,
    "userName": userName,
    "userImage": userProfileImage,
    "videoID": videoID,
    "totalComments": totalComments,
    "totalShares": totalShares,
    "likesList": likesList,
    "artistSongName": artistSongName,
    "descriptionTags": descriptionTags,
    "videoUrl": videoUrl,
    "thumbNailUrl": thumbNailUrl,
    "publishedDateTime": publishedDateTime
  };

  static Video fromDocumentSnapshot(DocumentSnapshot snapshot){
    var docSnapshot = snapshot.data() as Map<String, dynamic>;
    return Video(
      userID: docSnapshot["userID"],
      userName: docSnapshot["userName"],
      userProfileImage: docSnapshot["userProfileImage"],
      videoID: docSnapshot["videoID"],
      totalComments: docSnapshot["totalComments"],
      totalShares: docSnapshot["totalShares"],
      likesList: docSnapshot["likesList"],
      artistSongName: docSnapshot["artistSongName"],
      descriptionTags: docSnapshot["descriptionTags"],
      videoUrl: docSnapshot["videoUrl"],
      thumbNailUrl: docSnapshot["thumbNailUrl"],
      publishedDateTime: docSnapshot["publishedDateTime"],
    );
  }

}