import 'package:e_shopping_app/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constant.dart';
import '../../widgets/product_card_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeCubit>(context)..products;
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: mainColor,
              ),
            ),
            title: Text(
              'Products',
              textAlign: TextAlign.start,
              style: TextStyle(color: kBlue, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 8, top: 8, end: 12, start: 12),
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeCubit.products.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.7),
                itemBuilder: (context, index) {
                  return ProductCardItem(
                    model: homeCubit.products[index],
                    onTap: () {},
                  );
                }),
          ),
        );
      },
    ));
  }
}
