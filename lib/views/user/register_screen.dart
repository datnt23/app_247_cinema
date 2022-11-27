import 'package:app_247_cinema/controller/auth_controller.dart';
import 'package:app_247_cinema/controller/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme_colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Create the textfield controller
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColor.backGround,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          //Logo
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/image/logo_cinema_247_remove.png"),
              const Padding(
                padding: EdgeInsets.only(top: 23),
                child: Text(
                  "ĐĂNG KÝ",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Điền đầy đủ thông tin!",
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
                    //Full name Textfield
                    TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: ThemeColor.grayWhite,
                        filled: true,
                        hintText: "Họ và Tên...",
                        hintStyle: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    //Phone number Textfield
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: ThemeColor.grayWhite,
                          filled: true,
                          hintText: "Số Điện Thoại...",
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    //Email Textfield
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: ThemeColor.grayWhite,
                          filled: true,
                          hintText: "Email...",
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    //Password TextField
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
                          hintText: "Mật Khẩu...",
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    //Confirm password TextField
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: ThemeColor.grayWhite,
                          filled: true,
                          hintText: "Nhập lại Mật Khẩu...",
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    //Button register
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          if(InputValidator.validateField("Full Name", fullNameController.text.trim()) && 
                          InputValidator.validateField("Email", emailController.text.trim())){
                            if(InputValidator.validatePassword(passwordController.text.trim(), confirmPasswordController.text.trim())){
                              AuthController.instance.register(
                              emailController.text.trim(),
                              passwordController.text.trim());
                            }
                          }
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
                              "Đăng Ký",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Button back to Login page
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
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
                              "Trở về Đăng Nhập",
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
