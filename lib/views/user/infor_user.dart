import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../controller/input_validator.dart';
import '../../utils/theme_colors.dart';

class InforUserPage extends StatefulWidget {
  const InforUserPage({super.key});

  @override
  State<InforUserPage> createState() => _InforUserPageState();
}

class _InforUserPageState extends State<InforUserPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.headerBackGround,
        title: const Text(
          "Thông Tin Tài Khoản",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: ThemeColor.white,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
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
                  ],
                ),
              ),
        ],
      ),
    );
  }
}