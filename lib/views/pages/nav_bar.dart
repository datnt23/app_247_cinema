import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:app_247_cinema/views/home_screen.dart';
import 'package:app_247_cinema/views/pages/cinema_page.dart';
import 'package:app_247_cinema/views/user/membership_user.dart';
import 'package:app_247_cinema/views/pages/setting.dart';
import 'package:app_247_cinema/views/pages/notification.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../controller/profile_controller.dart';
import '../../utils/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.put(ProfileController());
  }

  @override
  Widget build(BuildContext context) {
    String name = AuthController.instance.getUser!.displayName ?? "No Name";
    String? email = AuthController.instance.getUser!.email;
    String? picUrl = AuthController.instance.getUser!.photoURL;
    picUrl = picUrl ?? Constants.demoAvatar;
    nameController.text = name;
    emailController.text = email.toString();
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              name,
              style: const TextStyle(
                  color: ThemeColor.white,
                  fontFamily: 'montserrat',
                  fontSize: 20),
            ),
            accountEmail: Text(
              email!,
              style: const TextStyle(
                  color: ThemeColor.white,
                  fontFamily: 'montserrat',
                  fontSize: 15),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: CachedNetworkImage(
                  imageUrl: picUrl,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: ThemeColor.backGround,
              image: DecorationImage(
                image: NetworkImage(
                  'https://wallpaper.dog/large/20533994.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            trailing: const Icon(
              Icons.notifications,
              size: 30,
            ),
            title: const Text(
              'Thông báo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'muli',
              ),
            ),
            onTap: () {
              Get.to(const NotificationPage());
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text(
              'Cài đặt',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'muli',
              ),
            ),
            onTap: () {
              Get.to(const SettingPage());
            },
          ),
          const Divider(thickness: 1,),
          ListTile(
            trailing: const Icon(
              Icons.person,
              size: 30,
            ),
            title: const Text(
              'Thành viên',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'muli',
              ),
            ),
            onTap: () {
              Get.to(const ProfileUser());
            },
          ),
          const Divider(thickness: 1,),
          ListTile(
            trailing: const Icon(
              Icons.home_outlined,
              size: 30,
            ),
            title: const Text(
              'Trang chủ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'muli',
              ),
            ),
            onTap: () {
              Get.to(const HomePage());
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.person,
              size: 30,
            ),
            title: const Text(
              'Thành viên',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'muli',
              ),
            ),
            onTap: () {
              Get.to(const ProfileUser());
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.info_outline,
              size: 30,
            ),
            title: const Text(
              'Rạp 247',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'muli',
              ),
            ),
            onTap: () {
              Get.to(const CinemaPage());
            },
          ),
          const Divider(thickness: 1,),
          ListTile(
            trailing: const Icon(
              Icons.logout,
              size: 30,
            ),
            title: const Text(
              'Đăng xuất',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'muli',
              ),
            ),
            onTap: () {
              AuthController.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
