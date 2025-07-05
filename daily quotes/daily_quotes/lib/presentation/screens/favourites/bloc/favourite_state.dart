part of 'favourite_bloc.dart';



@freezed
sealed class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = Initial;
  const factory FavoritesState.loading() = Loading;
  const factory FavoritesState.loaded(List<Quote> quotes) = Loaded;
  const factory FavoritesState.errors(String message) = Errors;
}
