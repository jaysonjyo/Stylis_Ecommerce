import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylis_ecommerce/Home_pages/Favourite.dart';
import 'package:stylis_ecommerce/Home_pages/Home.dart';
import 'package:stylis_ecommerce/Home_pages/Search.dart';
import 'package:stylis_ecommerce/Home_pages/Settings.dart';
import 'package:stylis_ecommerce/Home_pages/Shopping.dart';

class BottamNavigationBar extends StatefulWidget {
  const BottamNavigationBar({super.key});

  @override
  State<BottamNavigationBar> createState() => _BottamNavigationBarState();
}

class _BottamNavigationBarState extends State<BottamNavigationBar> {
  final screens = [Home(),Favourite(),Shopping(),Search(),Settings()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        showSelectedLabels: false,
        backgroundColor: Colors.yellow,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? Color(0xFFF83758) : Colors.black,
              ),
              label: "home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,
                  color: currentIndex == 1 ? Color(0xFFF83758) : Colors.black),
              label: "notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: currentIndex == 2 ? Color(0xFFF83758) : Colors.black),
              label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: currentIndex == 3 ? Color(0xFFF83758) : Colors.black),
              label: "account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: currentIndex == 4 ? Color(0xFFF83758) : Colors.black
              ),
              label: "Settings")
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
