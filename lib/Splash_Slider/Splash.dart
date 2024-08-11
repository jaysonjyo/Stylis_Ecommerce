import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylis_ecommerce/Splash_Slider/onboard.dart';

import '../Starindro.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),(){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Starindro()),(route)=>false);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(mainAxisAlignment: MainAxisAlignment.center,


        children: [
        Center(
          child: Container(width: 124.99.w,
              height: 100.h,
              child: Image.asset("assets/a.png")),
        ),
        SizedBox(width: 9.w),
        Text(
          'Stylish',
          textAlign: TextAlign.center,
    style: GoogleFonts.libreCaslonText(
    textStyle: TextStyle(
            color: Color(0xFFF73658),
            fontSize: 40.sp,
            fontWeight: FontWeight.w700,
            height: 0.01.h,
          ),
        ),)
      ],),

    );
  }
}
