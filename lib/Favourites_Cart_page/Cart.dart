import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Cart',
          style:GoogleFonts.montserrat(textStyle:  TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          )
          ),
        )
        ,
      ),
      backgroundColor: Colors.white,
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15.h,),
              SizedBox(
                width: double.infinity.w,
                height: 700.h,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 164 / 245,
                  shrinkWrap: true,
                  children: List.generate(20,
                        (index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 164.w,
                          height: 245.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 2.r,
                                offset: Offset(0, 2),
                                spreadRadius: 0.r,
                              )
                            ],
                          ),
                          child: Column(

                            children: [
                              SizedBox( width: 164.w,
                                  height: 136.h,
                                  child: Image.asset("assets/m.png",fit: BoxFit.cover,)),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 5.w
                                ),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    SizedBox(height: 5.h,),
                                    Text(
                                      'Black Winter...',
                                      style: GoogleFonts.montserrat(textStyle:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      )
                                      ),
                                    ),
                                    SizedBox(height: 3.h,),
                                    Text(
                                      'Autumn And Winter Casual cotton-padded jacket...',maxLines: 1,
                                      style:GoogleFonts.montserrat(textStyle:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      )
                                      ),
                                    ), SizedBox(height: 3.h,),
                                    Text(
                                      '₹499',
                                      style: GoogleFonts.montserrat(textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      )
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          itemSize: 14.sp,
                                          tapOnlyMode: true,
                                          initialRating:4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },),
                                        SizedBox(width: 5.w,),
                                        Text(
                                          '1,52,344',
                                          style:GoogleFonts.montserrat(textStyle:  TextStyle(
                                            color: Color(0xFFA4A9B3),
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,)
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
