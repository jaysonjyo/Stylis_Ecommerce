import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  final int index;

  const Edit({super.key, required this.index});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  File? image;
  final picker = ImagePicker();
  final auth = FirebaseAuth.instance;
  final refupdate = FirebaseFirestore.instance.collection("users");
  TextEditingController name = TextEditingController();
  FirebaseStorage storage = FirebaseStorage.instance;
  final firestoreprofile =
      FirebaseFirestore.instance.collection("users").snapshots();

  Future getImageGallery(AsyncSnapshot<QuerySnapshot> snapshot) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() async {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        final id = DateTime.now().microsecondsSinceEpoch.toString();
        Reference reference = storage.ref("/profileimage/" + id);
        UploadTask uploadTask = reference.putFile(image!.absolute);
        await Future.value(uploadTask).then((onValue) async {
          dynamic newurl = await reference.getDownloadURL();
          refupdate
              .doc(snapshot.data!.docs[widget.index]["id"].toString())
              .update({"profile": newurl.toString()}).then((onValue) {
            Fluttertoast.showToast(msg: 'Uploaded');
            Navigator.of(context).pop();
          }).onError((error, StackTrace) {
            Fluttertoast.showToast(msg: 'error');
          });
        });
      } else {
        print("No image Picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h),
          child: StreamBuilder<QuerySnapshot>(
              stream: firestoreprofile,
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
                  return Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 96.w,
                                  height: 96.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot
                                          .data!.docs[widget.index]["profile"]
                                          .toString()),
                                      fit: BoxFit.fill,
                                    ),
                                    //image: NetworkImage(snapshot.data!.docs[index]["profile"].toString()),
                                    // fit: BoxFit.fill,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 65.h, left: 65.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      getImageGallery(snapshot);
                                    },
                                    child: Container(
                                      width: 32.w,
                                      height: 32.h,
                                      decoration: ShapeDecoration(
                                          color: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 3.w,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(20.r))),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Container(
                        color: Colors.black12,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.person_outlined,
                                color: Colors.grey,
                                size: 27.sp,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
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
                                    GestureDetector(
                                          onTap: () {
                                                showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                            return Expanded(
                                                                  child: AlertDialog(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(
                                                                                    10.0.r))),
                                                                        title: Text("Enter your name"),
                                                                        content: TextField(
                                                                              controller: name,
                                                                              decoration: InputDecoration(
                                                                                  border:
                                                                                  OutlineInputBorder()),
                                                                        ),
                                                                        actions: [
                                                                              TextButton(
                                                                                    onPressed: () {
                                                                                          Navigator.of(context)
                                                                                              .pop();
                                                                                    },
                                                                                    child: Text('CANCEL'),
                                                                              ),
                                                                              TextButton(
                                                                                    onPressed: () {
                                                                                          refupdate
                                                                                              .doc(snapshot
                                                                                              .data!
                                                                                              .docs[widget
                                                                                              .index]["id"]
                                                                                              .toString())
                                                                                              .update({
                                                                                                "name": name.text
                                                                                          }).then((onValue) {
                                                                                                name.clear();
                                                                                                Fluttertoast.showToast(
                                                                                                    msg:
                                                                                                    'Updated');
                                                                                                Navigator.of(context)
                                                                                                    .pop();
                                                                                          }).onError((error,
                                                                                              stackTrace) {
                                                                                                Fluttertoast.showToast(
                                                                                                    msg: 'Error');
                                                                                          });
                                                                                    },
                                                                                    child: Text('OK'),
                                                                              ),
                                                                        ],
                                                                  ),
                                                            );
                                                      },
                                                );
                                          },
                                      child: Text(
                                        snapshot.data!.docs[widget.index]["name"]
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 0.24.w,
                                        )),
                                      ),
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Divider(
                          height: 1.h,
                          thickness: 1.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 200.h,
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              }),
        ),
      ),
    );
  }
}
