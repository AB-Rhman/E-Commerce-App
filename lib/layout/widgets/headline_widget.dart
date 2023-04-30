import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class HeadLineWidget extends StatelessWidget {
  const HeadLineWidget({
    super.key,
    required this.text,
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
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 21, color: kBlue),
          )
        ],
      ),
    );
  }
}
