import 'package:e_shopping_app/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required this.labelName, this.onSaved, this.keyboardType})
      : super(key: key);
  final String labelName;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: TextFormField(
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'This field is required';
          } else {
            return null;
          }
        },
        cursorColor: mainColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          hintText: labelName,
          labelStyle:
              TextStyle(color: Colors.black.withOpacity(.5), fontSize: 18),
        ),
      ),
    );
  }
}
