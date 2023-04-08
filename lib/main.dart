import 'package:e_shopping_app/constants/local_network.dart';
import 'package:e_shopping_app/layout/screens/auth%20screen/login_screen.dart';
import 'package:e_shopping_app/layout/screens/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'constants/bloc_observer.dart';
import 'constants/constant.dart';
import 'layout/screens/auth screen/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await CacheNetwork.cacheInitialization();
  token = await CacheNetwork.getCacheData(key: 'token');
  debugPrint('the token is : $token ');
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
      home: token != null ? HomeScreen(): LoginScreen(),
    );
  }
}

