import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylis_ecommerce/Profile_page/Edit.dart';
import 'package:stylis_ecommerce/Shopping_page/Order.dart';
import 'package:stylis_ecommerce/authentication/Login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Profile',
            style:GoogleFonts.montserrat(textStyle:  TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            )
            ),
          )),
      body: Column(
        children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 30.h),
          child: Center(
            child: Stack(
              children: [
                Container(
                  width: 96.w,
                  height: 96.h,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/96x96"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 65.h,left: 65.w),
                  child: Container(
                    width: 32.w,
                  height: 32.h
                    ,decoration: ShapeDecoration(color: Colors.blue,shape: RoundedRectangleBorder(side: BorderSide(width: 3.w
                    ,color: Colors.white),borderRadius: BorderRadius.circular(20.r))),
                  child: Icon(Icons.edit,color: Colors.white,),
                  ),
                )
              ],
            ),
          ),
        ),
          Text("jayson",style: GoogleFonts.montserrat(textStyle: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 15.sp)),),
          SizedBox(height: 60.h,),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.h),
            child: Container(
              width: 341.w,
              height: 49.h,
              padding:  EdgeInsets.all(10.r),
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 80.w),
                      child: SizedBox(
                        width: 150.w,
                        height: 20.h,
                        child: Text(
                          "Edit",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp)),
                        ),
                      ),
                    ),
                    GestureDetector(onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Edit()));
                    },
                        child: Icon(Icons.keyboard_double_arrow_right_outlined))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical:10.h ),
            child: Container(
              width: 341.w,
              height: 49.h,
              padding:  EdgeInsets.all(10.r),
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 80.w),
                      child: SizedBox(
                        width: 150.w,
                        height: 20.h,
                        child: Text(
                          "Order",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp)),
                        ),
                      ),
                    ),
                    GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Order()));

                    },
                        child: Icon(Icons.keyboard_double_arrow_right_outlined))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.h),
            child: GestureDetector(onTap: ()async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> Login()), (route)=>false);
            },
              child: Container(
                width: 341.w,
                height: 49.h,
                padding:  EdgeInsets.all(10.r),
                decoration: ShapeDecoration(
                  color: Color(0xFFC6D6D3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.login,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(right: 80.w),
                        child: SizedBox(
                          width: 150.w,
                          height: 20.h,
                          child: Text(
                            "Logout",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp)),
                          ),
                        ),
                      ),
                      Icon(Icons.keyboard_double_arrow_right_outlined)
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],),
    );
  }
}
