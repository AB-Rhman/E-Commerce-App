import 'package:bloc/bloc.dart';
import 'package:e_shopping_app/layout/screens/search_screen/search_screen.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../layout/screens/cart_screen/cart_screen.dart';
import '../../layout/screens/favorites_screen/favorites_screen.dart';
import '../../layout/screens/home screen/home_screen.dart';
import '../../layout/screens/profile_screen/profile_screen.dart';
part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());

  int bottomNavIndex =0;

  void changeBottomNavIndex ({required int index}){

    bottomNavIndex=index;

    emit(ChangeBottomNavIndexState());
  }

  List<Widget> layoutScreens = [HomeScreen() ,  FavoritesScreen(), SearchScreen(), CartScreen(), ProfileScreen()];
}
