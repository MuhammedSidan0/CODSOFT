import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes.freezed.dart';

@freezed
abstract class Quote with _$Quote {
  const factory Quote({
    required String id,
    required String text,
    required String author,
    @Default(false) bool isfavorite,
  }) = _Quote;
}
