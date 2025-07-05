import 'package:daily_quotes/domain/enitities/quotes.dart';
import 'package:daily_quotes/presentation/screens/home/bloc/quote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.transparent,
     appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
    'Quote of the Day',
    style: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.2,
    ),
      ),
      centerTitle: true,
    ),
    
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          return switch (state) {
            Initial() ||
            Loading() => const Center(child: CircularProgressIndicator()),
            Errors(:final message) => Center(
              child: Text(message, style: const TextStyle(color: Colors.red)),
            ),
            Loaded(:final quote) => _buildQuoteCard(context, quote),
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<QuoteBloc>().add(const QuoteEvent.loadDailyQuote());
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.refresh),
      ),
    );
  }

Widget _buildQuoteCard(BuildContext context, Quote quote) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    child: Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white.withValues(alpha:0.95),
      shadowColor: Colors.deepPurple.withValues(alpha:0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.format_quote_rounded,
              color: Colors.deepPurple.shade200,
              size: 40,
            ),
            const SizedBox(height: 16),
            Text(
              '"${quote.text}"',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              '- ${quote.author}',
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple.shade700,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    quote.isfavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.pinkAccent,
                  ),
                  onPressed: () {
                    context.read<QuoteBloc>().add(
                      QuoteEvent.togglefavorite(quote),
                    );
                  },
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.blueAccent),
                  onPressed: () {
                    final text =
                        '"${quote.text}" — ${quote.author} #QuoteOfTheDay';
                    final box = context.findRenderObject() as RenderBox?;
                    SharePlus.instance.share(
                      ShareParams(
                        text: text,
                        sharePositionOrigin:
                            box!.localToGlobal(Offset.zero) & box.size,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

}
