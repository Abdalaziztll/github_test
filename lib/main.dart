import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLargeScreen = MediaQuery.of(context).size.width;

    return Builder(builder: (context) {
      if (isLargeScreen > 600) {
        return Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: PerfectSecondarySetting(),
              ),
              Center(
                  child: FlutterLogo(
                size: MediaQuery.of(context).size.width / 6,
              ))
            ],
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
              child: TextButton(
            child: Text("Snack Snack"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                new SnackBar(
                  behavior: SnackBarBehavior.floating,
                  showCloseIcon: true,
                  action: SnackBarAction(
                      label: "No I Don't",
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  duration: Duration(seconds: 10),
                  content: Text("Yes You Catch me"),
                ),
              );
            },
          )),
          drawer: Drawer(child: PerfectSecondarySetting()),
        );
      }
    });
  }
}

class PerfectSecondarySetting extends StatelessWidget {
  const PerfectSecondarySetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountsDrawerHeader(
          otherAccountsPictures: [
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            actions: [
                              ElevatedButton(
                                  onPressed: () {}, child: Text('Yes'))
                            ],
                          ));
                },
                child: CircleAvatar())
          ],
          accountName: Text("Abdalaziz"),
          accountEmail: Text("abdalziztll992010@gmail.com"),
          arrowColor: Colors.green,
          currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.grey],
            ),
          ),
        ),
        ListTile(
          title: Text('Security'),
          leading: Icon(Icons.safety_check),
        ),
        ListTile(
          title: Text('Security'),
          leading: Icon(Icons.safety_check),
        ),
        ListTile(
          title: Text('Security'),
          leading: Icon(Icons.safety_check),
        ),
        ListTile(
          title: Text('Security'),
          leading: Icon(Icons.safety_check),
        )
      ],
    );
  }
}
