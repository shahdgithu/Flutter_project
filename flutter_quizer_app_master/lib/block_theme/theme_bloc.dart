import 'package:bloc/bloc.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDarkTheme: false)) {
    on<ChangeTheme>(
      (event, emit) {
        if (state.isDarkTheme) {
          emit(state.copyWith(isDarkTheme: false));
        } else {
          emit(state.copyWith(isDarkTheme: true));
        }
      },
    );
  }
}


abstract class ThemeEvent {}

class ChangeTheme extends ThemeEvent {}
