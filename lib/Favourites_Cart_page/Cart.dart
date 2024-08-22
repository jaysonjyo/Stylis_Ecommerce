import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:stylis_ecommerce/Home_pages/Product_Details.dart';

import '../Shopping_page/Shopping_payment.dart';
import '../Toast_message.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}
//subcollection
class _CartState extends State<Cart> {
  final date = DateTime.now().add(Duration(days: 7));
  // payment for any payments

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  Future<void> handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    final auth = FirebaseAuth.instance;
    final firstoreorder = FirebaseFirestore.instance.collection("users").doc(auth.currentUser!.uid.toString()).collection("order");
    final firstorecart = FirebaseFirestore.instance.collection("users").doc(auth.currentUser!.uid.toString()).collection("Cart");

    QuerySnapshot querySnapshot= await firstorecart.get();
for(int i=0; i<querySnapshot.docs.length;i++){
  firstoreorder.doc(querySnapshot.docs[i]["id"].toString()).set({
    "listimage":querySnapshot.docs[i]["listimage"],
    "title":querySnapshot.docs[i]["title"].toString(),
       "rating":querySnapshot.docs[i]["rating"].toString(),
       "price":querySnapshot.docs[i]["price"].toString(),
       "offer":querySnapshot.docs[i]["offer"].toString(),
       "priceoffer":querySnapshot.docs[i]["priceoffer"].toString(),
       "description":querySnapshot.docs[i]["description"].toString(),
       "about":querySnapshot.docs[i]["about"].toString(),
       "id":querySnapshot.docs[i]["id"].toString(),
       "status":"Order Placed",
    "date":'${date.day.toString()} ${DateFormat('MMM').format(date)} ${date.year.toString()}'
  }).then((onValue) {
    Fluttertoast.showToast(msg: "Order succesfully");
  }).onError((error, stackTrace) =>
      ToastMessage()
          .toastmessage(message: error.toString()));
}


    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //payment ended function

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final firstore = FirebaseFirestore.instance.collection("users").doc(auth.currentUser!.uid.toString()).collection("Cart").snapshots();
    final firstore_delete = FirebaseFirestore.instance
        .collection("users")
        .doc(auth.currentUser!.uid.toString())
        .collection("Cart");

    return Scaffold(
      bottomSheet:  StreamBuilder<QuerySnapshot>(
        stream: firstore,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }if(snapshot.hasError){
            return Center(child: Text("Error"),);
          }if(snapshot.hasData) {
            dynamic sum = 0;
            for (int i = 0; i < snapshot.data!.docs.length; i++) {

              sum = sum + double.parse(snapshot.data!.docs[i]["price"].toString());
              print(sum);

            }
            return Container(
                width: 393.w,
                height: 100.h,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r)))),
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
                            "₹ ${sum.toString()}",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            'View Details',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Color(0xFFF73658),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Razorpay razorpay = Razorpay();
                          var options = {
                            'key': 'rzp_test_gKANZdsNdLqaQs',
                            'amount': 100,
                            'name': 'Acme Corp.',
                            'description': 'Fine T-Shirt',
                            'retry': {'enabled': true, 'max_count': 1},
                            'send_sms_hash': true,
                            'prefill': {
                              'contact': '8888888888',
                              'email': 'test@razorpay.com'
                            },
                            'external': {
                              'wallets': ['paytm']
                            }
                          };
                          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                              handlePaymentErrorResponse);
                          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                              handlePaymentSuccessResponse);
                          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                              handleExternalWalletSelected);
                          razorpay.open(options);
                        },
                        child: Container(
                          width: 219.w,
                          height: 48.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF73658),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r)),
                          ),
                          child: Center(
                            child: Text(
                              'Proceed to Payment',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.41.w),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }else{
            return SizedBox();
          }
        }
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Cart',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: StreamBuilder<QuerySnapshot>(
            stream: firstore,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error"),
                );
              }
              if (snapshot.hasData) {

                return Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Expanded(
                      // width: double.infinity.w,
                      // height: 700.h,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 164 / 245,
                        shrinkWrap: true,
                        children: List.generate(
                          snapshot.data!.docs.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ProductDetails(
                                        listimage: snapshot.data!.docs[index]
                                            ["listimage"],
                                        title: snapshot.data!.docs[index]["title"]
                                            .toString(),
                                        rating: snapshot
                                            .data!.docs[index]["rating"]
                                            .toString(),
                                        priceoffer: snapshot
                                            .data!.docs[index]["priceoffer"]
                                            .toString(),
                                        price: snapshot.data!.docs[index]["price"]
                                            .toString(),
                                        offer: snapshot.data!.docs[index]["offer"]
                                            .toString(),
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
                                      borderRadius:
                                          BorderRadius.circular(8.r)),
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(6.r),
                                          topLeft: Radius.circular(6.r)),
                                      child: SizedBox(
                                          width: 164.w,
                                          height: 136.h,
                                          child: Image.network(
                                            snapshot.data!
                                                .docs[index]["listimage"][0]
                                                .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            snapshot
                                                .data!.docs[index]["title"]
                                                .toString(),
                                            maxLines: 1,
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
                                            snapshot
                                                .data!.docs[index]["about"]
                                                .toString(),
                                            maxLines: 2,
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
                                            "₹ ${snapshot.data!.docs[index]["price"].toString()}",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            )),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  RatingBar.builder(
                                                    itemSize: 14.sp,
                                                    tapOnlyMode: true,
                                                    initialRating:
                                                        double.parse(snapshot
                                                            .data!
                                                            .docs[index]
                                                                ["rating"]
                                                            .toString()),
                                                    minRating: 1,
                                                    direction:
                                                        Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemBuilder:
                                                        (context, _) => Icon(
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
                                                    style: GoogleFonts
                                                        .montserrat(
                                                            textStyle:
                                                                TextStyle(
                                                      color:
                                                          Color(0xFFA4A9B3),
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                  )
                                                ],
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    firstore_delete
                                                        .doc(snapshot.data!
                                                                .docs[index]
                                                            ["id"])
                                                        .delete();
                                                    setState(() {

                                                    });
                                                  },
                                                  child: Icon(Icons.delete))
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
                    ),

                  ],
                );
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }

}
