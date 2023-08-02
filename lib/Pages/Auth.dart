import 'package:dashbord_rest/localStorage/local.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
// =import 'package:flutter/services.dart';

import '../theme/AppColors.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool passwordObscured = true;
  TextEditingController userCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0.8),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/DeuxRes.png'))),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  "the code will send to your number",
                  style: TextStyle(
                      height: 3, fontSize: 20, color: AppColor.grayColor),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: TextFormField(
                      textDirection: TextDirection.ltr,
                      controller: userCode,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style:
                          TextStyle(color: AppColor.blackColor, fontSize: 25),
                      decoration: InputDecoration(
                        hoverColor: AppColor.whiteColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: BorderSide(color: AppColor.grayColor)),
                        hintText: "_  _  _  _  _  _  _  _",
                        filled: true,
                        fillColor: AppColor.backColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          margin: EdgeInsets.only(bottom: 90),
          padding: EdgeInsets.symmetric(horizontal: 500),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () async {
              var state = await sendcode(userCode.text);
              if (state) {
                print(context);
                Navigator.pushNamed(context, '/AllReservation');
              } else {
                // Navigator.pushNamed(context, '/AllReservation');
              }
            },
            child: Text(
              "Verfy and create",
              style: TextStyle(fontSize: 25),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
              backgroundColor: AppColor.grayColor,
            ),
          ),
        ),
      ),
    );
  }
}

sendcode(String code) async {
  Dio dio = Dio();

  Response response = await dio.post("https://", data: {"code": code});

  if (response.statusCode == 200) {
    return response;
  } else {
    return false;
  }
}