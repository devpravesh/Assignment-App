import 'package:assignment_app/views/dashboard.dart';
import 'package:assignment_app/views/friends.dart';
import 'package:assignment_app/views/login.dart';
import 'package:assignment_app/views/profile.dart';
import 'package:assignment_app/views/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'controller/logincontroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _contro = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Assignment App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const SplashScreen()
        // LoginPage(),
        );
  }
}

class BottomNavBar extends StatefulWidget {
  // final String? username;
  const BottomNavBar({
    // this.username,
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final RxInt _selectedIndex = 0.obs;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static final List<Widget> _widgetOptions = <Widget>[
    const Dashboard(),
    const FriendApp(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Obx(() => Center(
                child: _widgetOptions.elementAt(_selectedIndex.value),
              )),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  haptic: true,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 900),
                  gap: 8,
                  color: Colors.grey[800],
                  activeColor: Colors.purple,
                  iconSize: 24,
                  tabBackgroundColor: Colors.purple.withOpacity(0.1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  tabs: const [
                    GButton(
                      icon: Icons.house,
                      text: 'Dashboard',
                    ),
                    GButton(
                      icon: Icons.groups_outlined,
                      text: 'Friend App',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _selectedIndex.value,
                  onTabChange: (index) {
                    _selectedIndex.value = index;
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
