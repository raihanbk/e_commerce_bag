part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageEvent {}

class LoginInitialEvent extends LoginPageEvent{}
class ValidateEvent extends LoginPageEvent{
  final String email;
  final String password;

  ValidateEvent({required this.email, required this.password});
}
