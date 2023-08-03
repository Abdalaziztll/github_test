import 'dart:convert';

import 'package:dashbord_rest/localStorage/local.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dashbord_rest/theme/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/SideMenu.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController customerName = TextEditingController();
  TextEditingController customerNumber = TextEditingController();
  TextEditingController reservationDate = TextEditingController();
  TextEditingController numberOfPeople = TextEditingController();
// TextEditingController reservationType = TextEditingController();
  var selectcountry;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? period;
  String? endTime;
  String? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('اضافة حجز '),
        ),
        backgroundColor: AppColor.grayColor,
      ),
      body: Row(
        children: [
          Expanded(
            child: SideMenu(),
            flex: 1,
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 190)),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 25, bottom: 8, left: 40),
                                    child: Text("رقم الطاولة"))),
                            SizedBox(
                              child: DropdownButton(
                                hint: Text("اختر الطاولة  "),
                                items: ["1", "2", "3", "4", "5", "6"]
                                    .map((e) => DropdownMenuItem(
                                          child: Text("$e"),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    selectcountry = val;
                                  });
                                },
                                value: selectcountry,
                              ),
                            )
                          ],
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                    padding: EdgeInsets.only(left: 33),
                                    child: Text(" اسم الزبون"))),
                            SizedBox(
                              width: 150,
                              height: 30,
                              child: TextFormField(
                                controller: customerName,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(13))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                    padding: EdgeInsets.only(top: 8, left: 30),
                                    child: Text("رقم الزبون"))),
                            SizedBox(
                              width: 150,
                              height: 30,
                              child: TextFormField(
                                controller: customerNumber,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(13))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                    padding: EdgeInsets.only(left: 13, top: 8),
                                    child: Text(" عدد الاشخاص"))),
                            SizedBox(
                              width: 150,
                              height: 30,
                              child: TextFormField(
                                controller: numberOfPeople,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(13))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                    padding: EdgeInsets.only(left: 13, top: 8),
                                    child: Text(" تاريخ الحجز"))),
                            SizedBox(
                              width: 150,
                              height: 30,
                              child: TextFormField(
                                controller: reservationDate,
                                keyboardType: TextInputType.datetime,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    hintText: "08-01 11:30",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(13))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Directionality(
                                //     textDirection: TextDirection.rtl,
                                //     child: Container(
                                //         padding: EdgeInsets.only(left: 20),
                                //         child: Text(" نوع الحجز"))),
                                // DropdownButton(
                                //   padding: EdgeInsets.only(right: 30, top: 8),
                                //   hint: Text("اختر النوع من هنا"),
                                //   items: ["فطور", "غداء", "عشاء"]
                                //       .map((e) => DropdownMenuItem(
                                //             child: Text("$e"),
                                //             value: e,
                                //           ))
                                //       .toList(),
                                //   onChanged: (val) {
                                //     setState(() {
                                //       selectcountry = val;
                                //     });
                                //   },
                                //   value: selectcountry,
                                // ),
                              ])),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                    padding: EdgeInsets.only(top: 10, left: 13),
                                    child: Text(" تاريخ الحجز"))),
                            MaterialButton(
                              onPressed: () {
                                _selectDate();

                              },
                              child: Text("لتحديد وقت الحجز اضغط هنا"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.rrrColor,
        focusColor: AppColor.whiteColor,
        onPressed: () {
            approveReservation(1);

          Navigator.pushNamed(context, '/AllReservation');
        },
        label: Text("تأكيد "),
      ),
    );
  }

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {

        
        print('pickedDate: $pickedDate');
        selectedDate = pickedDate;

        endDate = selectedDate.toString().substring(2, 7);

        String date = "${selectedDate!.month}-${selectedDate!.day} ${selectedDate!.hour}:${selectedDate!.minute}";
        print('endDate: $endDate');
        print(date);
        _selectTime();
      });
    }
  }

//08-01 11:30
  void _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        print('pickedTime: $pickedTime');
        selectedTime = pickedTime;
      });
    }
  }
}

class RequestModel {
int resturantId;
int tableId;
String customerName;
String customerNumber;
DateTime reservationDate;
int numberOfPeople;
bool isPending;
bool isAccepted;
  RequestModel({
    required this.resturantId,
    required this.tableId,
    required this.customerName,
    required this.customerNumber,
    required this.reservationDate,
    required this.numberOfPeople,
    required this.isPending,
    required this.isAccepted,
  });




  RequestModel copyWith({
    int? resturantId,
    int? tableId,
    String? customerName,
    String? customerNumber,
    DateTime? reservationDate,
    int? numberOfPeople,
    bool? isPending,
    bool? isAccepted,
  }) {
    return RequestModel(
      resturantId: resturantId ?? this.resturantId,
      tableId: tableId ?? this.tableId,
      customerName: customerName ?? this.customerName,
      customerNumber: customerNumber ?? this.customerNumber,
      reservationDate: reservationDate ?? this.reservationDate,
      numberOfPeople: numberOfPeople ?? this.numberOfPeople,
      isPending: isPending ?? this.isPending,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'resturantId': resturantId});
    result.addAll({'tableId': tableId});
    result.addAll({'customerName': customerName});
    result.addAll({'customerNumber': customerNumber});
    result.addAll({'reservationDate': reservationDate.millisecondsSinceEpoch});
    result.addAll({'numberOfPeople': numberOfPeople});
    result.addAll({'isPending': isPending});
    result.addAll({'isAccepted': isAccepted});
  
    return result;
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      resturantId: map['resturantId']?.toInt() ?? 0,
      tableId: map['tableId']?.toInt() ?? 0,
      customerName: map['customerName'] ?? '',
      customerNumber: map['customerNumber'] ?? '',
      reservationDate: DateTime.fromMillisecondsSinceEpoch(map['reservationDate']),
      numberOfPeople: map['numberOfPeople']?.toInt() ?? 0,
      isPending: map['isPending'] ?? false,
      isAccepted: map['isAccepted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) => RequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RequestModel(resturantId: $resturantId, tableId: $tableId, customerName: $customerName, customerNumber: $customerNumber, reservationDate: $reservationDate, numberOfPeople: $numberOfPeople, isPending: $isPending, isAccepted: $isAccepted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RequestModel &&
      other.resturantId == resturantId &&
      other.tableId == tableId &&
      other.customerName == customerName &&
      other.customerNumber == customerNumber &&
      other.reservationDate == reservationDate &&
      other.numberOfPeople == numberOfPeople &&
      other.isPending == isPending &&
      other.isAccepted == isAccepted;
  }

  @override
  int get hashCode {
    return resturantId.hashCode ^
      tableId.hashCode ^
      customerName.hashCode ^
      customerNumber.hashCode ^
      reservationDate.hashCode ^
      numberOfPeople.hashCode ^
      isPending.hashCode ^
      isAccepted.hashCode;
  }
}

Future<int>approveReservation(int tableId) async{

 String token= storage.get<SharedPreferences>().getString('token')!;
 Dio dio = Dio();

 try{

  Response response = await dio.post("http://56e3-5-155-133-27.ngrok-free.app/api/restaurants/${
storage.get<SharedPreferences>().getString("id")}/tables/$tableId",data: {
  ""
});

debugPrint(response.data.toString());

return response.statusCode!;

//return response.statusMessage;
//return response.data["message"];

 }on DioError catch(e)
 {

  if(e.response!=null)
  {
    return e.response!.statusCode!;

  }

  else
  {
    return 600;
  }


 }

}