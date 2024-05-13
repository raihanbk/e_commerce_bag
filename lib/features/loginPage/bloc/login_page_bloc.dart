import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<ValidateEvent>(validateEvent);
  }

  FutureOr<void> loginInitialEvent(
      LoginInitialEvent event, Emitter<LoginPageState> emit) {
    emit(LoginPageLoadedState());
  }

  FutureOr<void> validateEvent(
      ValidateEvent event, Emitter<LoginPageState> emit) async {
    try {
      late SharedPreferences preferences;
      preferences = await SharedPreferences.getInstance();
      if (event.email == preferences.getString("email") &&
          event.password == preferences.getString("password")) {
    emit(LoginPageLoadedState());
      }
    } catch (e) {
      print("error");
    }
  }
}
