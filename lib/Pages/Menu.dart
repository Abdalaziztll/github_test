// import 'package:dashbord_rest/Widgets/SideMenu.dart';
// import 'package:dashbord_rest/theme/AppColors.dart';
// import 'package:flutter/material.dart';

// import '../service/menu_service.dart';

// class Menu extends StatefulWidget {
//   @override
//   _MenuState createState() => _MenuState();
// }

// class _MenuState extends State<Menu> {
//   Future<List<MenuItem>>? menuItems;

//   @override
//   void initState() {
//     super.initState();

//     menuItems = MenuService.fetchMenuItems(restaurantId, menuId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Center(
//             child: Text('قائمة الطعام'),
//           ),
//           backgroundColor: AppColor.grayColor,
//         ),
//         body: Row(
//           children: [
//             Expanded(child: SideMenu(), flex: 1),
//             Expanded(
//               flex: 4,
//               child: FutureBuilder<List<MenuItem>>(
//                 // future: menuItems,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     List<MenuItem>? food = snapshot.data;
//                     return ListView.builder(
//                       itemCount: food!.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           leading: Image.network(food[index].foodImage),
//                           title: Text(food[index].foodName),
//                           subtitle: Text(food[index].foodDescription),
//                           trailing: Text(
//                               '\P\S${food[index].foodPrice.toStringAsFixed(2)}'),
//                         );
//                       },
//                     );
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('حدث خطأ في جلب بيانات المينيو'));
//                   }
//                   return Center(child: CircularProgressIndicator());
//                 },
//               ),
//             ),
//           ],
//         ));
//   }
// }

import 'package:dashbord_rest/Widgets/SideMenu.dart';
import 'package:dashbord_rest/service/Reservation_service.dart';
import 'package:dashbord_rest/theme/AppColors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localStorage/local.dart';
import '../service/menu_service.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Future<List<foodModel>>? menuItems;

  @override
  void initState() {
    super.initState();

    menuItems = MenuService.fetchMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: InkWell(
                onTap: () {
                  getMenu();
                },
                child: Text('قائمة الطعام')),
          ),
          backgroundColor: AppColor.grayColor,
        ),
        body: Row(
          children: [
            Expanded(child: SideMenu(), flex: 1),
            Expanded(
              flex: 4,
              child: FutureBuilder<List<foodModel>>(
                future: menuItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    List<foodModel>? food = snapshot.data;
                    return ListView.builder(
                      itemCount: food!.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Container(
                            height: 200,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E7E7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: 400,
                                    height: 200,
                                    child: Image.network(storage
                                            .get<SharedPreferences>()
                                            .getString('image') ??
                                        'https://th.bing.com/th/id/OIP._AuXMC1KOTt7llH-nP8WXAHaE6?w=277&h=183&c=7&r=0&o=5&dpr=1.3&pid=1.7')),
                                Expanded(
                                  flex: 1,
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.0, top: 2),
                                      child: Text(
                                        food[index].foodName,
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ),
                                    subtitle: Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Text(
                                          food[index].foodDescription,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    trailing: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                            '\P\S${food[index].foodPrice.toStringAsFixed(2)}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('حدث خطأ في جلب بيانات المينيو'));
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ));
  }
}

getMenu() async {
  Dio dio = Dio();

  Response response =
      await dio.get("https://jsonplaceholder.typicode.com/photos/1");

  if (response.statusCode == 200) {
    storage.get<SharedPreferences>().setString('image', response.data['url']);
    print(storage.get<SharedPreferences>().getString('image'));
  } else {
    return '';
  }
}
