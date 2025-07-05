part of 'quote_bloc.dart';

@freezed
sealed class QuoteState with _$QuoteState {
  const factory QuoteState.initial() = Initial;
  const factory QuoteState.loading() = Loading;
  const factory QuoteState.loaded(Quote quote) = Loaded;
  const factory QuoteState.errors(String message) = Errors;

}
