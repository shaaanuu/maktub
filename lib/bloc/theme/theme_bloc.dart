import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  Box? settingsBox;

  ThemeBloc() : super(ThemeState(themeData: _lightTheme)) {
    _initHiveBox().then((_) {
      _loadThemePreference().then((theme) {
        emit(ThemeState(
            themeData: theme == Brightness.dark ? _darkTheme : _lightTheme));
      });
    });

    on<ToggleThemeEvent>((event, emit) async {
      final newTheme = state.themeData.brightness == Brightness.dark
          ? _lightTheme
          : _darkTheme;
      emit(ThemeState(themeData: newTheme));
      await _saveThemePreference(newTheme.brightness);
    });
  }

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  Future<void> _initHiveBox() async {
    settingsBox = await Hive.openBox('settings');
  }

  Future<void> _saveThemePreference(Brightness brightness) async {
    if (settingsBox != null) {
      await settingsBox!
          .put('theme', brightness == Brightness.dark ? 'dark' : 'light');
    }
  }

  Future<Brightness> _loadThemePreference() async {
    final theme = settingsBox?.get('theme');
    return theme == 'dark' ? Brightness.dark : Brightness.light;
  }
}
