import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:u_and_i/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'), // 한국어 지원
      ],
      theme: ThemeData(
          fontFamily: 'sunflower',
          textTheme: TextTheme(
            displayLarge: TextStyle(
                color: Colors.white,
                fontSize: 80.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'parisienne'),
            displayMedium: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
            bodyLarge: TextStyle(color: Colors.white, fontSize: 30.0),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 20.0),
          )),
      home: HomeScreen()));
}
