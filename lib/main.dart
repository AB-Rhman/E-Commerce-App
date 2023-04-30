import 'package:e_shopping_app/constants/local_network.dart';
import 'package:e_shopping_app/cubits/home_cubit/home_cubit.dart';
import 'package:e_shopping_app/cubits/login_cubit/login_cubit.dart';
import 'package:e_shopping_app/cubits/main_layout_cubit/main_layout_cubit.dart';
import 'package:e_shopping_app/cubits/register_cubit/register_cubit.dart';
import 'package:e_shopping_app/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:e_shopping_app/layout/screens/auth%20screen/login_screen.dart';
import 'package:e_shopping_app/layout/screens/home%20screen/home_screen.dart';
import 'package:e_shopping_app/layout/screens/layout_screen/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/bloc_observer.dart';
import 'constants/constant.dart';
import 'layout/screens/auth screen/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await CacheNetwork.cacheInitialization();
  token = await CacheNetwork.getCacheData(key: 'token');
  debugPrint("token is : $token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => MainLayoutCubit()),
        BlocProvider(create: (context) => UserDataCubit()..userModel),
        BlocProvider(create: (context) => HomeCubit()..getBannersData()..getCategoriesData()..getProducts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: token != null ? LayoutScreen(): LoginScreen(),
      ),
    );
  }
}

