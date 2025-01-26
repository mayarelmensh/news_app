import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/ui/home/news/search_new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SearchNew.routeName: (context) => SearchNew()
        // CategoryDetails.routeName:(context)=>CategoryDetails(),
      },
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.darkTheme,
      // themeMode:ThemeMode.dark ,
    );
  }
}
