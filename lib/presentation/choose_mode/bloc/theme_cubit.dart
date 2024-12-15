import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit()
      : super(ThemeMode
            .system); //calling and initializing the constructor of the super class
  //ThemeMode.system is a predefined enum value
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    print("fromJson: $json");
    try {
      return ThemeMode.values[json['themeMode'] as int];
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    /*enum provides the index of the value in the enum the returns its position in it, 
    hence a key and value pair of the enum and the index is being stored as a json. */
    print("toJson: ${state.index}");
    try {
      return {'themeMode': state.index};
    } catch (_) {
      return null;
    }
  }

  void updateTheme(ThemeMode mode) => emit(mode);
}

/*

1. State Emission and Caching:

- Whenever the ThemeCubit emits a new state (i.e., a new ThemeMode), the toJson method is called.
- The toJson method converts the ThemeMode state into a JSON map.
- This JSON map is then stored in the system as a cache by the HydratedCubit

2. App Restart and State Restoration:

- When the app restarts, the HydratedCubit attempts to restore the last known state.
- It calls the fromJson method, passing the cached JSON map.
- The fromJson method converts the JSON map back into a ThemeMode object.
- The restored ThemeMode state is then used as the initial state of the ThemeCubit

 */