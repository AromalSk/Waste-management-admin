part of 'splashscreen_bloc.dart';

@freezed
class SplashscreenEvent with _$SplashscreenEvent {
  const factory SplashscreenEvent.navigating(BuildContext context) = _Navigating;
}