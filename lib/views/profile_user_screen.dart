import 'package:app_247_cinema/controller/profile_controller.dart';
import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../utils/constants.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> with SingleTickerProviderStateMixin{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  late AnimationController animationController;
  late Animation<Offset> animationImage, animationCamera;

  @override
  void initState() {
    super.initState();
    Get.put(ProfileController());
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    animationImage = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -0.4)).animate(animationController);
    animationCamera = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -1.1)).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: ThemeColor.backGround));
    String? picUrl = AuthController.instance.getUser!.photoURL;
    picUrl = picUrl ?? Constants.demoAvatar;
    String? name = AuthController.instance.getUser!.displayName ?? "No Name";
    String? email = AuthController.instance.getUser!.email; 
    String? phone = AuthController.instance.getUser!.phoneNumber ?? "00000000000";
    phoneController.text = phone;
    nameController.text = name;
    emailController.text = email.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.backGround,
        title: const Text(
          "Thành Viên",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: ThemeColor.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: ThemeColor.backGround,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: CachedNetworkImage(
                      imageUrl: picUrl,
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140, left: 190),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ThemeColor.white,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: ThemeColor.backGround,
                  size: 23,
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: 200),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Tên', 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          readOnly: ProfileController.instance.isEdit.value,
                          initialValue: name,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ThemeColor.backGround,
                                ),
                                child: const Icon(
                                  Icons.person_outline_outlined,
                                  color: ThemeColor.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                ProfileController.instance.toggleEdit();
                              },
                              child: const Icon(
                                Icons.edit_outlined,
                                color: ThemeColor.backGround,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      buildTitle('Email', 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          readOnly: true,
                          initialValue: email,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ThemeColor.backGround,
                                ),
                                child: const Icon(
                                  Icons.email_outlined,
                                  color: ThemeColor.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      buildTitle('Số Điện Thoại', 10),
                      Obx(()=>Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            readOnly: ProfileController.instance.isEdit.value,
                            initialValue: phone,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ThemeColor.backGround,
                                  ),
                                  child: const Icon(
                                    Icons.phone_iphone_outlined,
                                    color: ThemeColor.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  ProfileController.instance.toggleEdit();
                                },
                                child: const Icon(
                                  Icons.edit_outlined,
                                  color: ThemeColor.backGround,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        color: ThemeColor.backGround,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: ListTile(
                          leading: const Icon(
                            Icons.share,
                            size: 23,
                            color: ThemeColor.backGround,
                          ),
                          title: const Text(
                            'Chia Sẻ',
                            style: TextStyle(
                              color: ThemeColor.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: ListTile(
                          leading: const Icon(
                            Icons.logout,
                            size: 23,
                            color: ThemeColor.red,
                          ),
                          title: const Text(
                            'Đăng xuất',
                            style: TextStyle(
                              color: ThemeColor.red,
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            AuthController.instance.signOut();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildTitle(String content, double num) {
    return Padding(
      padding: EdgeInsets.only(top: num, left: 80),
      child: Text(
        content,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
    );
  }
}
