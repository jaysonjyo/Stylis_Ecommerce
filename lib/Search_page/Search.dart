import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final firestore = FirebaseFirestore.instance.collection("ALL").snapshots();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("You Can Search" ,style: GoogleFonts.montserrat(
        textStyle: TextStyle(
        color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      )),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Container(
                width: 343.w,
                height: 40.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 9.r,
                      offset: Offset(0, 2),
                      spreadRadius: 0.r,
                    )
                  ],
                ),
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search any Product..',
                      hintStyle: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFBBBBBB),
                      ),
                      suffixIcon: Icon(
                        Icons.keyboard_voice_rounded,
                        color: Color(0xFFBBBBBB),
                      )),
                  onChanged: (String value) {
                    setState(() {

                    });
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: double.infinity.w,
                height: 700.h,
                child: StreamBuilder<QuerySnapshot>(
                    stream: firestore,
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
                        return GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 164 / 245,
                          shrinkWrap: true,
                          children: List.generate(
                            snapshot.data!.docs.length,
                            (index) {
                              final title = snapshot.data!.docs[index]["title"]
                                  .toString();
                              if (search.text.isEmpty) {
                                return SizedBox();
                              } else if (title.toLowerCase().contains(search.text.toLowerCase().toString())) {
                                return GestureDetector(
                                  onTap: () {
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
                                                "₹${snapshot.data!.docs[index]["price"].toString()}",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                              ),
                                              Row(
                                                children: [
                                                  RatingBar.builder(
                                                    itemSize: 14.sp,
                                                    tapOnlyMode: true,
                                                    initialRating: double.parse(
                                                        snapshot
                                                            .data!
                                                            .docs[index]
                                                                ["rating"]
                                                            .toString()),
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemBuilder: (context, _) =>
                                                        Icon(
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
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            textStyle:
                                                                TextStyle(
                                                      color: Color(0xFFA4A9B3),
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
