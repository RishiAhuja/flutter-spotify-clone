import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/domain/repository/auth/auth_repo.dart';
import 'package:spotify/service_locator.dart';

class SignUpUsecase implements Usecase<Either, CreateUserRequest> {
  final AuthRepository authFirebaseService = sl<AuthRepository>();

  @override
  Future<Either> call({CreateUserRequest? params}) {
    //named parameters
    return authFirebaseService.signUp(params!);
  }
}


/*The library includes features such as 
Option, Either, Task, and more, which are 
commonly used in functional programming languages.*/

/*Either: Represents a value that can be one 
of two possible types, often used for error handling.*/
/*It has two possible types, left and right, left is used for
sending an error signal, and right is used for sending a success signal.*/
/*It is used to represent a value of one of two possible types (a disjoint union).*/

/*Option: Represents a value that may or may not be present.*/

/*Task: Represents an asynchronous computation*/