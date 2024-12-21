import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';

abstract class AuthRepository {
  Future<Either> signIn(SigninUserRequest signinUserRequest);
  //abstract method or pure virtual functions
  Future<Either> signUp(CreateUserRequest createUserReq);
}
