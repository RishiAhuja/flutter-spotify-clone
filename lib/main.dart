import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify/core/configs/theme/app_theme.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify/presentation/pages/splash/splash.dart';
import 'package:spotify/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies(); //under global service locator
  runApp(const MyApp());
}

/*
MultiBlocProvider allows to provide multiple Bloc or Cubit instances to the widget tree,
making them accessible to any descendant widgets.
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit())
        //creates and provides an instance of the ThemeCubit to the widget tree
        //_ is a convention to indicate that the parameter is not used but is a buildcontext injecting into the cubit
      ],
      //listening to the state of the ThemeCubit and state is of type ThemeMode
      //rebuilding the MaterialApp widget
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        /*
         It is used to rebuild parts of the widget 
         tree in response to state changes in a Bloc or Cubit.*/
        /*
        BlocBuilder listens to the state of the specified Bloc or Cubit
        and calls its builder function whenever the state changes.*/
        builder: (context, mode) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          color: Colors.green,
          themeMode: mode,
          title: 'Spotify',
          home: const Splash(),
        ),
      ),
    );
  }
}
