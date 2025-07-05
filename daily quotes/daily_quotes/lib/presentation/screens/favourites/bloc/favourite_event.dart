part of 'favourite_bloc.dart';

@freezed
sealed class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.loadFavorites() = LoadFavorites;
  const factory FavoritesEvent.removeFavorite(String id) = RemoveFavorite;
}
