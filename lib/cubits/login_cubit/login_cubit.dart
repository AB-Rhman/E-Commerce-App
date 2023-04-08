import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_shopping_app/constants/local_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void Login({required String email, required String password}) async {
    emit(LoginLoadingState());

    try {
      Response response = await http.post(
          Uri.parse('https://student.valuxapps.com/api/login'),
          body: {"email": email, "password": password});

      var responseBody = jsonDecode(response.body);

      if (responseBody['status'] == true) {
        debugPrint("User login success and his Data is : $responseBody");
        await CacheNetwork.insertToCache(key: "token", value: responseBody['data']['token']);
        emit(LoginSuccessState());
      } else {
        debugPrint("Failed to login, reason is : ${responseBody['message']}");
        emit(LoginFailureState(message: responseBody['message']));
      }
    } catch (e) {
      emit(LoginFailureState(message: e.toString()));
    }
  }
}
