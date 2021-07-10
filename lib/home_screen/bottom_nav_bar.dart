import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavyBar buildBottomNavigationBar({required int selectedIndex, required Function(int) onItemSelected}) {
  return BottomNavyBar(
    selectedIndex: selectedIndex,
    showElevation: true, // use this to remove appBar's elevation
    containerHeight: 70,
    backgroundColor: Colors.white,
    animationDuration: Duration(milliseconds: 200),
    curve: Curves.easeIn,
    itemCornerRadius: 50,
    onItemSelected: onItemSelected,
    items: [
      buildNavBarItem(iconFileName: 'store.svg', title: "Discover"),
      buildNavBarItem(iconFileName: 'shopping-bag.svg', title: "Bag"),
      buildNavBarItem(iconFileName: 'search.svg', title: "Search"),
      buildNavBarItem(iconFileName: 'user.svg', title: "Account"),
    ],
  );
}

BottomNavyBarItem buildNavBarItem({required String title, required String iconFileName}) {
  return BottomNavyBarItem(
    icon: SvgPicture.asset('assets/$iconFileName', width: 25.0, color: Color(0xffD54C4C)),
    title: Text(
      title,
      style: TextStyle(color: Color(0xffDF5E5E), fontWeight: FontWeight.w500, fontSize: 15.0),
    ),
    activeColor: Color(0xffD54C4C),
    inactiveColor: Colors.green,
    textAlign: TextAlign.center,
  );
}
