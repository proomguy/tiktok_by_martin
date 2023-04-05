import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_remake/authentication/login_screen.dart';
import 'package:tiktok_remake/authentication/registration_screen.dart';
import 'package:tiktok_remake/global_variables.dart';
import 'user.dart' as userModel;

class AuthenticationController extends GetxController{

  static AuthenticationController instanceAuth = Get.find();

  late Rx<File?> _pickedFile;
  File? get profileImage => _pickedFile.value;

  void chooseImageFromGallery() async {

    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImageFile != null){
      Get.snackbar(
          "Profile Image",
          "You have successfully selected your profile image."
      );
    }
    _pickedFile = Rx<File?>(File(pickedImageFile!.path));

  }

  void captureImageWithCamera() async {

    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickedImageFile != null){
      Get.snackbar(
          "Profile Image",
          "You have successfully selected your profile image."
      );
    }
    _pickedFile = Rx<File?>(File(pickedImageFile!.path));

  }

  void createAccountForNewUser(File imageFile, String userName, String userEmail, String userPassword) async{
    try{
      //Create user in the Firebase authentication
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      //Step 2 Save the user image in the firebase storage
      String imageDownloadUrl = await uploadImageToStorage(imageFile);

      //step 3 we get the download Url fro the firebase storage

      //step 4 save user data to the firestore database
      userModel.User user = userModel.User(
        name: userName,
        email: userEmail,
        image: imageDownloadUrl,
        uid: credential.user!.uid,
      );
      await FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set(user.toJson());
      Get.snackbar(
          "Account Created", "Account Created successfully"
      );
      showProgressBar = false;
      Get.to(const LoginScreen());
    }
    catch(error){
      Get.snackbar(
          "Account Creation Unsuccessful", "Error Occurred while creating account"
      );
      showProgressBar = false;
      Get.to(const LoginScreen());

    }
  }

  Future<String> uploadImageToStorage(File imageFile) async{

    Reference reference = FirebaseStorage.instance.ref().child("profile_images").child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = reference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrlOfUploadedImage = await taskSnapshot.ref.getDownloadURL();
    return downloadUrlOfUploadedImage;

  }

  void loginUserNow(String userEmail, String userPassword) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail,
          password: userPassword,
      );
      Get.snackbar(
          "Logged in Successful", "You are now logged successfully"
      );
      showProgressBar = false;
      //For purpose of testing the app, for now
      Get.to(const RegistrationScreen());
    }
    catch(error){
      Get.snackbar(
          "Login Unsuccessful", "Error Occurred during Authentication"
      );
      showProgressBar = false;
      Get.to(const LoginScreen());

    }

  }

}