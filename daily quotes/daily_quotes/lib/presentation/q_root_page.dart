import 'package:daily_quotes/presentation/screens/favourites/bloc/favourite_bloc.dart';
import 'package:daily_quotes/presentation/screens/favourites/pages/fav_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'package:daily_quotes/presentation/screens/home/pages/home_view.dart';

class QuoteRootPage extends StatefulWidget {
  const QuoteRootPage({super.key});

  @override
  State<QuoteRootPage> createState() => _QuoteRootPageState();
}

class _QuoteRootPageState extends State<QuoteRootPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
       height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
  gradient: LinearGradient(
    colors: [Color.fromARGB(255, 132, 64, 192), Color.fromARGB(255, 17, 14, 21)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
           decoration: BoxDecoration(
          color: Colors.white.withValues(alpha:0.15),
          borderRadius: BorderRadius.circular(16),
        ),
          child: BottomNavigationBar(
             backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
            currentIndex: _selectedIndex,
            
            onTap: (index) {
              setState(() => _selectedIndex = index);
                
              if (index == 1) {
                context.read<FavoritesBloc>().add(const FavoritesEvent.loadFavorites());
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
            ],
          ),
        ),
      ),
    );
  }
}
