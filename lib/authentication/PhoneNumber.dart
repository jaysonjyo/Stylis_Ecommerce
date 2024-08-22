import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylis_ecommerce/authentication/OTP.dart';

class Phonenumber extends StatefulWidget {
  const Phonenumber({super.key});

  @override
  State<Phonenumber> createState() => _PhonenumberState();
}
//verification

class _PhonenumberState extends State<Phonenumber> {
  TextEditingController phonenumber= TextEditingController();
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

                Text('Enter\nPhoneNumber?',
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
                  controller: phonenumber,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)

                      ),
                      focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)) ,
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      hintText:
                      '  Enter your phone number',
                      prefix: Text("+91"),
                      hintStyle:GoogleFonts.montserrat(textStyle:  TextStyle(
                        color: Color(0xFF676767),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      )
                      ),prefixIcon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 15.h),
                    child: Icon(Icons.phone),
                  )
                  ), validator: (value) {
                  if (value!.isEmpty || value.length<10) {
                    return 'Enter your phone number';
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
                            text: ' We will to sent  OTP',
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
await  auth.verifyPhoneNumber(
    phoneNumber:"+91${phonenumber.text}",
    verificationCompleted: (Success){

    },
    verificationFailed: (error){
      Fluttertoast.showToast(msg:error.toString());
    },
    codeSent: (String verificationId,int? token) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Otp(Verification: verificationId,)));
    },
    codeAutoRetrievalTimeout: (tError){
      Fluttertoast.showToast(msg:tError.toString());

    });}
                  _formKey.currentState?.save();
                  //Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Otp()));

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
