import 'package:daily_quotes/domain/enitities/quotes.dart';

abstract class QuoteRepository {
  Future<Quote> getDailyQuote();

  Future<List<Quote>> getfavoriteQuotes();

  Future<void> addTofavorites(Quote quote);

  Future<void> removeFromfavorites(String id);

  Future<bool> isfavorite(String id);
}
