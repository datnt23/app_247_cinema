import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/theme_colors.dart';

class InputValidator {
  static bool validateField(String title, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }
    Get.snackbar(
      "Lỗi",
      "$title trống rỗng!",
      snackPosition: SnackPosition.TOP,
      backgroundColor: ThemeColor.white,
      colorText: ThemeColor.black,
      borderRadius: 12,
      margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
    );
    return false;
  }

  static bool validatePassword(String value1, String value2) {
    if (value1.trim() == value2.trim()) {
      return true;
    }
    Get.snackbar(
      "Lỗi",
      "Xác nhận mật khẩu không khớp!!!",
      snackPosition: SnackPosition.TOP,
      backgroundColor: ThemeColor.white,
      colorText: ThemeColor.black,
      borderRadius: 12,
      margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
    );
    return false;
  }
}
