import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _WishlistState();
}

class _WishlistState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 38.78.w,
                height: 31.03.h,
                child: Image.asset("assets/h.png")),
            Text(
              'Stylish',
              textAlign: TextAlign.center,
              style: GoogleFonts.libreCaslonText(
                  textStyle: TextStyle(
                    color: Color(0xFF4392F9),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  )),
            )
          ],
        ),
        leading: Container(
          width: 32.w,
          height: 32.h,
          decoration: ShapeDecoration(
            color: Color(0xFFF2F2F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          child: Icon(Icons.format_align_left),
        ),
        actions: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/40x40"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 343.w,
              height: 40.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
                shadows: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 9.r,
                    offset: Offset(0, 2),
                    spreadRadius: 0.r,
                  )
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search any Product..',
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Color(0xFFBBBBBB),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFFBBBBBB),
                    ),
                    suffixIcon: Icon(
                      Icons.keyboard_voice_rounded,
                      color: Color(0xFFBBBBBB),
                    )),
              ),
            ),
              SizedBox(height: 20.h,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '52,082+ Iteams ',
                    style:GoogleFonts.montserrat(textStyle:  TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      )
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 61.w,
                        height: 24.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r)),
                          shadows: [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 16.r,
                              offset: Offset(1, 1),
                              spreadRadius: 0.r,
                            ),
                          ],
                        ),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sort',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container( width: 16.w,
                                height: 16.h,
                                child: Image.asset(
                                  "assets/short.png",
                                  fit: BoxFit.cover,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 61.w,
                        height: 24.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r)),
                          shadows: [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 16.r,
                              offset: Offset(1, 1),
                              spreadRadius: 0.r,
                            ),
                          ],
                        ),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Filter',
                              style:GoogleFonts.montserrat(textStyle:  TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,)
                              ),
                            ),
                            Container(  width: 16.w,
                                height: 16.h,child: Image.asset("assets/filter.png",fit: BoxFit.cover,))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
          SizedBox(height: 20.h,),
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
          
          ],),
        ),
      ),
    ) ;
  }
}
