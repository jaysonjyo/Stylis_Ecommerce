import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchingoption extends StatefulWidget {
  const Searchingoption({super.key});

  @override
  State<Searchingoption> createState() => _SearchingoptionState();
}

class _SearchingoptionState extends State<Searchingoption> {

 List<String> countries = [
   'United States',
   'Canada',
   'India',
   'Australia',
   'United Kingdom',
   'Germany',
   'United States',
   'Canada',
   'India',
   'Australia',
   'United Kingdom',
   'Germany',
   // Add more countries...
 ];
// List<String> filttereditems=[];
 // Future<void> Checkfavourite( String query) async {
 //   FirebaseAuth auth = FirebaseAuth.instance;
 //   final subcollection = FirebaseFirestore.instance
 //       .collection("ALL");
 //   QuerySnapshot querySnapshot = await subcollection.get();
 //   //filttereditems = querySnapshot.where((item)=>item.toLowerCase().contains(query.toLowerCase())).toList();
 //
 // }
// void filtteritems( String query){
//   setState(() {
//     final subcollection = FirebaseFirestore.instance
//         .collection("ALL");
//     filttereditems = items.where((item)=>item.toLowerCase().contains(query.toLowerCase())).toList();
//   });
// }
// @override
//   void initState() {
//   filttereditems=items;
//     // TODO: implement initState
//     super.initState();
//   }
  //List<QueryDocumentSnapshot> empty=[];
//   Future<void> searchData(String text)async{
//
//     final collection = FirebaseFirestore.instance
//         .collection("ALL");
//     QuerySnapshot querySnapshot = await collection.get();
//     for (int i = 0; i < querySnapshot.docs.length; i++) {
//       if (querySnapshot.docs[i]['title'].toLowerCase().contains(text.toLowerCase())) {
//         empty.add(querySnapshot.docs[i]);
//
//       } else {
//         print("not add");
//       }
//
//     }}
  final TextEditingController _controller = TextEditingController();
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
                  controller: _controller,
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


                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // StreamBuilder<QuerySnapshot>(
              //     stream: firestore,
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
                    // if (!snapshot.hasData) {
                    //   return Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // }
                    // if (snapshot.hasError) {
                    //   return Center(
                    //     child: Text("Error"),
                    //   );
                    // }
                    // if (snapshot.hasData) {
                       SizedBox(
                        width: double.infinity.w,
                        height: 700.h,
                        child: ListView.separated(
                            itemCount:countries.length,
                            scrollDirection: Axis.vertical,
                          itemBuilder: ( context, index) {
                              if(_controller.text.isEmpty){
                          return Container(
                           color: Colors.green,
                            child: Text(countries[index]),

                          );}else if (countries[index].toLowerCase().contains(_controller.text.toLowerCase().toLowerCase())){
                              return  Container(
                                  color: Colors.green,
                                  child: Text(countries[index]),

                                );
                              }else{
                                return SizedBox();
                              }
                        },
                                          separatorBuilder: (context, position) {
                              return SizedBox(height: 5.h,);
                            }
                        ),
                      )
                    // }
                    // else {
                    //   return SizedBox();
                    // }
                  // })
            ],
          ),
        ),
      ),
    );
  }
}
