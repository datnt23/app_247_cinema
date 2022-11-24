import 'package:app_247_cinema/controller/auth_controller.dart';
import 'package:app_247_cinema/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Create the textfield controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColor.backGround,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Image.asset("assets/image/logo_cinema_247_remove.png"),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Login to book your seat!",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: ThemeColor.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Login to your account",
                        style: TextStyle(
                          fontSize: 16,
                          color: ThemeColor.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: ThemeColor.grayWhite,
                          filled: true,
                          hintText: "Email or Phone Number",
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: ThemeColor.grayWhite,
                          filled: true,
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                              title: "Forgot Password?",
                              content: TextFormField(
                                controller: forgotPasswordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "Email Address",
                                  hintStyle:
                                      const TextStyle(color: Colors.black45),
                                  fillColor: ThemeColor.grayWhite,
                                  filled: true,
                                ),
                              ),
                              radius: 10,
                              onWillPop: () {
                                forgotPasswordController.text = "";
                                return Future.value(true);
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              confirm: ElevatedButton(
                                onPressed: () {
                                  AuthController.instance.forgotPassword(
                                      forgotPasswordController.text.trim());
                                  forgotPasswordController.text = "";
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: ThemeColor.backGround,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      "Send to reset Mail",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AuthController.instance.login(
                            emailController.text.trim(),
                            passwordController.text.trim());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ThemeColor.backGround,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              "Or",
                              style: TextStyle(color: Color(0xFF9F9F9F)),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const Register());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColor.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(
                              color: ThemeColor.backGround,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Register an Account",
                              style: TextStyle(
                                  fontSize: 16, color: ThemeColor.backGround),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
