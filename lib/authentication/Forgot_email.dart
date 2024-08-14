import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key});

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  TextEditingController emailreset=TextEditingController();
  FirebaseAuth auth =FirebaseAuth.instance;
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 70.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                Text('Forgot\npassword?',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.h,
                      ),
                    )),
                SizedBox(height: 40.h,),
                TextFormField(
                  controller: emailreset,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)

                      ),
                      focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)) ,
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                    hintText:
                      'Enter your email address',
        
                      hintStyle:GoogleFonts.montserrat(textStyle:  TextStyle(
                        color: Color(0xFF676767),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      )
                    ),prefixIcon: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 15.h),
                      child: Icon(Icons.email),
                    )
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                ),  SizedBox(height: 25.h,),
                SizedBox(
                  width: 282,
                  height: 48,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '*',
                          style:GoogleFonts.montserrat(textStyle: TextStyle(
                            color: Color(0xFFFF4B26),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),),
                        TextSpan(
                          text: ' We will send you a message to set or reset your new password',
                          style:GoogleFonts.montserrat(textStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),)
                        ),
                      ],
                    ),
                  ),
                ),  SizedBox(height: 40.h,),
            GestureDetector(onTap: () async {
              final isValid = _formKey.currentState!.validate();
              if (isValid) {
             await   auth.sendPasswordResetEmail(email:emailreset.text ).then((onValue){
                  Fluttertoast.showToast(msg: "Reset your password");
                  Navigator.of(context).pop();

                }).onError((error, StackTrace) {
                  Fluttertoast.showToast(msg: error.toString());
                });
              }
            },
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFF73658),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                ),
              child:Center(
                child: Text(
                  'Submit',
                  style:GoogleFonts.montserrat(textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,)
                  ),
                ),
              ),
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
