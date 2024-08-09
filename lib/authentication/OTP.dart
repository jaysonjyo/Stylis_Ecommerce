import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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
          onSubmit: (String verificationCode)  {
          }, // end onSubmit
        ),
      ),
    );
  }
}
