import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth_repo.dart';
import 'package:spotify/service_locator.dart';

class AuthRepoImplementation extends AuthRepository {
  // Keep using service locator directly
  final AuthFirebaseService authFirebaseService = sl<AuthFirebaseService>();

  @override
  Future<Either> signIn(SigninUserRequest signinUserRequest) async {
    return await authFirebaseService.signIn(signinUserRequest);
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserReq) async {
    return await authFirebaseService.signUp(createUserReq);
  }
}
