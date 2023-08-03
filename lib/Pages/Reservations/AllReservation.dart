// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dashbord_rest/localStorage/local.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:dashbord_rest/theme/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/SideMenu.dart';

// import 'package:http/http.dart' as http;

class AllReservation extends StatefulWidget {
  const AllReservation();

  @override
  State<AllReservation> createState() => _AllReservationState();
}

class _AllReservationState extends State<AllReservation> {
  // Future getRes() async {
  //   var url = "https://jsonplaceholder.typicode.com/posts";
  //   var response = await http.get(url as Uri);
  //   var responsebody = jsonEncode(response.body);

  // }

  // @override
  // void initState() {
  //   getResarvation();
  //   super.initState();
  // }

  // List resturant = [
  //   {
  //     "tableId": "1",
  //     "customerName": "احمد",
  //     "customerNumber": "0994191372",
  //     "reservationDate": "22/6  2:40am",
  //     "numberOfPeople": "2",
  //     "reservationType": "عشاء"
  //   },
  //   {
  //     "tableId": "7",
  //     "customerName": "انس",
  //     "customerNumber": "0994191372",
  //     "reservationDate": "22/6  2:40am",
  //     "numberOfPeople": "5",
  //     "reservationType": "فطور"
  //   },
  //   {
  //     "tableId": "4",
  //     "customerName": "غيث",
  //     "customerNumber": "0994191372",
  //     "reservationDate": "22/6  2:40am",
  //     "numberOfPeople": "2",
  //     "reservationType": "عشاء"
  //   },
  //   {
  //     "tableId": "9",
  //     "customerName": "ماريا",
  //     "customerNumber": "0994191372",
  //     "reservationDate": "22/6  2:40am",
  //     "numberOfPeople": "2",
  //     "reservationType": "عشاء"
  //   },
  //   {
  //     "tableId": "1",
  //     "customerName": "علاء",
  //     "customerNumber": "09941913722",
  //     "reservationDate": "22/6  2:40am",
  //     "numberOfPeople": "2",
  //     "reservationType": "فطور"
  //   },
  //   {
  //     "tableId": "41",
  //     "customerName": "سارة",
  //     "customerNumber": "0994191372",
  //     "reservationDate": "6/22  2:40am",
  //     "numberOfPeople": "7",
  //     "reservationType": "عشاء"
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('قائمة الحجوزات'),
        ),
        backgroundColor: AppColor.grayColor,
      ),
      body: Row(
        children: [
          Expanded(child: SideMenu(), flex: 1),
          Expanded(
            flex: 4,
            child: FutureBuilder(
                future: getResarvation(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return ListView.separated(
                      separatorBuilder: (context, i) {
                        return Divider(
                          color: Colors.grey,
                          height: 2,
                          thickness: 3,
                        );
                      },
                      // itemCount: resturant.length,
                      itemCount: 4,
                      itemBuilder: (context, i) {
                        Padding(padding: EdgeInsets.all(8));
                        // posts reservation = snapshot.data;
                        return Container(
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                            ),
                            padding: EdgeInsets.only(right: 20, left: 20),
                            width: double.infinity,
                            height: 270,
                            child: ListTile(
                              title: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            "الاسم :${snapshot.data}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: AppColor.blackColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Text(
                                                "رقم الهاتف :${snapshot.data}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor.blackColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Text(
                                                " عدد الاشخاص :",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: const Color.fromARGB(
                                                        255, 158, 105, 105)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        "نوع الحجز  :",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.blackColor),
                                      ),
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        "تاريخ ووقت الحجز : ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.blackColor),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            " رقم الطاولة   :",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: AppColor.blackColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.check),
                                              color: Colors.green,
                                              onPressed: () {
                                                print('تم التحقق من الحجز');
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 50),
                                              child: IconButton(
                                                icon: Icon(Icons.cancel),
                                                color: Colors.red,
                                                onPressed: () {
                                                  print('تم الغاء الحجز');
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      },
                    );
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.rrrColor,
        focusColor: AppColor.whiteColor,
        onPressed: () {
          Navigator.pushNamed(context, '/Add');
        },
        label: Text("اضافة حجز"),
      ),
    );
  }
}


getResarvation() async {
  Dio dio = Dio();

  Response response =
      await dio.get("https://56e3-5-155-133-27.ngrok-free.app/reservations/${
storage.get<SharedPreferences>().getString("id")}");
  print(response.data);
  return response.data;
  // return response;
}

class posts {
  int userId;
  int id;
  String title;
  String body;
  posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  posts copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return posts(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory posts.fromMap(Map<String, dynamic> map) {
    return posts(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory posts.fromJson(String source) =>
      posts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'posts(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant posts other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
