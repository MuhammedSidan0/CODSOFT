import 'package:daily_quotes/domain/enitities/quotes.dart';
import 'package:daily_quotes/domain/repositories/quotes_repo.dart';

class Getfavorites {
  final QuoteRepository repository;

  Getfavorites(this.repository);

  Future<List<Quote>> call() => repository.getfavoriteQuotes();
}
