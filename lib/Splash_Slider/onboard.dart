import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stylis_ecommerce/Splash_Slider/Splash.dart';
import 'package:stylis_ecommerce/authentication/Login.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  //onboard
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Login()),
    );
  }

  //onboard_end
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroductionScreen(bodyPadding: EdgeInsets.only(top: 100.h),
        key: introKey,
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: false,
        autoScrollDuration: 3000,
        infiniteAutoScroll: false,
        globalHeader: Align(
          alignment: Alignment.topRight,
        ),
        globalFooter: SizedBox(
          width: double.infinity,
          height: 60.h,
        ),
        pages: [
          //first
          PageViewModel(
              titleWidget:Text(
              'Choose Products',
              style:GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
              ),
              ),),
              bodyWidget: SizedBox(
                width: 340.w,
                child: Text(
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle:TextStyle(
                    color: Color(0xFFA8A8A9),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.28.w,
                  ),
                ),
              )),
              image: SizedBox(height: 300.h,width: 300.w,child: Image.asset("assets/b.png",fit: BoxFit.cover,))),
          //second
          PageViewModel(
              titleWidget:Text(
                'Make Payment',
                textAlign: TextAlign.center,
                style:GoogleFonts.montserrat(
                  textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),
              ) ),
              bodyWidget: SizedBox(
                width: 340.w,
    child: Text(
    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    textAlign: TextAlign.center,
    style:GoogleFonts.montserrat(
    textStyle: TextStyle(
    color: Color(0xFFA8A8A9),
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.28.sp,
    ),
    ),
    ),),
              image: SizedBox( width: 350.w,
    height: 233.33.h,child: Image.asset("assets/c.png",fit: BoxFit.cover,))
          ),
          //thierd
          PageViewModel(

            titleWidget: Text(
              'Get Your Order',
              textAlign: TextAlign.center,
              style:GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
              ),
            ),),
              bodyWidget:SizedBox(
              width: 340.w,
              child: Text(
    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    textAlign: TextAlign.center,
    style:GoogleFonts.montserrat(
      textStyle:  TextStyle(
    color: Color(0xFFA8A8A9),
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.28.w,
    ),
    ),
    )),
              image: SizedBox(  width: 350.w,
    height: 350.h,child: Image.asset("assets/d.png",fit: BoxFit.cover,))),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back),
        skip: Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next:SizedBox(
          width: 44.w,
          height: 22.85.h,
          child: Text(
            'Next',
            textAlign: TextAlign.center,
            style:GoogleFonts.montserrat(textStyle:  TextStyle(
              color: Color(0xFFF73658),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),)
          ),
        ),
        done: Text(
          'Get Started',
          textAlign: TextAlign.center,
          style:GoogleFonts.montserrat(textStyle:  TextStyle(
            color: Color(0xFFF73658),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),)
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: EdgeInsets.all(16.sp),
        controlsPadding: kIsWeb
            ? EdgeInsets.all(12.0.sp)
            : EdgeInsets.fromLTRB(8.0.w, 4.0.h, 8.0.w, 4.0.h),
        dotsDecorator: DotsDecorator(
          size: Size(10.0.sp, 10.0.sp),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0.sp, 10.0.sp),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
          ),
        ),
        dotsContainerDecorator: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
          ),
        ),
      ),
    );
  }
}
