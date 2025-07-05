import 'package:daily_quotes/domain/enitities/quotes.dart';
import 'package:daily_quotes/presentation/screens/favourites/bloc/favourite_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
       appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
    'Favourites',
    style: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.2,
    ),
      ),
      centerTitle: true,
    ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          return switch (state) {
            Loading() => const Center(child: CircularProgressIndicator()),
            Errors(:final message) => Center(
              child: Text(message, style: const TextStyle(color: Colors.red)),
            ),
            Loaded(:final quotes) =>
              quotes.isEmpty
                  ? const Center(
                      child: Text(
                        "No favorite quotes yet.",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: quotes.length,
                      itemBuilder: (context, index) {
                        final quote = quotes[index];
                        return _buildfavoriteCard(context, quote);
                      },
                    ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }

  Widget _buildfavoriteCard(BuildContext context, Quote quote) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Text(
              '"${quote.text}"',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '- ${quote.author}',
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple.shade700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () {
                  context.read<FavoritesBloc>().add(
                    FavoritesEvent.removeFavorite(quote.id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
