import 'package:e_shopping_app/constants/constant.dart';
import 'package:e_shopping_app/cubits/main_layout_cubit/main_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit, MainLayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final layoutCubit = BlocProvider.of<MainLayoutCubit>(context);
        return Scaffold(
          body: Stack(
            children: [
              layoutCubit.layoutScreens[layoutCubit.bottomNavIndex],
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 13, left: 20, right: 20, top: 0),
                child: Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BottomNavigationBar(
                      elevation: 4,
                      iconSize: 25,
                      enableFeedback: true ,
                      selectedItemColor: mainColor,
                      unselectedItemColor: Colors.white,
                      backgroundColor: secondColor,
                      type: BottomNavigationBarType.fixed,
                      currentIndex: layoutCubit.bottomNavIndex,
                      showSelectedLabels: true,
                      showUnselectedLabels: false,
                      onTap: (index) {
                        layoutCubit.changeBottomNavIndex(index: index);
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home_rounded), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.favorite), label: 'Favorite'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: 'Search'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart), label: 'Cart'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.account_circle), label: 'Profile'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
