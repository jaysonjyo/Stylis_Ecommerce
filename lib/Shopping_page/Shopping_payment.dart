import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingPayment extends StatefulWidget {
  const ShoppingPayment({super.key});

  @override
  State<ShoppingPayment> createState() => _ShoppingPaymentState();
}

class _ShoppingPaymentState extends State<ShoppingPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        //Color(0xFFF73658),
        centerTitle: true,
        title: Text(
          'Shopping Bag',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.41.w,
          )),
        ),
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop();
        },
        icon:  Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),)
      ),
      backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 123.w,
                    height: 153.h,
                    child: Image.asset("assets/l.png")),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 188.w,
                      height: 23.h,
                      child: Text(
                        'Women’s Casual Wear',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 188.w,
                      height: 37.h,
                      child: Text(
                        'Checked Single-Breasted Blazer',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        )),
                      ),
                    ),
                    Row(
                      children: [
                        Text('Delivery by ',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30.w,
                              ),
                            )),
                        SizedBox(
                          width: 110.w,
                          height: 20.h,
                          child: Text(
                            '10 May 2XXX',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -1.10.w,
                            )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 31.w,
                          height: 20.h,
                          child: Image.asset("assets/coupon.png")),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text('Apply Coupons',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.70.w,
                            ),
                          )),
                    ],
                  ),
                  Text(
                    'Select',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      color: Color(0xFFF73658),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.70.w,
                    )),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.sp,
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                'Order Payment Details',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.70.w,
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Amounts',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.70.w,
                  )),
                ),
                Text(
                  '7,000.00',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Convenience',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.70.w),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text('Know More',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            color: Color(0xFFF73658),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ))),
                    ],
                  ),
                  Text(
                    'Apply Coupon',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      color: Color(0xFFE91611),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Fee',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.70.w,
                    )),
                  ),
                  Text(
                    'Free',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      color: Color(0xFFF73658),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Divider(
                thickness: 1.sp,
                height: 1.h,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Total',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.70.w,
                  )),
                ),
                Text(
                  '7,000.00',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      bottomSheet:  Container(
        width: 393.w,
        height: 146.h,
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(side: BorderSide(width: 1.w,color: Colors.grey),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r)))),
      child:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '7,000.00',
                  style:GoogleFonts.montserrat(textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
                SizedBox(height: 7.h,),
                Text(
                  'View Details',
                  style:GoogleFonts.montserrat(textStyle: TextStyle(
                    color: Color(0xFFF73658),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  )
                  ),
                )
              ],
            ),
        Container(
          width: 219.w,
          height: 48.h,
          decoration: ShapeDecoration(
            color: Color(0xFFF73658),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
          ),
          child: Center(
            child: Text(
              'Proceed to Payment',
              style:GoogleFonts.montserrat(textStyle:  TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.41.w
              ),
              ),
            ),
          ),
        ),

          ],
        ),
      )
      ) ,

    );
  }
}
