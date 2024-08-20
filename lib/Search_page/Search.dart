import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../Home_pages/Product_Details.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SpeechToText _speechToText=SpeechToText();
  bool _speechEnabled=false;


  //speech to text package
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      search.text = result.recognizedWords;
    });
  }
  //speech to text package
int index=0;
  final firestore = FirebaseFirestore.instance.collection("ALL").snapshots();
  TextEditingController search = TextEditingController();
@override
  void initState() {
  _initSpeech();
    // TODO: implement initState
    super.initState();
  }
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
                      suffixIcon: GestureDetector(onTap:
                        _speechToText.isNotListening ? _startListening:_stopListening,
                        child: Icon(_speechToText.isNotListening ? Icons.mic_off:
                          Icons.keyboard_voice_rounded,
                          color: Color(0xFFBBBBBB),
                        ),
                      )),
                  onChanged: (String value) {
                    setState(() {

                    });

                  },onTap: (){
                    setState(() {

                    });
                },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: firestore,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error"),);
                    }
                    if (snapshot.hasData) {

                      for(int i=0; i<snapshot.data!.docs.length;i++){
                        final title= snapshot.data!.docs[i]["title"].toString();
                        if(snapshot.data!.docs[i]["title"].toString().toLowerCase()==title.toLowerCase().contains(search.text.toLowerCase().toString())){
                          index=i;
                        }
                      }
                      return SizedBox(
                        width: double.infinity.w,
                        height: 600.h,
                        child: ListView.separated(
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              final title= snapshot.data!.docs[index]["title"].toString();
                              if(search.text.isEmpty){
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) =>
                                            ProductDetails(listimage: snapshot.data!.docs[index]["listimage"],
                                                title: snapshot.data!.docs[index]["title"].toString(),
                                                rating: snapshot.data!.docs[index]["rating"].toString(),
                                                priceoffer: snapshot.data!.docs[index]["priceoffer"].toString(),
                                                price: snapshot.data!.docs[index]["price"].toString(),
                                                offer: snapshot.data!.docs[index]["offer"].toString(),
                                                description: snapshot.data!.docs[index]["description"].toString(),
                                                id: snapshot.data!.docs[index]["id"].toString(),
                                                about: snapshot.data!.docs[index]["about"].toString())
                                    ));
                                  },
                                  child: Container(
                                    width: 331.w,
                                    height: 160.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6.r)),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 14.r,
                                          offset: Offset(0, 6),
                                          spreadRadius: -8.r,
                                        ),
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 9.r,
                                          offset: Offset(0, -4),
                                          spreadRadius: -7.r,
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 10.h),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: 130.53.w,
                                                height: 125.h,
                                                child: Image.network(
                                                  snapshot.data!
                                                      .docs[index]["listimage"][0]
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.symmetric(vertical: 15.h),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    SizedBox(
                                                      width: 162.w,
                                                      child: Text(
                                                        snapshot.data!
                                                            .docs[index]["title"]
                                                            .toString(),
                                                        maxLines: 1,
                                                        style: GoogleFonts.montserrat(
                                                            textStyle: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14.sp,
                                                              fontWeight: FontWeight
                                                                  .w600,
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.h,),
                                                    SizedBox(height: 20.h,width: 170.w,
                                                      child: Text(
                                                        snapshot.data!.docs[index]["about"].toString(),
                                                        maxLines: 2,
                                                        style: GoogleFonts.montserrat(
                                                            textStyle: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight.w400,
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.h,),
                                                    Text(
                                                        "₹${snapshot.data!.docs[index]["price"].toString().toString()}",
                                                        style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "₹${snapshot.data!.docs[index]["priceoffer"].toString().toString()}",
                                                          //'₹4999'
                                                          style: GoogleFonts.montserrat(
                                                            textStyle: TextStyle(
                                                                decoration:
                                                                TextDecoration.lineThrough,
                                                                color: Color(0xFF808488),
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.w300),
                                                          ),
                                                        ),
                                                        SizedBox(width: 5.w,),
                                                        Text(
                                                          " ${snapshot.data!.docs[index]["offer"].toString()}%Off",
                                                          //'50%Off',
                                                          style: GoogleFonts.montserrat(
                                                              textStyle: TextStyle(
                                                                color: Color(0xFFFE735C),
                                                                fontSize: 10.sp,
                                                                fontWeight: FontWeight.w400,
                                                              )),
                                                        )
                                                      ],
                                                    ),

                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${snapshot.data!.docs[index]["rating"].toString()} :",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                              textStyle: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                              )),
                                                        ),
                                                        SizedBox(width: 5.w,),
                                                        RatingBar.builder(
                                                          itemSize:14.sp,
                                                          tapOnlyMode: true,
                                                          initialRating: double.parse(
                                                              snapshot.data!
                                                                  .docs[index]["rating"]
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
                                                      ],
                                                    ), SizedBox(height: 8.h,),

                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }else if(title.toLowerCase().contains(search.text.toLowerCase().toString())){
                              return GestureDetector(
                                onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                   ProductDetails(listimage: snapshot.data!.docs[index]["listimage"],
                                       title: snapshot.data!.docs[index]["title"].toString(),
                                       rating: snapshot.data!.docs[index]["rating"].toString(),
                                       priceoffer: snapshot.data!.docs[index]["priceoffer"].toString(),
                                       price: snapshot.data!.docs[index]["price"].toString(),
                                       offer: snapshot.data!.docs[index]["offer"].toString(),
                                       description: snapshot.data!.docs[index]["description"].toString(),
                                       id: snapshot.data!.docs[index]["id"].toString(),
                                       about: snapshot.data!.docs[index]["about"].toString())
                                ));
                              },
                                child: Container(
                                  width: 331.w,
                                  height: 160.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.r)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 14.r,
                                        offset: Offset(0, 6),
                                        spreadRadius: -8.r,
                                      ),
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 9.r,
                                        offset: Offset(0, -4),
                                        spreadRadius: -7.r,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 10.h),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 130.53.w,
                                              height: 125.h,
                                              child: Image.network(
                                                snapshot.data!
                                                    .docs[index]["listimage"][0]
                                                    .toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 15.h),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  SizedBox(
                                                    width: 162.w,
                                                    child: Text(
                                                      snapshot.data!
                                                          .docs[index]["title"]
                                                          .toString(),
                                                      maxLines: 1,
                                                      style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight
                                                                .w600,
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.h,),
                                                  SizedBox(height: 20.h,width: 170.w,
                                                    child: Text(
                                                      snapshot.data!.docs[index]["about"].toString(),
                                                      maxLines: 2,
                                                      style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10.sp,
                                                            fontWeight: FontWeight.w400,
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.h,),
                                                  Text(
                                                      "₹${snapshot.data!.docs[index]["price"].toString().toString()}",
                                                      style: GoogleFonts.montserrat(
                                                        textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "₹${snapshot.data!.docs[index]["priceoffer"].toString().toString()}",
                                                        //'₹4999'
                                                        style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(
                                                              decoration:
                                                              TextDecoration.lineThrough,
                                                              color: Color(0xFF808488),
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w300),
                                                        ),
                                                      ),
                                                      SizedBox(width: 5.w,),
                                                      Text(
                                                        " ${snapshot.data!.docs[index]["offer"].toString()}%Off",
                                                        //'50%Off',
                                                        style: GoogleFonts.montserrat(
                                                            textStyle: TextStyle(
                                                              color: Color(0xFFFE735C),
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight.w400,
                                                            )),
                                                      )
                                                    ],
                                                  ),

                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${snapshot.data!.docs[index]["rating"].toString()} :",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                            textStyle: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14.sp,
                                                              fontWeight: FontWeight
                                                                  .w500,
                                                            )),
                                                      ),
                                                      SizedBox(width: 5.w,),
                                                      RatingBar.builder(
                                                        itemSize:14.sp,
                                                        tapOnlyMode: true,
                                                        initialRating: double.parse(
                                                            snapshot.data!
                                                                .docs[index]["rating"]
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
                                                    ],
                                                  ), SizedBox(height: 8.h,),

                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10.h,),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              }else{
                                return Container();
                              }
                            },
                            separatorBuilder: (context, position) {
                              return SizedBox(
                                height: 10.h
                                ,
                              );
                            }),
                      );
                    }
                    else {
                      return SizedBox();
                    }
                  }
              ),
