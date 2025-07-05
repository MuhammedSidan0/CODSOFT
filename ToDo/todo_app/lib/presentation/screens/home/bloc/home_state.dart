part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.loaded(List<Todo> todos) = Loaded;
  const factory HomeState.error(String message) = Error;
}
