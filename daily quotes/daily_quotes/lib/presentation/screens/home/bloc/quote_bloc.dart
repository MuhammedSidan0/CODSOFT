import 'package:daily_quotes/application/use_cases/add_to_fav.dart';
import 'package:daily_quotes/application/use_cases/get_daily_q.dart';
import 'package:daily_quotes/application/use_cases/remove_from_fav.dart';
import 'package:daily_quotes/domain/enitities/quotes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_event.dart';
part 'quote_state.dart';
part 'quote_bloc.freezed.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final GetDailyQuote getDailyQuote;
  final AddTofavorites addTofavorites;
  final RemoveFromfavorites removeFromfavorites;

  QuoteBloc({
    required this.getDailyQuote,
    required this.addTofavorites,
    required this.removeFromfavorites
  }) : super(const QuoteState.initial()) {
    on<QuoteEvent>((event, emit) async {
      switch (event) {
        case LoadDailyQuote():
          emit(const QuoteState.loading());
          try {
            final quote = await getDailyQuote();
            emit(QuoteState.loaded(quote));
          } catch (e) {
            emit(QuoteState.errors('Failed to load quote.'));
          }
          break;

        case Togglefavorite(:final quote):
          try {
            if (quote.isfavorite) {
              await removeFromfavorites(quote.id);
            } else {
              await addTofavorites(quote);
            }
            final updated = quote.copyWith(isfavorite: !quote.isfavorite);
            emit(QuoteState.loaded(updated));
          } catch (e) {
            emit(QuoteState.errors('Failed to update favorite.'));
          }
          break;
      }
    });
  }
}
