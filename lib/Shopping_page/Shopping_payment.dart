import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../Toast_message.dart';

class ShoppingPayment extends StatefulWidget {
  final List<dynamic> listimage;
  final String title;
  final String about;
  final String price;
  final String rating;
  final String offer;
  final String priceoffer;
  final String description;
  final String id;

  const ShoppingPayment(
      {super.key,
      required this.listimage,
      required this.title,
      required this.about,
      required this.price,
      required this.rating,
      required this.offer,
      required this.priceoffer,
      required this.description,
      required this.id});

  @override
  State<ShoppingPayment> createState() => _ShoppingPaymentState();
}
FirebaseAuth auth = FirebaseAuth.instance;
//payment
class _ShoppingPaymentState extends State<ShoppingPayment> {
  final firstoreorder= FirebaseFirestore.instance.collection("users").doc(auth.currentUser!.uid.toString()).collection("order");
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

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    final auth = FirebaseAuth.instance;
    firstoreorder.doc(auth.currentUser!.uid.toString()).set({
      "listimage":widget.listimage,
      "title":widget.title,
      "rating":widget.rating,
      "price":widget.price,
      "offer":widget.offer,
      "priceoffer":widget.priceoffer,
      "description":widget.description,
      "about":widget.about,
      "id":widget.id,
      "status":"Order Placed",
      "date":'${date.day.toString()} ${DateFormat('MMM').format(date)} ${date.year.toString()}'

    }).then((onValue) {
      Navigator.of(context).pop();
      Fluttertoast.showToast(msg: "Order succesfully");
    }).onError((error, stackTrace) =>
        ToastMessage()
        .toastmessage(message: error.toString()));

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
  final date = DateTime.now().add(Duration(days: 7));

  //payment ended function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
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
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )),
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
                  child: Image.network(
                    widget.listimage[0].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 188.w,
                      height: 23.h,
                      child: Text(
                        widget.title.toString(),
                        maxLines: 1,
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
                        widget.about.toString(),
                        maxLines: 2,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        )),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(width: 5.w,),
                        SizedBox(
                          width: 110.w,
                          height: 20.h,
                          child: Text(
                            '${date.day.toString()} ${DateFormat('MMM').format(date)} ${date.year.toString()}',
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
                  "₹ ${widget.price}.00",
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
                  "₹ ${widget.price}.00",
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
      bottomSheet: Container(
          width: 393.w,
          height: 146.h,
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: Colors.grey),
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
                      "₹ ${widget.price}.00",
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
          )),
    );
  }
}
