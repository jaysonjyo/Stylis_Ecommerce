import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylis_ecommerce/Favourites_Cart_page/Cart.dart';
import 'package:stylis_ecommerce/Shopping_page/Shopping_payment.dart';

class ProductDetails extends StatefulWidget {
  final List<dynamic> listimage;
  final String title;
  final String rating;
  final String priceoffer;
  final String price;
  final String offer;
  final String description;
  final String id;
  final String about;

  const ProductDetails(
      {super.key,
      required this.listimage,
      required this.title,
      required this.rating,
      required this.priceoffer,
      required this.price,
      required this.offer,
      required this.description,
      required this.id,
      required this.about});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}
//product details
class _ProductDetailsState extends State<ProductDetails> {
  int curentindex = 0;
  bool favourites = false;

  @override
  void initState() {
    Checkfavourite();
    super.initState();
  }

  Future<void> Checkfavourite() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final subcollection = FirebaseFirestore.instance
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("favourites");
    QuerySnapshot querySnapshot = await subcollection.get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]["id"].toString() == widget.id.toString()) {
        setState(() {
          favourites = true;
        });
      } else {
        print("not add");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance
        .collection("users")
        .doc(auth.currentUser!.uid.toString())
        .collection('favourites');
    final firestore1 = FirebaseFirestore.instance
        .collection("users")
        .doc(auth.currentUser!.uid.toString())
        .collection('Cart');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 339.w,
                  height: 235.h,
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          width: 343.w,
                          height: 213.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.listimage[itemIndex].toString()),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          height: 213.h,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
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
                SizedBox(
                  height: 5.h,
                ),

                SizedBox(
                  height: 9.h,
                ),
                Text(
                  widget.title.toString(),
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                //SizedBox(height: 9.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          itemSize: 18.sp,
                          tapOnlyMode: true,
                          initialRating: double.parse(widget.rating.toString()),
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
                          '56,890',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            color: Color(0xFF828282),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          )),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Checkfavourite();
                          if (favourites == true) {
                            firestore.doc(widget.id).delete().then((onValue) {
                              setState(() {
                                favourites = false;
                              });
                              Fluttertoast.showToast(msg: "remove");
                            });
                          } else {
                            firestore.doc(widget.id).set({
                              "id": widget.id,
                              "listimage": widget.listimage,
                              "title": widget.title,
                              "about": widget.about,
                              "price": widget.price,
                              "priceoffer": widget.priceoffer,
                              "offer": widget.offer,
                              "rating": widget.rating,
                              "description": widget.description
                            }).then((onValue) {
                              setState(() {
                                favourites == true;
                              });
                              Fluttertoast.showToast(msg: "Favourites");
                            }).onError((error, StackTrace) {
                              Fluttertoast.showToast(msg: error.toString());
                            });
                          }
                        },
                        icon: favourites == true
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border))
                  ],
                ),
                //   SizedBox(height: 5.h,),
                Row(
                  children: [
                    Text('₹${widget.priceoffer.toString()}',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xFF808488),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '₹${widget.price.toString()}',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '${widget.offer.toString()}% Off',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Color(0xFFF97189),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Text(
                  'Product Details',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(
                  height: 6.h,
                ),
                ReadMoreText(
                  widget.description.toString(),
                  style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                  trimMode: TrimMode.Line,
                  trimLines: 4,
                  lessStyle: TextStyle(
                      color: Colors.pink,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                  colorClickableText: Colors.pink,
                  trimCollapsedText: 'read more',
                  trimExpandedText: 'Show less',
                  moreStyle:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        GestureDetector(
                          onTap: () {
                            firestore1.doc(widget.id).set({
                              "id": widget.id,
                              "listimage": widget.listimage,
                              "title": widget.title,
                              "about": widget.about,
                              "price": widget.price,
                              "priceoffer": widget.priceoffer,
                              "offer": widget.offer,
                              "rating": widget.rating,
                              "description": widget.description
                            }).then((onValue) {
                              Fluttertoast.showToast(msg: "Added cart");
                            }).onError((error, StackTrace) {
                              Fluttertoast.showToast(msg: error.toString());
                            });
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (_) => Cart()));
                          },
                          child: Container(
                            width: 136.w,
                            height: 36.h,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [Color(0xFF3E92FF), Color(0xFF0B3689)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.r),
                                  topRight: Radius.circular(4.r),
                                  bottomLeft: Radius.circular(4.r),
                                  bottomRight: Radius.circular(4.r),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text('Go to cart',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ShoppingPayment(
                                      listimage: widget.listimage,
                                      title: widget.title,
                                      about: widget.about,
                                      price: widget.price,
                                      rating: widget.rating,
                                      offer: widget.offer,
                                      priceoffer:widget.priceoffer,
                                  description: widget.description,
                                  id: widget.id,
                                    )));
                          },
                          child: Container(
                            width: 136.w,
                            height: 36.h,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [Color(0xFF70F8A8), Color(0xFF31B669)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.r),
                                  topRight: Radius.circular(4.r),
                                  bottomLeft: Radius.circular(4.r),
                                  bottomRight: Radius.circular(4.r),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text('Buy Now',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
