import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16,end: 16,top:57,bottom: 57 ),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('Sign up' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34),),
                  SizedBox(height: 73,),
                  CustomTextField(
                    labelName: 'Name',
                  ),
                  SizedBox(height: 11,),
                  CustomTextField(
                    labelName: 'Email',
                  ),
                  SizedBox(height: 11,),
                  CustomTextField(
                    labelName: 'Password',
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.labelName}) : super(key: key);
final String labelName ;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color:Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color:Colors.transparent),
          ),

          labelText: labelName,
          labelStyle: TextStyle(color: Colors.black.withOpacity(.5),fontSize:18 ),
        ),
      ),
    );
  }
}
