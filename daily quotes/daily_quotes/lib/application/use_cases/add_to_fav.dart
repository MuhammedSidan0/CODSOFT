import 'package:daily_quotes/domain/enitities/quotes.dart';
import 'package:daily_quotes/domain/repositories/quotes_repo.dart';

class AddTofavorites {
  final QuoteRepository repository;

  AddTofavorites(this.repository);

  Future<void> call(Quote quote) async {
    await repository.addTofavorites(quote);
  }
}
