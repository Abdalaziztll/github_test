// import 'dart:convert';

// import 'package:http/http.dart' as http;

// const url = ('http://192.168.1.107:3000');
// final uri = Uri.parse(url);
// final headers = {
//   'Content-Type': 'application/json',
// };
// final String restaurantId = "restaurantId";
// final String menuId = "menuId";

// //!menu
// class MenuService {
//   static Future<List<MenuItem>> fetchMenuItems(
//       String restaurantId, String menuId) async {
//     final response = await http
//         .get(Uri.parse('$url/api/restaurants/$restaurantId/menu/$menuId'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((food) => MenuItem.fromJson(food)).toList();
//     } else {
//       throw Exception('حدث خطأ في جلب بيانات المينيو');
//     }
//   }
// }

// class MenuItem {
//   final String foodName;
//   final String foodDescription;
//   final double foodPrice;
//   final String foodImage;
//   final String foodCategory;

//   MenuItem({
//     required this.foodName,
//     required this.foodDescription,
//     required this.foodPrice,
//     required this.foodImage,
//     required this.foodCategory,
//   });

//   factory MenuItem.fromJson(Map<String, dynamic> json) {
//     return MenuItem(
//       foodName: json['foodName'],
//       foodDescription: json['foodDescription'],
//       foodPrice: json['foodPrice'].toDouble(),
//       foodImage: json['foodImage'],
//       foodCategory: json['foodCategory'],
//     );
//   }
// }
// menu_service.dart

import 'package:dashbord_rest/service/Reservation_service.dart';

class MenuService {
  static Future<List<foodModel>> fetchMenuItems() async {
//      final response = await http
//         .get(Uri.parse('$url/api/restaurants/$restaurantId/menu/$menuId'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((food) => MenuItem.fromJson(food)).toList();
//     } else {
//       throw Exception('حدث خطأ في جلب بيانات المينيو');
//     }
//   }
// }

    await Future.delayed(Duration(seconds: 2));
    return [
      foodModel(
        foodName: 'فوتوتشيني ',
        foodDescription:
            'وصف اjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjhhjbkljblkjbnlkjnkjn;ogjtoiwjergiojerpogwjerogiwejrtiowertjw;egietoiejtkwletrw;oithrweriogweroigjwerpogjwerpiogwjeroetihgwnjt;grkjwmetio;wtrjgwkegnrلطعام ...............  ',
        foodImage: 'images/DeuxRes.png',
        foodPrice: 10.99,
        foodCategory: 'غداء',
      ),
      foodModel(
        foodName: '  سوشي ',
        foodDescription: 'وصف الطعام ...............  ',
        foodImage: 'images/لقطة شاشة 2023-07-11 182401.png',
        foodPrice: 15.50,
        foodCategory: 'عشاء',
      ),
    ];
  }
}

// // menu_item.dart
// class foodModel {
//   final String foodName;
//   final String foodDescription;
//   final String foodImage;
//   final double foodPrice;

//   foodModel({
//     required this.foodName,
//     required this.foodDescription,
//     required this.foodImage,
//     required this.foodPrice,
//   });
// }
