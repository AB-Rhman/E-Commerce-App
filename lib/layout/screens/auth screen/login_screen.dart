import 'package:e_shopping_app/cubits/login_cubit/login_cubit.dart';
import 'package:e_shopping_app/layout/screens/auth%20screen/signup_screen.dart';
import 'package:e_shopping_app/layout/screens/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constant.dart';
import 'auth widgets/auth_bottom.dart';
import 'auth widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  String? email, password;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else if (state is LoginFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: Text(state.message),
            )));
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                                color: fontColorOne),
                          ),
                          const SizedBox(
                            height: 73,
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          CustomTextField(
                            labelName: 'Email',
                            onSaved: (value) {
                              email = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          CustomTextField(
                            labelName: 'Password',
                            onSaved: (value) {
                              password = value;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text('Don\'t have account! ',
                                  style: TextStyle(fontSize: 16)),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                                child: Row(
                                  children: [
                                    Text('SIGN UP',
                                        style: TextStyle(
                                            color: mainColor, fontSize: 16)),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: mainColor,
                                      size: 28,
                                      shadows: [
                                        Shadow(blurRadius: 20, color: mainColor)
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AuthBottom(
                              authText: 'LOGIN',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();

                                  BlocProvider.of<LoginCubit>(context).Login(
                                    email: email.toString(),
                                    password: password.toString(),
                                  );
                                } else {
                                  autoValidateMode = AutovalidateMode.always;
                                  setState(() {});
                                }
                              })
                        ]),
                  ),
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
