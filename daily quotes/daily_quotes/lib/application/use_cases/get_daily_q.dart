

import 'package:daily_quotes/domain/enitities/quotes.dart';
import 'package:daily_quotes/domain/repositories/quotes_repo.dart';

class GetDailyQuote {
  final QuoteRepository repository;

  GetDailyQuote(this.repository);

  Future<Quote> call() async {
    return await repository.getDailyQuote();
  }
}
