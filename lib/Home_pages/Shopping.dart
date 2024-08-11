import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
        'Checkout',
        textAlign: TextAlign.center,
        style:GoogleFonts.montserrat(textStyle:  TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          height: 0.07.h,
        ),)
      ),

      ),
      backgroundColor: Colors.yellow,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
          Container( width: 142.w,
            height: 22.h,child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_sharp,color: Colors.black,size: 15.sp,),
                Text(
                  'Delivery Address',
                  style:GoogleFonts.montserrat(textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,

                  ),)
                )
              ],
            ),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 241.w,
                  height: 79.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 14.r,
                        offset: Offset(0, 6),
                        spreadRadius: -8.r,
                      ),BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 9.r,
                        offset: Offset(0, -4),
                        spreadRadius: -7.r,
                      )
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                    Icon(Icons.edit,color: Colors.black,size: 12.sp,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              textAlign:TextAlign.center,
                              'Address :',
                              style: GoogleFonts.montserrat(textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              )
                              ),
                            ),
                            SizedBox(
                              width: 213.w,
                              height: 29.h,
                              child: Text(
                        '216 St "Pauls" Rd, London N1 2LL, UK\nContact :  +44-784232',
                                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,)
                                          ),
                                        ),
                                      )
                          ],
                        ),
                      ],
                    ),
                  ),

                ),

                Container(
                  width: 78.w,
                  height: 79.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 14.r,
                        offset: Offset(0, 6),
                        spreadRadius: -8.r,
                      ),BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 9.r,
                        offset: Offset(0, -4),
                        spreadRadius: -7.r,
                      )
                    ],
                  ),
                  child: Icon(Icons.add_circle_outline_rounded,color: Colors.black,size: 24.sp,),
                )
              ],
            ),
            SizedBox(height: 10.h,),
            Text(
              'Shopping List',
              style:  GoogleFonts.montserrat(textStyle:TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              )
              ),
            ),
            SizedBox(height: 15.h,),
            Container(
              width: 331.w,
              height: 191.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 14.r,
                    offset: Offset(0, 6),
                    spreadRadius: -8.r,
                  ),BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 9.r,
                    offset: Offset(0, -4),
                    spreadRadius: -7.r,
                  )
                ],
              ),
            ),
        ],),
      ),
    );
  }
}
