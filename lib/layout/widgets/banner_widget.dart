import 'package:flutter/material.dart';

import '../../cubits/home_cubit/home_cubit.dart';

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
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsetsDirectional.only(start: 4, end: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: DecorationImage(
                      image: NetworkImage(
                        homeCubit.banners[index].image!,
                      ),
                      fit: BoxFit.fill)),
            );
          }),
    );
  }
}
