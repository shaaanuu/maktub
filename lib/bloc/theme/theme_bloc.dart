import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeData currentTheme = _darkTheme;

  ThemeBloc() : super(ThemeState(themeData: _darkTheme)) {
    on<ToggleTheme>(
      (event, emit) {
        currentTheme = currentTheme == _darkTheme ? _lightTheme : _darkTheme;

        emit(ThemeState(
          themeData:
              currentTheme.brightness.name == 'dark' ? _darkTheme : _lightTheme,
        ));
      },
    );
  }

  static final ThemeData _darkTheme = ThemeData(brightness: Brightness.dark);
  static final ThemeData _lightTheme = ThemeData(brightness: Brightness.light);
}
