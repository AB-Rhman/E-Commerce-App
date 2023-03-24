import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'constants/bloc_observer.dart';
import 'layout/screens/auth screen/signup_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: SignUpScreen(),
    );
  }
}

