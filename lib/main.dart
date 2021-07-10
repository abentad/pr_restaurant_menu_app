import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodmenu/controller/api_controller.dart';
import 'package:foodmenu/home.dart';
import 'package:foodmenu/loading.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiController());
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  //   statusBarIconBrightness: Brightness.light, // status bar color
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fooder',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color(0xfff2f2f2),
      ),
      home: Loading(),
    );
  }
}
