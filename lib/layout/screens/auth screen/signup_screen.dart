import 'package:e_shopping_app/constants/constant.dart';
import 'package:e_shopping_app/layout/screens/auth%20screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/register_cubit/register_cubit.dart';
import 'auth widgets/auth_bottom.dart';
import 'auth widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? email, name, password, phone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          } else if (state is RegisterFailureState) {
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
            autovalidateMode: autoValidateMode,
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 16,
                  end: 16,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                                color: fontColorOne),
                          ),
                          const SizedBox(
                            height: 73,
                          ),
                          CustomTextField(
                            labelName: 'Name',
                            onSaved: (val) {
                              name = val;
                            },
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          CustomTextField(
                            labelName: 'Email',
                            onSaved: (val) {
                              email = val;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          CustomTextField(
                            labelName: 'Password',
                            onSaved: (val) {
                              password = val;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          CustomTextField(
                            labelName: 'Phone Number',
                            onSaved: (val) {
                              phone = val;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(fontSize: 16),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Row(
                                  children: [
                                    Text('LOGIN',
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
                              authText: 'SIGN UP ',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();

                                  BlocProvider.of<RegisterCubit>(context)
                                      .register(
                                    email: email.toString(),
                                    name: name.toString(),
                                    phoneNumber: phone.toString(),
                                    password: password.toString(),
                                  );

                                  //BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
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
