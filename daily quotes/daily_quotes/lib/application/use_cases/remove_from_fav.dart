import 'package:daily_quotes/domain/repositories/quotes_repo.dart';

class RemoveFromfavorites {
  final QuoteRepository repository;

  RemoveFromfavorites(this.repository);

  Future<void> call(String id) async {
    await repository.removeFromfavorites(id);
  }
}
