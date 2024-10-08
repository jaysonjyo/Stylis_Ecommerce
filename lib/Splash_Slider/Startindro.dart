import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylis_ecommerce/Bottam_navigation_bar.dart';
import 'package:stylis_ecommerce/Home_pages/Home.dart';
import 'package:stylis_ecommerce/Splash_Slider/onboard.dart';
import 'package:stylis_ecommerce/authentication/Login.dart';
import 'package:stylis_ecommerce/authentication/SignUp.dart';

class Starindro extends StatefulWidget {
  const Starindro({super.key});

  @override
  State<Starindro> createState() => _StarindroState();
}
//firstscreen2
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
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Container(
          width: 390.w,
          height: 362.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.9299999952316284)],
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You want Authentic, here you go!',
                textAlign: TextAlign.center,
                style:GoogleFonts.montserrat(textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.34.w,))
                ),
              SizedBox(height: 20.h,),
              Text(
                'Find it here, buy it now!',
                textAlign: TextAlign.center,
                style:GoogleFonts.montserrat(textStyle:  TextStyle(
                  color: Color(0xFFF2F2F2),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 0.11.h,
                  letterSpacing: 0.14.w,)
                ),
              ),
              SizedBox(height: 5.h,),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: 30.h),
                child: GestureDetector(onTap: (){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Onboard()),(route)=>false);

                },
                  child: Container(
                              width: 279.w,
                              height: 55.h,
                              decoration: ShapeDecoration(
                  color: Color(0xFFF73658),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                              ),
                          child:Center(
                            child: Text(
                              'Get Started',
                              style:GoogleFonts.montserrat(textStyle:  TextStyle(
                  color: Colors.white,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600,
                              )
                              ),
                            ),
                          ),
                            ),
                ),
              )
            ],
          ),
          ),


      ],),
      ),
    );
  }
}
