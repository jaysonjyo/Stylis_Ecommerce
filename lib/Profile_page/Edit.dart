import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
        body:SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 50.h),
            child: Column(
            children: [
              Center(
                child: Padding(
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
              ),
            
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r))),
                          title: Text("Enter your name"),
                          content: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
          
                                )),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('CANCEL'),
                            ),
                            TextButton(
                              onPressed: () {
          
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  // TextField(controller: name,autofocus: true,
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter  you name',
                  //   ),
                  // ),
                },
                child: Container(
                  width: 500.w,
                  height: 100.h,
                  decoration: ShapeDecoration(
                      color: Colors.black12,
                      shape: RoundedRectangleBorder()),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 10.w),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 60.h),
                          child: Icon(
                            Icons.person_outlined,
                            color: Colors.grey,
                            size: 27.sp,
                          ),
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.24.w,
                                    )),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "knbgu",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 0.24.w,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 220.w,
                                  ),
                                  Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "This is not your username or pin. This name will be visible\n this app only",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.24.w,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w
                ),
                child: Divider(
                  height: 1.h,
                  thickness: 1.sp,
                  color: Colors.grey,
                ),
              ),SizedBox(height: 200.h,),
              GestureDetector(onTap: () async {
          
          
          
              },
                child: Container(
                  width: 150.w,
                  height: 50.h,
                  decoration: ShapeDecoration(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r))),
                  child:Center(
                    child: Text(
                      "Set your profile",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.24.w,
                          )),
                    ),
                  ),
                ),
              )
            ],
                  ),
          ),
        ),
    );
  }
}
