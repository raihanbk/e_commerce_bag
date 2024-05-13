part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterInitialEvent extends RegisterEvent{}

class StoreDataEvent extends RegisterEvent{
  final String name;
  final String email;
  final String password;

  StoreDataEvent({required this.name, required this.email, required this.password});
}
