import 'package:dashbord_rest/Pages/Reservations/add.dart';
import 'package:flutter/material.dart';
import 'Pages/Menu.dart';
import 'Pages/Auth.dart';
import 'Pages/Reservations/AllReservation.dart';
import 'package:dashbord_rest/Pages/Info.dart';

import 'localStorage/local.dart';

void main() async {
  await setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MangmentApp());
}

class MangmentApp extends StatelessWidget {
  const MangmentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Auth",
      routes: {
        "/Auth": (context) => Auth(),
        "/Menu": (context) => Menu(),
        "/AllReservation": (context) => AllReservation(),
        "/Info": (context) => Info(),
        "/Add": (context) => Add()
      },
    );
  }
}
