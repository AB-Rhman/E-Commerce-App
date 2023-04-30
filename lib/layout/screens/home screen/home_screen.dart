import 'package:e_shopping_app/constants/constant.dart';
import 'package:e_shopping_app/cubits/home_cubit/home_cubit.dart';
import 'package:e_shopping_app/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:e_shopping_app/layout/widgets/product_card_widget.dart';
import 'package:e_shopping_app/models/banner_model.dart';
import 'package:e_shopping_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                physics: BouncingScrollPhysics(),
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
                                onTap: (){},
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
                        GridView.builder(
                          itemCount: 4,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 15,
                                childAspectRatio: 0.74
                            ),
                            itemBuilder: (context,index){
                              return _productItem(model: homeCubit.products[index]);
                            }),

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

// ************************** CATEGORIES Widget *********************************

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: homeCubit.categories.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context,index){
            return const SizedBox(width: 2,);
          },
          itemBuilder: (context,index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(start:23,end: 8,top: 3),
                  height:  50,width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: const Offset(0, 7), // changes position of shadow
                        ),
                      ],
                    color: kBlue,
                    borderRadius: BorderRadius.circular(9),
                    image:DecorationImage(image: NetworkImage(homeCubit.categories[index].image!,) ,fit: BoxFit.cover)
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 70,
                      padding:const EdgeInsetsDirectional.only(start: 18),
                      child: Text(homeCubit.categories[index].name!,style: const TextStyle(fontSize: 7,fontWeight: FontWeight.bold), textAlign: TextAlign.center, )),
                )
              ],
            );
          }),
    );
  }
}

// ************************** BANNER Widget *************************************

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required PageController controller,
    required this.homeCubit,
  }) : _controller = controller;

  final PageController _controller;
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: double.infinity,
      child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          controller: _controller,
          itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsetsDirectional.only(start: 4,end: 4),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(
                    image: NetworkImage(homeCubit.banners[index].image!,),
                    fit: BoxFit.fill
                )
              ),
            );
          }
      ),
    );
  }
}

// ************************** HEADLINE Widget ***********************************

class HeadLineWidget extends StatelessWidget {
  const HeadLineWidget({
    super.key, required this.text,
  });
 final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
     margin: const EdgeInsetsDirectional.only(start: 23),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Container(
           height: 20,
           width: 3,
           color: mainColor,
         ),
         const SizedBox(width: 5,),
         Text(text,style: TextStyle(fontSize: 21,color: kBlue),)
       ],
     ),
                  );
  }
}

Widget _productItem({required ProductModel model}){
  return Container(
    height: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color:const Color(0xFFFFFFFF),
      boxShadow: const [
        BoxShadow(
          color: Color(0xFF696969),
          offset: Offset(0, 4),
          blurRadius: 2,
        ),
      ],

    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 153,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(model.image!),
                    fit: BoxFit.fitHeight
                )

            ),

          ),
        ),
        Padding(

          padding: const EdgeInsets.only(left: 10,top: 12,right: 45),
          child: Text(
            model.name!,
            textAlign: TextAlign.start,
            style:const  TextStyle (

              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.2125,
              color: Color(0xFF333333),

            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(

          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 8),
                child: Text(
                  "${model.price}\$",
                  textAlign: TextAlign.start,
                  style: const TextStyle (
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.2125,
                    color: Color(0xFFFF4500),

                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 5),
                child: Text(
                  "${model.oldPrice}\$",
                  textAlign: TextAlign.start,
                  style: const TextStyle (
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.2125,
                    color: Color(0xFF0074D9),

                  ),
                  overflow: TextOverflow.ellipsis,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(

                child: Icon(Icons.favorite,color: Color(0xFFFF4500),size: 20),
                onTap: (){

                },

              ),
            )
          ],
        )
      ],
    ),

  );
}
