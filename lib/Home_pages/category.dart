import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylis_ecommerce/Home_pages/Product_Details.dart';

class Category extends StatefulWidget {
  final List<dynamic> product;

  const Category({super.key, required this.product});

  @override
  State<Category> createState() => _CategoryState();
}
//categorys
class _CategoryState extends State<Category> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: double.infinity.w,
                height: 700.h,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 164 / 245,
                  shrinkWrap: true,
                  children: List.generate(
                    widget.product.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ProductDetails(
                                    listimage: widget.product[index]["listimage"],
                                title: widget.product[index]["title"].toString(),
                                rating:  widget.product[index]["rating"].toString(),
                                priceoffer:  widget.product[index]["priceoffer"].toString(),
                                price: widget.product[index]["price"].toString(),
                                offer: widget.product[index]["offer"].toString(),
                                description: widget.product[index]["description"].toString(),
                                id: widget.product[index]["id"].toString(),
                                about: widget.product[index]["about"].toString(),


                                  )));
                        },
                        child: Container(
                          width: 164.w,
                          height: 245.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
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
                              SizedBox(
                                  width: 164.w,
                                  height: 136.h,
                                  child: Image.network(
                                    widget.product[index]["listimage"][0]
                                        .toString(),
                                    fit: BoxFit.cover,
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      widget.product[index]["title"].toString(),maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      widget.product[index]["about"].toString(),maxLines: 2,
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "₹${widget.product[index]["price"].toString()}",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          itemSize: 14.sp,
                                          tapOnlyMode: true,
                                          initialRating: double.parse(widget
                                              .product[index]["rating"]
                                              .toString()),
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
                                          width: 5.w,
                                        ),
                                        Text(
                                          '1,52,344',
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                            color: Color(0xFFA4A9B3),
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          )),
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
