import 'dart:developer';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../resources/authentication_methods.dart';
import '../utils/color_themes.dart';
import '../utils/utils.dart';
import '../widgets/custom_main_button.dart';
import '../widgets/text_field_widget.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticatonMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(amazonLogo, height: screenSize.height * 0.10),
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width * 0.8,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Sign-Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 28),
                              ),
                            ),
                            TextFieldWidget(
                              title: "Name",
                              controller: nameController,
                              obscureText: false,
                              hintText: "Enter your name",
                            ),
                            TextFieldWidget(
                              title: "Email",
                              controller: emailController,
                              obscureText: false,
                              hintText: "Enter your email",
                            ),
                            TextFieldWidget(
                              title: "Address",
                              controller: addressController,
                              obscureText: false,
                              hintText: "Enter your address",
                            ),
                            TextFieldWidget(
                              title: "Password",
                              controller: passwordController,
                              obscureText: true,
                              hintText: "Enter your password",
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 6, bottom: 4),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: CustomMainButton(
                                      color: yellowColor,
                                      isLoading: isLoading,
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        String output =
                                            await authenticatonMethods
                                                .signUpUser(
                                                    name: nameController.text,
                                                    address:
                                                        addressController.text,
                                                    email: emailController.text,
                                                    password: passwordController
                                                        .text);
                                        setState(() {
                                          isLoading = true;
                                        });
                                        if (output == "success") {
                                          if (mounted) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const SignInScreen()));
                                          }
                                        } else {
                                          if (mounted) {
                                            Utils().showSnackBar(
                                                context: context,
                                                content: output);
                                          }
                                        }
                                      },
                                      child: const Text("Sign Up",
                                          style: TextStyle(
                                              letterSpacing: 0.6,
                                              color: Colors.black))),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomMainButton(
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignInScreen();
                        }));
                      },
                      child: const Text(
                        "Back",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(letterSpacing: 0.6, color: Colors.black),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
