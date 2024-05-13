part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageState {}
abstract class LoginPageActionState extends LoginPageState {}

class LoginPageInitial extends LoginPageState {}

class LoginPageLoadedState extends LoginPageState {}
class NavigateActionState extends LoginPageActionState{}
