import 'package:spotify/data/models/auth/create_user_request.dart';

abstract class AuthRepository {
  Future<void> signIn(); //abstract method or pure virtual functions
  Future<void> signUp(CreateUserRequest createUserReq);
}
