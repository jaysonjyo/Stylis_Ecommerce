import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: 185.w,
              height: 83.h,
              child: Text(
                'Welcome \nBack!\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container( width: 317.w,
              height: 55.h, decoration: ShapeDecoration(
                color: Color(0xFFF3F3F3),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                  borderRadius: BorderRadius.circular(10.r),),

              ),
              child: TextField(
                  decoration: InputDecoration(border:InputBorder.none)
              ),
            ),



            Container( width: 317.w,
              height: 55.h, decoration: ShapeDecoration(
                color: Color(0xFFF3F3F3),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                  borderRadius: BorderRadius.circular(10.r),),

              ),
              child: TextField(
                  decoration: InputDecoration(border:InputBorder.none)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
