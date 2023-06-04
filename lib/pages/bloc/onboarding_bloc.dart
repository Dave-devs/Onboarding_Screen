import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_in_flutter/pages/bloc/onboarding_event.dart';
import 'package:onboarding_in_flutter/pages/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(): super(OnboardingState()) {

    on<OnboardingEvent>((event, emit){
      emit(OnboardingState(page: state.page));
    });
  }
}