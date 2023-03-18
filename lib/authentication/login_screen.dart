import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_remake/widgets/input_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


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
            ],
          ),
        ),
      ),
    );
  }
}
