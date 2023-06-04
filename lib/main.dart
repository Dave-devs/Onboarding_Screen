import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding_in_flutter/pages/bloc/onboarding_bloc.dart';
import 'package:onboarding_in_flutter/pages/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnboardingBloc(),
        child: ScreenUtilInit(
          builder: (context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Onboarding(),
          ),
        )
    );
  }
}
