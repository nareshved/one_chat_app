part of 'register_bloc.dart';


abstract class ChatEvents {}


class CreateUserEvent extends ChatEvents{
  UserModel newUser;
  String pass;
  CreateUserEvent({required this.newUser, required this.pass});
}


class LoginUserEvent extends ChatEvents {

  String loginEmail;
  String loginPassword;

  LoginUserEvent({required this.loginEmail, required this.loginPassword});
}


class LogOutUserEvent extends ChatEvents {}