import 'package:flutter/material.dart';
import 'package:foodmenu/controller/api_controller.dart';
import 'package:foodmenu/home.dart';
import 'package:get/get.dart';

class Loading extends StatelessWidget {
  final ApiController _apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return _apiController.isLoading ? Scaffold(body: Center(child: CircularProgressIndicator())) : Home();
  }
}
