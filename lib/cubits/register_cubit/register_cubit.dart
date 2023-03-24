import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register(
      {required String name,
      required String email,
      required String phoneNumber,
      required String password}) async {
    emit(RegisterLoadingState());
    try {
      Response response = await http
          .post(Uri.parse('https://student.valuxapps.com/api/register'),
          body: {
        'name': name,
        'phone': phoneNumber,
        'email': email,
        'password': password,
        'image': 'gg',
      }
      );
        var responseBody = jsonDecode(response.body);
        if( responseBody['status'] == true){
          debugPrint('Response is : $responseBody');
          emit(RegisterSuccessState());
        }else {
          debugPrint('Response is : $responseBody');
          emit(RegisterFailureState(
            message: responseBody['message']
          ));
        }

    }   catch (e) {
      // TODO
      debugPrint("Failed to Register , reason : $e");
      emit(RegisterFailureState(message: e.toString()));
    }
  }
}
