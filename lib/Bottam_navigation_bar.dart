import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylis_ecommerce/Home_pages/Home.dart';
import 'package:stylis_ecommerce/Search_page/Search.dart';
import 'package:stylis_ecommerce/Shopping_page/Order.dart';

import 'Favourites_Cart_page/Cart.dart';
import 'Favourites_Cart_page/Favourite.dart';
import 'Profile_page/Profile.dart';

class BottamNavigationBar extends StatefulWidget {
  const BottamNavigationBar({super.key});

  @override
  State<BottamNavigationBar> createState() => _BottamNavigationBarState();
}

class _BottamNavigationBarState extends State<BottamNavigationBar> {
  final screens = [Home(),Favourite(),Cart(),Search(),Profile()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        showSelectedLabels: true,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,

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
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,
                  color: currentIndex == 1 ? Color(0xFFF83758) : Colors.black),
              label: "Favourites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: currentIndex == 2 ? Color(0xFFF83758) : Colors.black),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: currentIndex == 3 ? Color(0xFFF83758) : Colors.black),
              label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: currentIndex == 4 ? Color(0xFFF83758) : Colors.black
              ),
              label: "Profile")
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
