import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth_repo.dart';
import 'package:spotify/service_locator.dart';

class AuthRepoImplementation extends AuthRepository {
  final AuthFirebaseService authFirebaseService = sl<AuthFirebaseService>();

  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(CreateUserRequest createUserReq) async {
    await authFirebaseService.signUp(createUserReq);
  }
}
