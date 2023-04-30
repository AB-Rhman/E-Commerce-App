import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import '../../cubits/home_cubit/home_cubit.dart';

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
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 2,
            );
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 23, end: 8, top: 3),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 7), // changes position of shadow
                        ),
                      ],
                      color: kBlue,
                      borderRadius: BorderRadius.circular(9),
                      image: DecorationImage(
                          image: NetworkImage(
                            homeCubit.categories[index].image!,
                          ),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                      width: 70,
                      padding: const EdgeInsetsDirectional.only(start: 18),
                      child: Text(
                        homeCubit.categories[index].name!,
                        style: const TextStyle(
                            fontSize: 7, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                )
              ],
            );
          }),
    );
  }
}
