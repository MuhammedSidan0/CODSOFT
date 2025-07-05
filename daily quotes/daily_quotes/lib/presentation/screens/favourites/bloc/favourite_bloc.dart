
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:daily_quotes/domain/enitities/quotes.dart';
import 'package:daily_quotes/application/use_cases/get_fav.dart';
import 'package:daily_quotes/application/use_cases/remove_from_fav.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';
part 'favourite_bloc.freezed.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final Getfavorites getFavorites;
  final RemoveFromfavorites removeFromFavorites;

  FavoritesBloc(this.getFavorites, this.removeFromFavorites)
      : super(const FavoritesState.initial()) {
    on<LoadFavorites>((event, emit) async {
      emit(const FavoritesState.loading());
      try {
        final quotes = await getFavorites();
        emit(FavoritesState.loaded(quotes));
      } catch (e) {
        emit(const FavoritesState.errors("Failed to load favorites"));
      }
    });

    on<RemoveFavorite>((event, emit) async {
      try {
        await removeFromFavorites(event.id);
        final quotes = await getFavorites(); // refresh list
        emit(FavoritesState.loaded(quotes));
      } catch (e) {
        emit(const FavoritesState.errors("Failed to remove quote"));
      }
    });
  }
}
