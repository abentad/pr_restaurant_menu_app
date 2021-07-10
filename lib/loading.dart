import 'package:flutter/material.dart';
import 'package:foodmenu/controller/api_controller.dart';
import 'package:get/get.dart';

class Loading extends GetWidget<ApiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
