// import 'package:flutter_bloc/flutter_bloc.dart';   // hydrated_bloc 에 포함됨.
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart'; // lutter_bloc 의 확장
import 'dart:convert';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ThemeToggledEvent>((event, emit) {
      emit(state.copyWith(
          appTheme: state.appTheme == AppTheme.light
              ? AppTheme.dark
              : AppTheme.light));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    print('*** Theme from storage : $json');
    final themeState = ThemeState.fromMap(json);
    print('*** themeState : $themeState');
    return themeState;
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    print('*** Theme state to storage : $state');
    final themeJson = state.toMap();
    print('*** themeJson: $themeJson');
    return themeJson;
  }
}
