part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark;

  String toMap() => name;

  static AppTheme fromMap(String json) => values.byName(json);
}

class ThemeState extends Equatable {
  final AppTheme appTheme;

  const ThemeState({this.appTheme = AppTheme.light});

  factory ThemeState.initial() => const ThemeState();

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';

  Map<String, dynamic> toMap() {
    return {
      'appTheme': appTheme.toMap(),
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      appTheme: AppTheme.fromMap(map['appTheme']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeState.fromJson(String source) =>
      ThemeState.fromMap(json.decode(source));
}
