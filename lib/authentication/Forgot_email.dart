import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key});

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 70.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Forgot\npassword?',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.h,
                    ),
                  )),
              SizedBox(height: 40.h,),
              Container(
                width: 317.w,
                height: 55.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFF3F3F3),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                      'Enter your email address',

                      hintStyle:GoogleFonts.montserrat(textStyle:  TextStyle(
                        color: Color(0xFF676767),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 5.h,
                      )
                    ),prefixIcon: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 15.h),
                      child: Icon(Icons.email),
                    )
                  ),
                ),
              ),  SizedBox(height: 25.h,),
              SizedBox(
                width: 282,
                height: 48,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '*',
                        style:GoogleFonts.montserrat(textStyle: TextStyle(
                          color: Color(0xFFFF4B26),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                      TextSpan(
                        text: ' We will send you a message to set or reset your new password',
                        style:GoogleFonts.montserrat(textStyle: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),)
                      ),
                    ],
                  ),
                ),
              ),  SizedBox(height: 40.h,),
          Container(
            width: 317.w,
            height: 55.h,
            decoration: ShapeDecoration(
              color: Color(0xFFF73658),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
            ),
          child:Center(
            child: Text(
              'Submit',
              style:GoogleFonts.montserrat(textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,)
              ),
            ),
          ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
