import 'dart:async';

import 'package:app_247_cinema/view/pages/home/home.dart';
import 'package:app_247_cinema/view/pages/user/login_screen.dart';
import 'package:app_247_cinema/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> user;
  bool isLogin = false;
  User? get getUser => user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.authStateChanges());
    ever(user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(Duration(seconds: isLogin ? 0 : 3), () {
      if (user == null) {
        isLogin = false;
        update();
        Get.offAll(() => const LoginScreen());
      } else {
        isLogin = true;
        update();
        Get.offAll(() => const HomePage());
      }
    });
  }

  void register(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      isLogin = true;
      update();
      Get.snackbar(
        "Error",
        "Register Success!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: ThemeColor.white,
        colorText: ThemeColor.black,
        borderRadius: 12,
        margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
      );
    } on FirebaseAuthException catch (e) {
      //Define error
      getErrorSnackBar("Account Creating Failed", e);
    }
  }

  void login(email, password) async {
    try {
      isLogin = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      getSuccessSnackBar("Register Success!!!");
    } on FirebaseAuthException catch (e) {
      //Define error
      getErrorSnackBar("", e);
    }
  }

  void forgotPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      getSuccessSnackBar("Reset mail sent successfully. Check Mail!!!");
    } on FirebaseAuthException catch (e) {
      //Define error
      getErrorSnackBar("Login Failed", e);
    }
  }

  void getErrorSnackBar(String message, _) {
    Get.snackbar(
      "Error",
      "$message\n${_.message}",
      snackPosition: SnackPosition.TOP,
      backgroundColor: ThemeColor.white,
      colorText: ThemeColor.black,
      borderRadius: 12,
      margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
    );
  }

  void getSuccessSnackBar(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: ThemeColor.white,
      colorText: ThemeColor.black,
      borderRadius: 12,
      margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
    );
  }

  void signOut() async {
    await auth.signOut();
  }
}
