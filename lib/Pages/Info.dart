// import 'dart:convert';

import 'package:dashbord_rest/Widgets/SideMenu.dart';
import 'package:dashbord_rest/theme/AppColors.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
            child: ListView(
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
                            Icon(
                              color: AppColor.grayColor,
                              size: 40,
                              Icons.badge,
                            ),
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
            ),
          ),
        ],
      ),
    );
  }
}

// Future<ResturantModel> getRestaurantData() async {
//   Dio dio = Dio();
//   Response response = await dio.get("");

//   if (response.statusCode == 200) {
//     Map<String, dynamic> data = json.decode(response.data);
//     ResturantModel restaurant = ResturantModel.fromMap(data);
//     return restaurant;
//   } else {
//     throw Exception('Failed to load restaurant data');
//   }
// }
