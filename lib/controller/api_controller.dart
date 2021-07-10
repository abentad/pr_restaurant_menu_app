import 'dart:convert';

import 'package:foodmenu/models/food.dart';
import 'package:foodmenu/models/restaurant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  late RxList<Restaurant> _restaurantList = RxList<Restaurant>();
  late RxList<Food> _foodsList = RxList<Food>();
  late bool _isLoading;

  List<Restaurant> get restaurantList => _restaurantList;
  List<Food> get foodsList => _foodsList;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    getRestaurantList();
    getFoodList();
    _isLoading = true;
    super.onInit();
  }

  getRestaurantList() async {
    Uri uri = Uri.parse("https://food-menu.rentoch.com/api/restaurants");
    var response = await http.get(uri);
    var decodedData = jsonDecode(response.body)['results'];
    for (var i = 0; i < decodedData.length; i++) {
      _restaurantList.add(Restaurant.fromJson(decodedData[i]));
    }
    _isLoading = false;
    update();
    print(_restaurantList);
  }

  getFoodList({int id = 1}) async {
    Uri uri = Uri.parse("https://food-menu.rentoch.com/api/restaurant-menu/$id");
    var response = await http.get(uri);
    var decodedData = jsonDecode(response.body)['results'];
    for (var i = 0; i < decodedData.length; i++) {
      _foodsList.add(Food.fromJson(decodedData[i]));
    }
    _isLoading = false;
    update();
    print(_foodsList);
  }
}
