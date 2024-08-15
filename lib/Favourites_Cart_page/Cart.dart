import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylis_ecommerce/Home_pages/Product_Details.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final firstore = FirebaseFirestore.instance.collection("users").doc(
        auth.currentUser!.uid.toString()).collection("Cart").snapshots();
    final firstore_delete = FirebaseFirestore.instance.collection("users").doc(
        auth.currentUser!.uid.toString()).collection("Cart");

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Cart',
          style: GoogleFonts.montserrat(textStyle: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          )
          ),
        )
        ,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
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
                  return Column(
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
                          children: List.generate(snapshot.data!.docs.length,
                                (index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => ProductDetails(
                                          listimage: snapshot.data!.docs[index]["listimage"],
                                          title: snapshot.data!.docs[index]["title"].toString(),
                                          rating: snapshot.data!.docs[index]["rating"].toString(),
                                          priceoffer: snapshot.data!.docs[index]["priceoffer"].toString(),
                                          price: snapshot.data!.docs[index]["price"].toString(),
                                          offer: snapshot.data!.docs[index]["offer"].toString(),
                                          description: snapshot.data!.docs[index]["description"].toString(),
                                          id: snapshot.data!.docs[index]["id"].toString(),
                                          about: snapshot.data!.docs[index]["about"].toString())));
                                },
                                child: Container(
                                  width: 164.w,
                                  height: 245.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.r)),
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
                                      SizedBox(width: 164.w,
                                          height: 136.h,
                                          child: Image.network(snapshot.data!
                                              .docs[index]["listimage"][0]
                                              .toString(), fit: BoxFit.cover,)),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,

                                          children: [
                                            SizedBox(height: 5.h,),
                                            Text(
                                              snapshot.data!
                                                  .docs[index]["title"]
                                                  .toString(), maxLines: 1,
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                  )
                                              ),
                                            ),
                                            SizedBox(height: 3.h,),
                                            Text(
                                              snapshot.data!
                                                  .docs[index]["about"]
                                                  .toString(), maxLines: 2,
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                  )
                                              ),
                                            ), SizedBox(height: 3.h,),
                                            Text(
                                              "₹ ${snapshot.data!
                                                  .docs[index]["price"]
                                                  .toString()}",
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                  )
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    RatingBar.builder(
                                                      itemSize: 14.sp,
                                                      tapOnlyMode: true,
                                                      initialRating: double
                                                          .parse(snapshot.data!
                                                          .docs[index]["rating"]
                                                          .toString()),
                                                      minRating: 1,
                                                      direction: Axis
                                                          .horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemBuilder: (context,
                                                          _) =>
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                      onRatingUpdate: (rating) {
                                                        print(rating);
                                                      },),
                                                    SizedBox(width: 5.w,),
                                                    Text(
                                                      '1,52,344',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                          textStyle: TextStyle(
                                                            color: Color(
                                                                0xFFA4A9B3),
                                                            fontSize: 10.sp,
                                                            fontWeight: FontWeight
                                                                .w400,)
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                GestureDetector(onTap: () {
                                                  firstore_delete.doc(
                                                      snapshot.data!
                                                          .docs[index]["id"])
                                                      .delete();
                                                }, child: Icon(Icons.delete))
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
                  );
                } else {
                  return SizedBox();
                }
              }
          ),
        ),
      ),
    );
  }
}
