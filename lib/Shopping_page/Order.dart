import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:stylis_ecommerce/Home_pages/Product_Details.dart';

import 'Order_Track.dart';

class My_Order extends StatefulWidget {
  const My_Order({super.key});

  @override
  State<My_Order> createState() => _My_OrderState();
}

class _My_OrderState extends State<My_Order> {

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final firstore = FirebaseFirestore.instance.collection("users").doc(
        auth.currentUser!.uid.toString()).collection("order").snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Checkout',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 0.07.h,
              ),
            )),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 142.w,
              height: 22.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: Colors.black,
                    size: 15.sp,
                  ),
                  Text('Delivery Address',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 241.w,
                  height: 79.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 14.r,
                        offset: Offset(0, 6),
                        spreadRadius: -8.r,
                      ),
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 9.r,
                        offset: Offset(0, -4),
                        spreadRadius: -7.r,
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 12.sp,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Address :',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            SizedBox(
                              width: 213.w,
                              height: 29.h,
                              child: Text(
                                '216 St "Pauls" Rd, London N1 2LL, UK\nContact :  +44-784232',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 14.r,
                        offset: Offset(0, 6),
                        spreadRadius: -8.r,
                      ),
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 9.r,
                        offset: Offset(0, -4),
                        spreadRadius: -7.r,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.add_circle_outline_rounded,
                    color: Colors.black,
                    size: 24.sp,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Shopping List',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: firstore,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error"),);
                  }
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.separated(
                          itemCount: snapshot.data!.docs.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      OrderTrack()
                                      // ProductDetails(listimage: snapshot.data!.docs[index]["listimage"],
                                      //     title: snapshot.data!.docs[index]["title"].toString(),
                                      //     rating: snapshot.data!.docs[index]["rating"].toString(),
                                      //     priceoffer: snapshot.data!.docs[index]["priceoffer"].toString(),
                                      //     price: snapshot.data!.docs[index]["price"].toString(),
                                      //     offer: snapshot.data!.docs[index]["offer"].toString(),
                                      //     description: snapshot.data!.docs[index]["description"].toString(),
                                      //     id: snapshot.data!.docs[index]["id"].toString(),
                                      //     about: snapshot.data!.docs[index]["about"].toString())
                              ));
                            },
                              child: Container(
                                width: 331.w,
                                height: 191.h,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.r)),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 14.r,
                                      offset: Offset(0, 6),
                                      spreadRadius: -8.r,
                                    ),
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 9.r,
                                      offset: Offset(0, -4),
                                      spreadRadius: -7.r,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 130.53.w,
                                            height: 125.h,
                                            child: Image.network(
                                              snapshot.data!
                                                  .docs[index]["listimage"][0]
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                snapshot.data!
                                                    .docs[index]["title"]
                                                    .toString(),
                                                maxLines: 1,
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight
                                                          .w600,
                                                    )),
                                              ),
                                              SizedBox(height: 5.h,),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Variations : ',
                                                    style: GoogleFonts
                                                        .montserrat(
                                                        textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                        )),
                                                  ), SizedBox(width: 5.h,),
                                                  Container(
                                                    width: 39.w,
                                                    height: 17.h,
                                                    decoration: ShapeDecoration(
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 0.30.w,
                                                            color: Color(
                                                                0xFF0D0808)),
                                                        borderRadius: BorderRadius
                                                            .circular(2.r),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Black',
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                            textStyle: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight
                                                                  .w500,
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Container(
                                                    width: 39.w,
                                                    height: 17.h,
                                                    decoration: ShapeDecoration(
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 0.30.w,
                                                            color: Color(
                                                                0xFF0D0808)),
                                                        borderRadius: BorderRadius
                                                            .circular(2.r),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Red',
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                            textStyle: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight
                                                                  .w500,
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 4.h,),
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot.data!
                                                        .docs[index]["rating"]
                                                        .toString(),
                                                    style: GoogleFonts
                                                        .montserrat(
                                                        textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                        )),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  RatingBar.builder(
                                                    itemSize: 11.66.sp,
                                                    tapOnlyMode: true,
                                                    initialRating: double.parse(
                                                        snapshot.data!
                                                            .docs[index]["rating"]
                                                            .toString()),
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                ],
                                              ), SizedBox(height: 8.h,),
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 84.w,
                                                      height: 29.h,
                                                      decoration: ShapeDecoration(
                                                        shape: RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              width: 0.30.w,
                                                              color: Color(
                                                                  0xFFCACACA)),
                                                          borderRadius: BorderRadius
                                                              .circular(4.r),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "₹ ${
                                                              snapshot
                                                                  .data!
                                                                  .docs[index]
                                                              ["price"]
                                                                  .toString()
                                                          }",
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: GoogleFonts
                                                              .montserrat(
                                                              textStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.sp,
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                              )),
                                                        ),
                                                      )),
                                                  SizedBox(width: 6.w,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        "upto ${snapshot.data!
                                                            .docs[index]["offer"
                                                        ].toString()}% off",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          textStyle: TextStyle(
                                                            color: Color(
                                                                0xFFEA3030),
                                                            fontSize: 8.sp,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        "₹ ${
                                                            snapshot
                                                                .data!
                                                                .docs[index]
                                                            ["priceoffer"]
                                                                .toString()
                                                        }",
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          textStyle: TextStyle(
                                                            decoration: TextDecoration
                                                                .lineThrough,
                                                            color: Color(
                                                                0xFFA6A6A6),
                                                            fontSize: 12.sp,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: Divider(
                                          thickness: 1.sp, height: 1.h,),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 8.h),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              'Total Order (1)   :',
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                  )
                                              ),
                                            ),
                                            Text(
                                              "₹ ${snapshot.data!
                                                  .docs[index]["price"
                                              ].toString()}",
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w600,
                                                  )
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, position) {
                            return SizedBox(
                              height: 10.h
                              ,
                            );
                          }),
                    );
                  }
                  else {
                    return SizedBox();
                  }
                }
            ),

          ],
        ),
      ),
    );
  }
}
