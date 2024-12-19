import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repo_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth_repo.dart';

final sl = GetIt.instance;

//We need a future to register all the dependencies, repositories and usecases

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
      AuthFirebaseServiceImplementation());

  sl.registerSingleton<AuthRepository>(AuthRepoImplementation());
}