//               SizedBox(
//                 width: double.infinity.w,
//                 height: 700.h,
//                 child: StreamBuilder<QuerySnapshot>(
//                     stream: firestore,
//                     builder: (BuildContext context,
//                         AsyncSnapshot<QuerySnapshot> snapshot) {
//                       if (!snapshot.hasData) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                       if (snapshot.hasError) {
//                         return Center(
//                           child: Text("Error"),
//                         );
//                       }
//                       if (snapshot.hasData) {
//
//                         return GridView.count(
//
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 6.0,
//                           mainAxisSpacing: 10.0,
//                           childAspectRatio: 164 / 245,
//                           shrinkWrap: true,
//                           children: List.generate(
//                             snapshot.data!.docs.length,
//                             (index) {
//                               final title = snapshot.data!.docs[index]["title"]
//                                   .toString();
//                               if (search.text.isEmpty) {
// return SizedBox();
//                               }
//                               else if (title.toLowerCase().contains(
//                                   search.text.toLowerCase())) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(builder: (_) =>
//                                             ProductDetails(
//                                               listimage: snapshot.data!
//                                                   .docs[index]["listimage"],
//                                               title: snapshot.data!
//                                                   .docs[index]["title"]
//                                                   .toString(),
//                                               rating: snapshot.data!
//                                                   .docs[index]["rating"]
//                                                   .toString(),
//                                               priceoffer: snapshot.data!
//                                                   .docs[index]["priceoffer"]
//                                                   .toString()
//                                                   .toString(),
//                                               price: snapshot.data!
//                                                   .docs[index]["price"]
//                                                   .toString()
//                                                   .toString(),
//                                               offer: snapshot.data!
//                                                   .docs[index]["offer"]
//                                                   .toString(),
//                                               description: snapshot.data!
//                                                   .docs[index]["description"]
//                                                   .toString(),
//                                               id: snapshot.data!
//                                                   .docs[index]["id"].toString(),
//                                               about: snapshot.data!
//                                                   .docs[index]["about"]
//                                                   .toString(),
//
//                                             )));
//                                   },
//                                   child: Container(
//                                     width: 164.w,
//                                     height: 245.h,
//                                     decoration: ShapeDecoration(
//                                       color: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(8.r)),
//                                       shadows: [
//                                         BoxShadow(
//                                           color: Color(0x26000000),
//                                           blurRadius: 2.r,
//                                           offset: Offset(0, 2),
//                                           spreadRadius: 0.r,
//                                         )
//                                       ],
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.only(
//                                               topRight: Radius.circular(6.r),
//                                               topLeft: Radius.circular(6.r)),
//                                           child: SizedBox(
//                                               width: 164.w,
//                                               height: 136.h,
//                                               child: Image.network(
//                                                 snapshot.data!
//                                                     .docs[index]["listimage"][0]
//                                                     .toString(),
//                                                 fit: BoxFit.cover,
//                                               )),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 5.w),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             children: [
//                                               SizedBox(
//                                                 height: 5.h,
//                                               ),
//                                               Text(
//                                                 snapshot
//                                                     .data!.docs[index]["title"]
//                                                     .toString(),
//                                                 maxLines: 1,
//                                                 style: GoogleFonts.montserrat(
//                                                     textStyle: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 16.sp,
//                                                       fontWeight: FontWeight
//                                                           .w500,
//                                                     )),
//                                               ),
//                                               SizedBox(
//                                                 height: 3.h,
//                                               ),
//                                               Text(
//                                                 snapshot
//                                                     .data!.docs[index]["about"]
//                                                     .toString(),
//                                                 maxLines: 2,
//                                                 style: GoogleFonts.montserrat(
//                                                     textStyle: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 10.sp,
//                                                       fontWeight: FontWeight
//                                                           .w400,
//                                                     )),
//                                               ),
//                                               SizedBox(
//                                                 height: 3.h,
//                                               ),
//                                               Text(
//                                                 "₹${snapshot.data!
//                                                     .docs[index]["price"]
//                                                     .toString()}",
//                                                 style: GoogleFonts.montserrat(
//                                                     textStyle: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 12.sp,
//                                                       fontWeight: FontWeight
//                                                           .w500,
//                                                     )),
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   RatingBar.builder(
//                                                     itemSize: 14.sp,
//                                                     tapOnlyMode: true,
//                                                     initialRating: double.parse(
//                                                         snapshot
//                                                             .data!
//                                                             .docs[index]
//                                                         ["rating"]
//                                                             .toString()),
//                                                     minRating: 1,
//                                                     direction: Axis.horizontal,
//                                                     allowHalfRating: true,
//                                                     itemCount: 5,
//                                                     itemBuilder: (context, _) =>
//                                                         Icon(
//                                                           Icons.star,
//                                                           color: Colors.amber,
//                                                         ),
//                                                     onRatingUpdate: (rating) {
//                                                       print(rating);
//                                                     },
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5.w,
//                                                   ),
//                                                   Text(
//                                                     '1,52,344',
//                                                     style:
//                                                     GoogleFonts.montserrat(
//                                                         textStyle:
//                                                         TextStyle(
//                                                           color: Color(
//                                                               0xFFA4A9B3),
//                                                           fontSize: 10.sp,
//                                                           fontWeight:
//                                                           FontWeight.w400,
//                                                         )),
//                                                   )
//                                                 ],
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               } else {
//                                 return Container(color: Colors.red,);
//                               }
//                             }
//                           ),
//                         );
//                       } else {
//                         return SizedBox();
//                       }
//                     }),
//               )

            ],
          ),
        ),
      ),
    );
  }
}
