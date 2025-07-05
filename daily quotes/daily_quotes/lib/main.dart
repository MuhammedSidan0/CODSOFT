import 'package:daily_quotes/application/use_cases/get_fav.dart';
import 'package:daily_quotes/infrastructure/data/hive_q_data_src.dart';
import 'package:daily_quotes/infrastructure/model/quote_model.dart';
import 'package:daily_quotes/infrastructure/repo/q_repo_impl.dart';
import 'package:daily_quotes/presentation/q_root_page.dart';
import 'package:daily_quotes/presentation/screens/favourites/bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'domain/enitities/quotes.dart';
import 'application/use_cases/add_to_fav.dart';
import 'application/use_cases/get_daily_q.dart';
import 'application/use_cases/remove_from_fav.dart';

import 'presentation/screens/home/bloc/quote_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(QuoteModelAdapter());
  await Hive.openBox<Quote>('quotes');

  final localDataSource = HiveQuoteDataSource();
  final repository = QuoteRepositoryImpl(localDataSource);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => QuoteBloc(
            getDailyQuote: GetDailyQuote(repository),
           
            removeFromfavorites: RemoveFromfavorites(repository),addTofavorites: AddTofavorites(repository)
          )..add(const QuoteEvent.loadDailyQuote()),
        ),
        BlocProvider(
          create: (_) => FavoritesBloc(
            Getfavorites(repository),
            RemoveFromfavorites(repository),
          )..add(const FavoritesEvent.loadFavorites()),
        ),
      ],
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Quotes',
      home: QuoteRootPage(), 
    ),
    ),
  );
}
