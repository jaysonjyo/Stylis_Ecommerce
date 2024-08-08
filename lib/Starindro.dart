import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Starindro extends StatefulWidget {
  const Starindro({super.key});

  @override
  State<Starindro> createState() => _StarindroState();
}

class _StarindroState extends State<Starindro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity.w,
        height: double.infinity.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/g.png",),fit: BoxFit.cover
          )
        ),child: Column(
        children: [
        Container(
          width: 390,
          height: 362,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.6299999952316284)],
            ),
          ),
          child: SizedBox(
            width: 315.w,
            child: Text(
              'You want Authentic, here you go!',
              textAlign: TextAlign.center,
              style:GoogleFonts.montserrat(textStyle: TextStyle(
                color: Colors.white,
                fontSize: 34.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.34.w,))
              ),
            ),
          ),

      ],),
      ),
    );
  }
}
