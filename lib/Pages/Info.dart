// import 'dart:convert';

import 'package:dashbord_rest/Widgets/SideMenu.dart';
import 'package:dashbord_rest/localStorage/local.dart';
import 'package:dashbord_rest/theme/AppColors.dart';
import 'package:dio/dio.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../service/Reservation_service.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('معلومات المطعم'),
        ),
        backgroundColor: AppColor.grayColor,
      ),
      body: Row(
        children: [
          Expanded(child: SideMenu(), flex: 1),
          Expanded(
            flex: 4,
            child: FutureBuilder(
              future: getRestaurantData(),
              builder: (context,snapshot) {
                return ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 200,
                          width: 390,
                          decoration: BoxDecoration(
                            color: AppColor.grayColor,
                            image: DecorationImage(
                              image: AssetImage('images/DeuxRes.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // ? This is an Image Network Widget
                        // Image.network(
                        //     height: 200,
                        //     width: 390,
                        //     "https://4ee3-94-47-128-129.ngrok.i"),
                        Container(
                          height: 200,
                          width: 390,
                          decoration: BoxDecoration(
                            color: AppColor.grayColor,
                            image: DecorationImage(
                              image: AssetImage('images/DeuxRes.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text('  اسم المطعم : ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                               
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text('  العنوان : ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                Icon(
                                  Icons.location_pin,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text('  الهاتف :',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                Icon(
                                  Icons.phone,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(' الموبايل : ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                Icon(
                                  Icons.stay_current_portrait,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text('ساعات العمل:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                Icon(
                                  Icons.query_builder,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text('  الوصف :',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                Icon(
                                  Icons.description,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text('  عدد الطاولات :',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                Icon(
                                  Icons.table_restaurant,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text('  التصنيف :',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                Icon(
                                  Icons.style,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

getRestaurantData() async {
  Dio dio = Dio();
  Response response = await dio.get("https://56e3-5-155-133-27.ngrok-free.app/resturant",
  options: Options(headers: {'Authorization': 'bearer ${storage.get<SharedPreferences>().getString("token")}'}));

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to load restaurant data');
  }
}
