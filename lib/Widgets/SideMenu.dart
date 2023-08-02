// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../theme/AppColors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String restaurantName = " تطبيق ادارة الحجوزات";
  // String restaurantImageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppColor.backColor,
      child: ListView(
        children: [
          Container(
            color: AppColor.rrrColor,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("images/DeuxRes.png"),
                  backgroundColor: AppColor.whiteColor,
                ),
                SizedBox(height: 15),
                Text(
                  restaurantName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColor.whiteColor),
                ),
              ],
            ),
          ),
          ListTile(
          
            leading: Icon(Icons.person_4),
            title: Text(
              'معلومات المطعم',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.grayColor),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/Info');
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text(
              'جميع الحجوزات',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.grayColor),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/AllReservation');
            },
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
              'قائمة الطعام',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.grayColor),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/Menu');
            },
          ),
        ],
      ),
    );
  }
}
