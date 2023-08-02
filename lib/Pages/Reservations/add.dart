import 'package:dashbord_rest/theme/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                                    child: Text("   رقم الزبون"))),
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
        print('endDate: $endDate');

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
