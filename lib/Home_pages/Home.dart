import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylis_ecommerce/Home_pages/Product_Details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int curentindex = 0;

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
                height: 0.07.h,
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
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: 0.10.h,
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
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('All Featured',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
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
                                fontWeight: FontWeight.w400,
                                height: 0.11.h,)
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
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 439.w,
                height: 87.h,
                child: ListView.separated(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return Column(
                        children: [
                          Container(
                              width: 56.w,
                              height: 56.h,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/56x56"),
                                  fit: BoxFit.fill,
                                ),
                                shape: OvalBorder(),
                              )),
                          SizedBox(
                            height: 6.h,
                          ),
                          SizedBox(
                            width: 56.w,
                            height: 11.h,
                            child: Text(
                              'Beauty',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Color(0xFF21003D),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 0.16.h,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, position) {
                      return SizedBox(
                        width: 10.w,
                      );
                    }),
              ),
              Container(
                width: 343.w,
                height: 220.h,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        width: 343.w,
                        height: 189.h,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/343x189"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        height: 189.h,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            curentindex = index;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: AnimatedSmoothIndicator(
                        activeIndex: curentindex,
                        count: 3,
                        effect: WormEffect(
                            dotColor: Color(0xFFDEDBDB),
                            dotHeight: 10.h,
                            dotWidth: 10.w,
                            activeDotColor: Color(0xFFFFA3B3)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 343.w,
                height: 60.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF4392F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 18.h,
                          ),
                          Text('Deal of the Day',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 0.08.h,
                                ),
                              )),
                          SizedBox(
                            height: 13.h,
                          ),
                          Container(
                            width: 161.w,
                            height: 16.h,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.alarm,
                                  color: Colors.white,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '22h 55m 20s remaining ',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 0.11.h,
                                  )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 89.w,
                        height: 28.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.w, color: Colors.white),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              Text(
                                'View all',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 0.11.h,
                                )),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 16.sp,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: double.infinity.w,
                height: 241.h,
                child: ListView.separated(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return GestureDetector(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductDetails()));
                      },
                        child: Container(
                          width: 170.w,
                          height: 241.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r)),
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/i.png"),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    SizedBox(
                                      width: 162.w,
                                      child: Text(
                                        'HRX by Hrithik Roshan',
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    SizedBox(
                                      width: 162.w,
                                      child: Text(
                                        'Neque porro quisquam est qui dolorem ipsum quia',
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    SizedBox(
                                      width: 66.w,
                                      height: 15.h,
                                      child: Text('₹2499',
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 40.74.w,
                                          height: 16.h,
                                          child: Text(
                                            '₹4999',
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.lineThrough,
                                                  color: Color(0xFF808488),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 42.w,
                                          height: 16.h,
                                          child: Text(
                                            '50%Off',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              color: Color(0xFFFE735C),
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      width: 113.w,
                                      height: 14.h,
                                      child: Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 14.sp,
                                            tapOnlyMode: true,
                                            initialRating: 3,
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
                                            },
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          SizedBox(
                                            width: 39.w,
                                            height: 14.h,
                                            child: Text('344567',
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Color(0xFFA4A9B3),
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.5.h),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, position) {
                      return SizedBox(
                        width: 15.w,
                      );
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 343.w,
                height: 84.h,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r))),
                child: Row(
                  children: [
                    Container(
                        width: 75.w,
                        height: 60.h,
                        child: Image.asset("assets/j.png")),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Special Offers',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 171.w,
                            child: Text(
                              'We make sure you get the offer you need at best prices',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 343.w,
                height: 60.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFFC6D86),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Trending Products ',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 0.08.h,
                            )),
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'Last Date 29/02/22',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 0.11.h,
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 89.w,
                        height: 28.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.w, color: Colors.white),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              Text(
                                'View all',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 0.11.h,
                                )),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 16.sp,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: double.infinity.w,
                height: 186.h,
                child: ListView.separated(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return Container(
                        width: 142.w,
                        height: 186.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r)),
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/k.png"),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    width: 134.w,
                                    height: 48.h,
                                    child: Text(
                                      'Labbin White Sneakers\nFor Men and Female',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 33.w,
                                    height: 12.h,
                                    child: Text(
                                      '₹650',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 37.w,
                                        height: 14.h,
                                        child: Text(
                                          '₹1250',
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Color(0xFF808488),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w300,
                                          )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 44.w,
                                        height: 14.h,
                                        child: Text(
                                          '70% off',
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Color(0xFFFE735C),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5.h)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ));
                  },
                  separatorBuilder: (context, position) {
                    return SizedBox(
                      width: 15.w,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
