import 'dart:async';
import 'package:app_247_cinema/views/home_screen.dart';
import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:app_247_cinema/views/user/login_screen.dart';
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
      getSuccessSnackBar("Đăng ký thành công!!!");
    } on FirebaseAuthException catch (e) {
      //Define error
      getErrorSnackBar("Đăng ký tài khoản thất bại!", e);
    }
  }

  void login(email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isLogin = true;
      update();
      getSuccessSnackBar("Đăng nhập thành công!!!");
    } on FirebaseAuthException catch (e) {
      //Define error
      getErrorSnackBar("Đăng nhập thất bại!", e);
    }
  }

  void forgotPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      getSuccessSnackBar(
          "Gửi địa chỉ đặt mật khẩu thành công. Kiểm tra Mail!!!");
    } on FirebaseAuthException catch (e) {
      //Define error
      getErrorSnackBar("Gửi thất bại!", e);
    }
  }

  void getErrorSnackBar(String message, _) {
    Get.snackbar(
      "Lỗi",
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
      "Thành công!",
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
