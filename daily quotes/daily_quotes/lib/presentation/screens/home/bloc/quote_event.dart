part of 'quote_bloc.dart';

@freezed
sealed class QuoteEvent with _$QuoteEvent {
  const factory QuoteEvent.loadDailyQuote() = LoadDailyQuote;
  const factory QuoteEvent.togglefavorite(Quote quote) = Togglefavorite;
}
