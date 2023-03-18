import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok_remake/authentication/registration_screen.dart';
import 'package:tiktok_remake/widgets/input_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  bool showProgressBar = false;


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
                width: 200,
              ),
              Text(
                "Welcome to TikTok",
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Glad to see you",
                style: GoogleFonts.abhayaLibre(
                  fontSize: 34,
                  color: Colors.cyan.shade300,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 30,),

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
                          "Log in",
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
                        "Don't have an Account...?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey
                        ),
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          //Send the User to the sign up screen
                          Get.to(const RegistrationScreen());

                        },
                        child: const Text(
                          "Sign up Now",
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
