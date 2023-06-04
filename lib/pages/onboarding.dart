import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../util/app_layout.dart';
import 'bloc/onboarding_bloc.dart';
import 'bloc/onboarding_event.dart';
import 'bloc/onboarding_state.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          body: BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(top: 40.h),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<OnboardingBloc>(context).add(OnboardingEvent());
                      },
                      children: [
                        _page(
                            1,
                            context,
                            'assets/image1.jpg',
                            'This is title one',
                            'This is the subtitle of the header text in a grey color to the title black color.',
                            'Next'
                        ),
                        _page(
                            2,
                            context,
                            'assets/image2.jpg',
                            'This is title two',
                            'This is the subtitle of the header text in a grey color to the title black color.',
                            'Next'
                        ),
                        _page(
                            3,
                            context,
                            'assets/image3.jpg',
                            'This is title three',
                            'This is the subtitle of the header text in a grey color to the title black color.',
                            'Get Started'
                        ),
                      ],
                    ),
                    //AppLayout.getHeight(GetPlatform.isAndroid == true? 167 : 169)
                    Positioned(
                        bottom: AppLayout.getHeight(GetPlatform.isAndroid == true ? 60.h : 100.h),
                        child: DotsIndicator(
                          mainAxisAlignment: MainAxisAlignment.center,
                          position: state.page,
                          dotsCount: 3,
                          decorator: DotsDecorator(
                            color: Colors.grey.withOpacity(0.5),
                            activeColor: Colors.blue,
                            size: const Size.square(8.0),
                            activeSize: const Size(18.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            )
                          ),
                        )
                    )
                  ],
                ),
              );
            },
          )
      ),
    );
  }

  Widget _page(
      int index,
      BuildContext context,
      String illustration,
      String title,
      String subTitle,
      String buttonText
      ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(illustration),
        ),
        Container(
          child: Text(title, style: TextStyle(color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.normal),),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.sp, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 325.w,
          height: 40.h,
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                spreadRadius: 2
              )
            ]
          ),
          child: Center(child: Text(buttonText, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.normal)),),
        )
      ],
    );
  }
}
