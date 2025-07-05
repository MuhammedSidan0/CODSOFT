import 'package:daily_quotes/domain/enitities/quotes.dart';
import 'package:hive_ce/hive.dart';

part 'quote_model.g.dart';

@HiveType(typeId: 1)
class QuoteModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final bool isfavorite;

  QuoteModel({
    required this.id,
    required this.text,
    required this.author,
    required this.isfavorite,
  });

  factory QuoteModel.fromEntity(Quote quote) {
    return QuoteModel(
      id: quote.id,
      text: quote.text,
      author: quote.author,
      isfavorite: quote.isfavorite,
    );
  }

  Quote toEntity() {
    return Quote(id: id, text: text, author: author, isfavorite: isfavorite);
  }
}
