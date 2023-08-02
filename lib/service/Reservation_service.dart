// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ResturantModel {
  String logo;
  num randomCode;
  String name;
  String address;
  String phoneNumber;
  String mobielNumber;
  List<String> images;
  String workingHours;
  String description;
  List<String> category;
  MenuModel menu;
  num numberoftables;
  ResturantModel({
    required this.logo,
    required this.randomCode,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.mobielNumber,
    required this.images,
    required this.workingHours,
    required this.description,
    required this.category,
    required this.menu,
    required this.numberoftables,
  });

  ResturantModel copyWith({
    String? logo,
    num? randomCode,
    String? name,
    String? address,
    String? phoneNumber,
    String? mobielNumber,
    List<String>? images,
    String? workingHours,
    String? description,
    List<String>? category,
    MenuModel? menu,
    num? numberoftables,
  }) {
    return ResturantModel(
      logo: logo ?? this.logo,
      randomCode: randomCode ?? this.randomCode,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      mobielNumber: mobielNumber ?? this.mobielNumber,
      images: images ?? this.images,
      workingHours: workingHours ?? this.workingHours,
      description: description ?? this.description,
      category: category ?? this.category,
      menu: menu ?? this.menu,
      numberoftables: numberoftables ?? this.numberoftables,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'logo': logo,
      'randomCode': randomCode,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'mobielNumber': mobielNumber,
      'images': images,
      'workingHours': workingHours,
      'description': description,
      'category': category,
      'menu': menu.toMap(),
      'numberoftables': numberoftables,
    };
  }

  factory ResturantModel.fromMap(Map<String, dynamic> map) {
    return ResturantModel(
      logo: map['logo'] as String,
      randomCode: map['randomCode'] as num,
      name: map['name'] as String,
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
      mobielNumber: map['mobielNumber'] as String,
      images: List<String>.from((map['Images'] as List<String>)),
      workingHours: map['workingHours'] as String,
      description: map['description'] as String,
      category: List<String>.from((map['category'] as List<String>)),
      menu: MenuModel.fromMap(map['menu'] as Map<String, dynamic>),
      numberoftables: map['numberoftables'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResturantModel.fromJson(String source) =>
      ResturantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResturantModel(logo: $logo, randomCode: $randomCode, name: $name, address: $address, phoneNumber: $phoneNumber, mobielNumber: $mobielNumber, images: $images, workingHours: $workingHours, description: $description, category: $category, menu: $menu, numberoftables: $numberoftables)';
  }

  @override
  bool operator ==(covariant ResturantModel other) {
    if (identical(this, other)) return true;

    return other.logo == logo &&
        other.randomCode == randomCode &&
        other.name == name &&
        other.address == address &&
        other.phoneNumber == phoneNumber &&
        other.mobielNumber == mobielNumber &&
        listEquals(other.images, images) &&
        other.workingHours == workingHours &&
        other.description == description &&
        listEquals(other.category, category) &&
        other.menu == menu &&
        other.numberoftables == numberoftables;
  }

  @override
  int get hashCode {
    return logo.hashCode ^
        randomCode.hashCode ^
        name.hashCode ^
        address.hashCode ^
        phoneNumber.hashCode ^
        mobielNumber.hashCode ^
        images.hashCode ^
        workingHours.hashCode ^
        description.hashCode ^
        category.hashCode ^
        menu.hashCode ^
        numberoftables.hashCode;
  }
}

//!menu
class MenuModel {
  String menuName;
  foodModel food;
  MenuModel({
    required this.menuName,
    required this.food,
  });

  MenuModel copyWith({
    String? menuName,
    foodModel? food,
  }) {
    return MenuModel(
      menuName: menuName ?? this.menuName,
      food: food ?? this.food,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'menuName': menuName,
      'food': food.toMap(),
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      menuName: map['menuName'] as String,
      food: foodModel.fromMap(map['food'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) =>
      MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'menu(menuName: $menuName, food: $food)';

  @override
  bool operator ==(covariant MenuModel other) {
    if (identical(this, other)) return true;

    return other.menuName == menuName && other.food == food;
  }

  @override
  int get hashCode => menuName.hashCode ^ food.hashCode;
}

//food
class foodModel {
  String foodImage;
  String foodName;
  String foodDescription;
  String foodCategory;
  double foodPrice;
  foodModel({
    required this.foodImage,
    required this.foodName,
    required this.foodDescription,
    required this.foodCategory,
    required this.foodPrice,
  });

  foodModel copyWith({
    String? foodImage,
    String? foodName,
    String? foodDescription,
    String? foodCategory,
    double? foodPrice,
  }) {
    return foodModel(
      foodImage: foodImage ?? this.foodImage,
      foodName: foodName ?? this.foodName,
      foodDescription: foodDescription ?? this.foodDescription,
      foodCategory: foodCategory ?? this.foodCategory,
      foodPrice: foodPrice ?? this.foodPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodImage': foodImage,
      'foodName': foodName,
      'foodDescription': foodDescription,
      'foodCategory': foodCategory,
      'foodPrice': foodPrice,
    };
  }

  factory foodModel.fromMap(Map<String, dynamic> map) {
    return foodModel(
      foodImage: map['foodImage'] as String,
      foodName: map['foodName'] as String,
      foodDescription: map['foodDescription'] as String,
      foodCategory: map['foodCategory'] as String,
      foodPrice: map['foodPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory foodModel.fromJson(String source) =>
      foodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'foodModel(foodImage: $foodImage, foodName: $foodName, foodDescription: $foodDescription, foodCategory: $foodCategory, foodPrice: $foodPrice)';
  }

  @override
  bool operator ==(covariant foodModel other) {
    if (identical(this, other)) return true;

    return other.foodImage == foodImage &&
        other.foodName == foodName &&
        other.foodDescription == foodDescription &&
        other.foodCategory == foodCategory &&
        other.foodPrice == foodPrice;
  }

  @override
  int get hashCode {
    return foodImage.hashCode ^
        foodName.hashCode ^
        foodDescription.hashCode ^
        foodCategory.hashCode ^
        foodPrice.hashCode;
  }
}

// //????????????
// class ResturantModel {
//   String logo;
//   num randomCode;
//   String name;
//   String address;
//   String phoneNumber;
//   String mobielNumber;
//   List<String> images;
//   String workingHoursModel;
//   String description;
//   List<String> category;
//   MenuModel menu;
//   num numberoftables;
//   ResturantModel({
//     required this.logo,
//     required this.randomCode,
//     required this.name,
//     required this.address,
//     required this.phoneNumber,
//     required this.mobielNumber,
//     required this.images,
//     required this.workingHoursModel,
//     required this.description,
//     required this.category,
//     required this.menu,
//     required this.numberoftables,
//   });

//   ResturantModel copyWith({
//     String? logo,
//     num? randomCode,
//     String? name,
//     String? address,
//     String? phoneNumber,
//     String? mobielNumber,
//     List<String>? images,
//     String? workingHoursModel,
//     String? description,
//     List<String>? category,
//     MenuModel? menu,
//     num? numberoftables,
//   }) {
//     return ResturantModel(
//       logo: logo ?? this.logo,
//       randomCode: randomCode ?? this.randomCode,
//       name: name ?? this.name,
//       address: address ?? this.address,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       mobielNumber: mobielNumber ?? this.mobielNumber,
//       images: images ?? this.images,
//       workingHoursModel: workingHoursModel ?? this.workingHoursModel,
//       description: description ?? this.description,
//       category: category ?? this.category,
//       menu: menu ?? this.menu,
//       numberoftables: numberoftables ?? this.numberoftables,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'logo': logo,
//       'randomCode': randomCode,
//       'name': name,
//       'address': address,
//       'phoneNumber': phoneNumber,
//       'mobielNumber': mobielNumber,
//       'images': images,
//       'workingHoursModel': workingHoursModel,
//       'description': description,
//       'category': category,
//       'menu': menu.toMap(),
//       'numberoftables': numberoftables,
//     };
//   }

//   factory ResturantModel.fromMap(Map<String, dynamic> map) {
//     return ResturantModel(
//       logo: map['logo'] as String,
//       randomCode: map['randomCode'] as num,
//       name: map['name'] as String,
//       address: map['address'] as String,
//       phoneNumber: map['phoneNumber'] as String,
//       mobielNumber: map['mobielNumber'] as String,
//       images: List<String>.from((map['images'] as List<String>),
//       workingHoursModel: map['workingHoursModel'] as String,
//       description: map['description'] as String,
//       category: List<String>.from((map['category'] as List<String>),
//       menu: MenuModel.fromMap(map['menu'] as Map<String,dynamic>),
//       numberoftables: map['numberoftables'] as num,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ResturantModel.fromJson(String source) => ResturantModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'ResturantModel(logo: $logo, randomCode: $randomCode, name: $name, address: $address, phoneNumber: $phoneNumber, mobielNumber: $mobielNumber, images: $images, workingHoursModel: $workingHoursModel, description: $description, category: $category, menu: $menu, numberoftables: $numberoftables)';
//   }

//   @override
//   bool operator ==(covariant ResturantModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.logo == logo &&
//       other.randomCode == randomCode &&
//       other.name == name &&
//       other.address == address &&
//       other.phoneNumber == phoneNumber &&
//       other.mobielNumber == mobielNumber &&
//       listEquals(other.images, images) &&
//       other.workingHoursModel == workingHoursModel &&
//       other.description == description &&
//       listEquals(other.category, category) &&
//       other.menu == menu &&
//       other.numberoftables == numberoftables;
//   }

//   @override
//   int get hashCode {
//     return logo.hashCode ^
//       randomCode.hashCode ^
//       name.hashCode ^
//       address.hashCode ^
//       phoneNumber.hashCode ^
//       mobielNumber.hashCode ^
//       images.hashCode ^
//       workingHoursModel.hashCode ^
//       description.hashCode ^
//       category.hashCode ^
//       menu.hashCode ^
//       numberoftables.hashCode;
//   }
// }

// class workingHoursModel {
//   String open;
//   String close;
//   workingHoursModel({
//     required this.open,
//     required this.close,
//   });

//   workingHoursModel copyWith({
//     String? open,
//     String? close,
//   }) {
//     return workingHoursModel(
//       open: open ?? this.open,
//       close: close ?? this.close,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'open': open,
//       'close': close,
//     };
//   }

//   factory workingHoursModel.fromMap(Map<String, dynamic> map) {
//     return workingHoursModel(
//       open: map['open'] as String,
//       close: map['close'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory workingHoursModel.fromJson(String source) =>
//       workingHoursModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'workingHoursModel(open: $open, close: $close)';

//   @override
//   bool operator ==(covariant workingHoursModel other) {
//     if (identical(this, other)) return true;

//     return other.open == open && other.close == close;
//   }

//   @override
//   int get hashCode => open.hashCode ^ close.hashCode;
// }

// class MenuModel {
//   String menuName;
//   foodModel food;
//   MenuModel({
//     required this.menuName,
//     required this.food,
//   });

//   MenuModel copyWith({
//     String? menuName,
//     foodModel? food,
//   }) {
//     return MenuModel(
//       menuName: menuName ?? this.menuName,
//       food: food ?? this.food,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'menuName': menuName,
//       'food': food.toMap(),
//     };
//   }

//   factory MenuModel.fromMap(Map<String, dynamic> map) {
//     return MenuModel(
//       menuName: map['menuName'] as String,
//       food: foodModel.fromMap(map['food'] as Map<String, dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory MenuModel.fromJson(String source) =>
//       MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'MenuModel(menuName: $menuName, food: $food)';

//   @override
//   bool operator ==(covariant MenuModel other) {
//     if (identical(this, other)) return true;

//     return other.menuName == menuName && other.food == food;
//   }

//   @override
//   int get hashCode => menuName.hashCode ^ food.hashCode;
// }

// class foodModel {
//   String foodImage;
//   String foodName;
//   String foodDescription;
//   String foodCategory;
//   double foodPrice;
//   foodModel({
//     required this.foodImage,
//     required this.foodName,
//     required this.foodDescription,
//     required this.foodCategory,
//     required this.foodPrice,
//   });

//   foodModel copyWith({
//     String? foodImage,
//     String? foodName,
//     String? foodDescription,
//     String? foodCategory,
//     double? foodPrice,
//   }) {
//     return foodModel(
//       foodImage: foodImage ?? this.foodImage,
//       foodName: foodName ?? this.foodName,
//       foodDescription: foodDescription ?? this.foodDescription,
//       foodCategory: foodCategory ?? this.foodCategory,
//       foodPrice: foodPrice ?? this.foodPrice,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'foodImage': foodImage,
//       'foodName': foodName,
//       'foodDescription': foodDescription,
//       'foodCategory': foodCategory,
//       'foodPrice': foodPrice,
//     };
//   }

//   factory foodModel.fromMap(Map<String, dynamic> map) {
//     return foodModel(
//       foodImage: map['foodImage'] as String,
//       foodName: map['foodName'] as String,
//       foodDescription: map['foodDescription'] as String,
//       foodCategory: map['foodCategory'] as String,
//       foodPrice: map['foodPrice'] as double,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory foodModel.fromJson(String source) =>
//       foodModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'foodModel(foodImage: $foodImage, foodName: $foodName, foodDescription: $foodDescription, foodCategory: $foodCategory, foodPrice: $foodPrice)';
//   }

//   @override
//   bool operator ==(covariant foodModel other) {
//     if (identical(this, other)) return true;

//     return other.foodImage == foodImage &&
//         other.foodName == foodName &&
//         other.foodDescription == foodDescription &&
//         other.foodCategory == foodCategory &&
//         other.foodPrice == foodPrice;
//   }

//   @override
//   int get hashCode {
//     return foodImage.hashCode ^
//         foodName.hashCode ^
//         foodDescription.hashCode ^
//         foodCategory.hashCode ^
//         foodPrice.hashCode;
//   }
// }




// // ????????????

