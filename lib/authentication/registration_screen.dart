import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok_remake/authentication/login_screen.dart';

import '../widgets/input_text_widget.dart';
import 'authentication_controller.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController userNameTextEditingController = TextEditingController();

  bool showProgressBar = false;

  var authenticationController = AuthenticationController.instanceAuth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100,),
              Image.asset(
                "images/tiktok.png",
                width: 80,
              ),
              Text(
                "Create An Account",
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "To get started now",
                style: GoogleFonts.abhayaLibre(
                  fontSize: 34,
                  color: Colors.cyan.shade300,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 30,),
              //Profile Avatar here
              GestureDetector(
                onTap: (){
                  //Allow users to choose images from gallery function
                  authenticationController.chooseImageFromGallery();

                  //To pick images by the camera
                  //authenticationController.captureImageWithCamera();
                },
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "images/profile_avatar.jpg"
                  ),
                  backgroundColor: Colors.black,
                ),
              ),

              const SizedBox(height: 30,),

              //Name Input Field
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: userNameTextEditingController,
                  labelString: "User Name",
                  isObscure: false,
                  iconData: Icons.person_outlined,
                ),
              ),
              const SizedBox(height: 25,),
              //Email Input Field
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: emailTextEditingController,
                  labelString: "Email",
                  isObscure: false,
                  iconData: Icons.email_outlined,
                ),
              ),
              const SizedBox(height: 25,),
              //Password Input Field
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: passwordTextEditingController,
                  labelString: "Password",
                  isObscure: true,
                  iconData: Icons.lock_outline,
                ),
              ),
              const SizedBox(height: 30,),

              //Login Button
              //SignUo Button
              showProgressBar == false
                  ?
              Column(
                children: [
                  //Login Button
                  Container(
                    width: MediaQuery.of(context).size.width - 38,
                    height: 54,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          showProgressBar = true;
                        });

                        //We will display the animation here and allow the user to log in

                      },
                      child: const Center(
                        child: Text(
                          "Create An Account",
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

                  //Not having an account, sign up Button button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "You Already have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          //Send the User to the sign up screen
                          Get.to(const LoginScreen());

                        },
                        child: const Text(
                          "Sign in here",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              )

                  :
              const Center(
                child: SimpleCircularProgressBar(
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
              ),


            ],
          ),
        ),
      ),
    );
  }
}
