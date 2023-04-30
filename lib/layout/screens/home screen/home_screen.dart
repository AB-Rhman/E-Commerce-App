import 'package:e_shopping_app/constants/constant.dart';
import 'package:e_shopping_app/cubits/home_cubit/home_cubit.dart';
import 'package:e_shopping_app/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:e_shopping_app/layout/screens/product_screen/product_screen.dart';
import 'package:e_shopping_app/layout/widgets/product_card_widget.dart';
import 'package:e_shopping_app/models/banner_model.dart';
import 'package:e_shopping_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/banner_widget.dart';
import '../../widgets/categories_widget.dart';
import '../../widgets/headline_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
final _controller =PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    final homeCubit = BlocProvider.of<HomeCubit>(context)..products..categories..banners;
    return BlocConsumer<UserDataCubit, UserDataState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (BlocProvider.of<UserDataCubit>(context).userModel == null) BlocProvider.of<UserDataCubit>(context).getUserData();
        return SafeArea(
          child: Scaffold(

            body: BlocProvider.of<UserDataCubit>(context).userModel != null ? SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 90),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.account_circle,size: 65,),
                          title: const Text('Welcome'),
                          subtitle: Text(BlocProvider.of<UserDataCubit>(context).userModel!.name!),
                          trailing: Icon(
                            Icons.notifications_active_rounded,
                            color: fontColorOne,
                          ),

                        ),
                        const SizedBox(height: 10,),
                        const Divider(color: Color(0xFFD9D9D9),height: 1,endIndent: 11, indent: 11,thickness: 3),
                        const SizedBox(height: 23,),
                        const HeadLineWidget(text: "HOT PRODUCTS"),
                        const SizedBox(height: 10,),
                        //***************** Banner Loading here *****************
                        homeCubit.banners.isEmpty?
                            CircularProgressIndicator(
                              color: mainColor,
                            )

                        : BannerWidget(controller: _controller, homeCubit: homeCubit),
                        //****************************
                        const SizedBox(height: 15,),
                        SmoothPageIndicator(
                            controller:_controller,  // PageController
                            count:  4,
                            effect:  ExpandingDotsEffect(
                                activeDotColor: secondColor,
                                dotColor: secondColor,
                                dotHeight: 8,
                                dotWidth: 8
                            ),  // your preferred effect

                        ),
                        //****************************
                        const SizedBox(height: 18,),
                        const HeadLineWidget(text: "CATEGORIES"),
                        const SizedBox(height: 11,),
                        CategoriesWidget(homeCubit: homeCubit),
                        const SizedBox(height: 18,),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsetsDirectional.only(start: 23,end: 23),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                  height: 20,
                                  width: 3,
                                  color: mainColor,
                                ),
                                const SizedBox(width: 5,),
                                Text("PRODUCTS",style: TextStyle(fontSize: 21,color: kBlue),)
                              ],),
                              GestureDetector(
                                // ********** ON TAP FUNCTION TO SEE ALL PRODUCTS **************
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                                    return  ProductScreen();
                                  }));
                                },
                                child: Text(
                                  'See All >',
                                  style: TextStyle(fontSize: 14,color: kBlue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18,),
                        homeCubit.products.isEmpty ?
                        Center(child: CircularProgressIndicator(color: mainColor,)):
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                          child: GridView.builder(
                            itemCount: 4,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 0.7
                              ),
                              itemBuilder: (context,index){
                                return ProductCardItem(
                                  model: homeCubit.products[index],
                                  onTap: (){},
                                );
                              }),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ): Center(child: CircularProgressIndicator(color: mainColor,))
          ),
        );
      },
    );
  },
);
  }
}


// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[ ITEMS ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

