import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylis_ecommerce/authentication/Login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool isvisible1 = true;
  bool isvisible2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Create an \naccount',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                        height: 1.h
                  )),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 317.w,
                  height: 55.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username or Email',
                        hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          height: 5.h,
                          fontWeight: FontWeight.w500,
                        )),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 317.w,
                  height: 55.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: TextField(
                    obscureText: isvisible1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: 5.h,
                        )),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: InkWell(
                          child: Icon(Icons.visibility),
                          onTap: () {
                            setState(() {
                              isvisible1 = !isvisible1;
                            });
                          },
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 317.w,
                  height: 55.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: TextField(
                    obscureText: isvisible2,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ConfirmPassword',
                        hintStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 5.h,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: InkWell(
                          child: Icon(Icons.visibility),
                          onTap: () {
                            setState(() {
                              isvisible2 = !isvisible2;
                            });
                          },
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 258.w,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By clicking the ',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                        TextSpan(
                          text: 'Register',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            color: Color(0xFFFF4B26),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                        TextSpan(
                            text: ' button, you agree to the public offer',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Color(0xFF676767),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 317.w,
                  height: 55.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF73658),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r)),
                  ),
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Text(
                    '- OR Continue with -',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 54.w,
                      height: 54.h,
                      padding: EdgeInsets.all(15.sp),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFBF3F5),
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.w, color: Color(0xFFF73658)),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                      child: Image.asset("assets/e.png"),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      width: 54.w,
                      height: 54.h,
                      padding: EdgeInsets.all(15.sp),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFBF3F5),
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.w, color: Color(0xFFF73658)),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                      child: Image.asset("assets/f.png"),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I Already Have an Account',
                      //  textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Color(0xFF575757),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Login()),(route)=>false);
                    },
                      child: Text(
                        'Login',
                        //textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xFFF73658),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFF73658))),
                      ),
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
