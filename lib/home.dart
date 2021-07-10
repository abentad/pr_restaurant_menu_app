import 'package:flutter/material.dart';
import 'package:foodmenu/controller/api_controller.dart';
import 'package:foodmenu/home_screen/bottom_nav_bar.dart';
import 'package:foodmenu/home_screen/discover_screen.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List homeScreenList = [
      buildDiscover(size: size),
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue),
    ];

    return GetBuilder<ApiController>(
      builder: (controller) => Scaffold(
        body: controller.isLoading ? Scaffold(body: Center(child: CircularProgressIndicator())) : homeScreenList[_selectedIndex],
        bottomNavigationBar: controller.isLoading
            ? null
            : buildBottomNavigationBar(
                selectedIndex: _selectedIndex,
                onItemSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
      ),
    );
  }
}
