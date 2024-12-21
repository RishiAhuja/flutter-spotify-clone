import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/domain/repository/auth/auth_repo.dart';
import 'package:spotify/service_locator.dart';

class SignInUsecase implements Usecase<Either, SigninUserRequest> {
  final AuthRepository authRepository = sl<AuthRepository>();
  @override
  Future<Either> call({SigninUserRequest? params}) async {
    return await authRepository.signIn(params!);
  }
}
