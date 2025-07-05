import 'package:daily_quotes/domain/enitities/quotes.dart';
import 'package:daily_quotes/domain/repositories/quotes_repo.dart';
import 'package:daily_quotes/infrastructure/data/hive_q_data_src.dart';
import 'package:daily_quotes/infrastructure/model/quote_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuoteRepositoryImpl implements QuoteRepository {
  final HiveQuoteDataSource localDataSource;

  QuoteRepositoryImpl(this.localDataSource);

  @override
  Future<Quote> getDailyQuote() async {
    try {
      final response = await http.get(
        Uri.parse('https://zenquotes.io/api/random'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is List && data.isNotEmpty) {
          final item = data[0];
          final text = item['q'] ?? '';
          final author = item['a'] ?? 'Unknown';
          final generatedId = '${text}_$author'; // stable ID

          return Quote(
            id: generatedId,
            text: text,
            author: author,
            isfavorite: await localDataSource.isfavorite(generatedId),
          );
        } else {
          throw Exception('Invalid response format.');
        }
      } else {
        throw Exception('Failed to load quote');
      }
    } catch (e) {
      throw Exception('Error fetching quote: $e');
    }
  }

  @override
  Future<void> addTofavorites(Quote quote) async {
    final model = QuoteModel.fromEntity(quote.copyWith(isfavorite: true));
    await localDataSource.addfavorite(model);
  }

  @override
  Future<void> removeFromfavorites(String id) async {
    await localDataSource.removefavorite(id);
  }

  @override
  Future<List<Quote>> getfavoriteQuotes() async {
    final models = await localDataSource.getAllfavorites();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<bool> isfavorite(String id) async {
    return await localDataSource.isfavorite(id);
  }
}
