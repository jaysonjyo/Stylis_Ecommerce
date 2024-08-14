import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylis_ecommerce/Bottam_navigation_bar.dart';

class Otp extends StatefulWidget {
  final String Verification;
  const Otp({super.key, required this.Verification});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  FirebaseAuth auth =FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body:   Padding(
        padding:  EdgeInsets.only(top: 250.h),
        child: OtpTextField(
          borderRadius: BorderRadius.circular(10.r),
          borderWidth: 1.w,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          numberOfFields: 6,
          borderColor: Color(0xFF512DA8),
          showFieldAsBox: true,
          onCodeChanged: (String code) {},
          onSubmit: (String verificationCode)  async {
            final credentials = PhoneAuthProvider.credential(
                verificationId: widget.Verification,
                smsCode: verificationCode);
            try{
              await auth.signInWithCredential(credentials).then((onValue){
                firestore.doc(auth.currentUser!.uid.toString()).set({
                  "email":"",
                  "id":auth.currentUser!.uid.toString(),
                  "profile":"",
                  "name":""
                });
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => BottamNavigationBar()),(route)=>false);
                CheckLogin();
              });


            } catch(error){
              Fluttertoast.showToast(msg: "error");
            }
          }, // end onSubmit
        ),
      ),
    );
  }
  void CheckLogin ()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("Token", true);
  }
}
