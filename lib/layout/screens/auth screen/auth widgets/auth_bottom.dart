import 'package:flutter/material.dart';

import '../../../../constants/constant.dart';

class AuthBottom extends StatelessWidget {
  const AuthBottom({Key? key, this.onPressed, required this.authText})
      : super(key: key);
  final String authText;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: mainColor,
          boxShadow: [
            BoxShadow(
              color: mainColor.withOpacity(0.4),
              spreadRadius: 6,
              blurRadius: 12,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        alignment: Alignment.center,
        height: 48,
        width: double.infinity,
        padding: const EdgeInsetsDirectional.symmetric(vertical: 14),
        child: Text(
          authText,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
