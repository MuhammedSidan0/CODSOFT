import 'package:daily_quotes/infrastructure/model/quote_model.dart';
import 'package:hive_ce/hive.dart';

class HiveQuoteDataSource {
  static const String boxName = 'favorite_quotes';

  Future<Box<QuoteModel>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<QuoteModel>(boxName);
    }
    return Hive.box<QuoteModel>(boxName);
  }

  Future<List<QuoteModel>> getAllfavorites() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> addfavorite(QuoteModel quote) async {
    final box = await _openBox();
    await box.put(quote.id, quote);
  }

  Future<void> removefavorite(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }

  Future<bool> isfavorite(String id) async {
    final box = await _openBox();
    return box.containsKey(id);
  }
}
