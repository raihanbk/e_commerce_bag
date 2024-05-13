import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
 on<RegisterInitialEvent>(registerInitialEvent);
 on<StoreDataEvent>(storeDataEvent);
  }

  FutureOr<void> registerInitialEvent(RegisterInitialEvent event, Emitter<RegisterState> emit) {

    emit(RegisterLoadedState());
  }

  FutureOr<void> storeDataEvent(StoreDataEvent event, Emitter<RegisterState> emit) async{
    late SharedPreferences preferences;
    preferences = await SharedPreferences.getInstance();
    preferences.setString("name", event.name);
    preferences.setString("email", event.email);
    preferences.setString('password', event.password);
    print("Entered name: ${event.name}");

    emit(RegisterLoadedState());

  }
}
