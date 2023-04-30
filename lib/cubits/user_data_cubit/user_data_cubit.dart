import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:e_shopping_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../constants/constant.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  UserModel? userModel;
  void getUserData() async {
    emit(GetUserDataLoadingState());
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/profile"),
        headers:
        {
          'Authorization' : token!,
          "lang" : "en"
        }
    );
    var responseData = jsonDecode(response.body);
    if( responseData['status'] == true )
    {
      userModel = UserModel.fromJson(data: responseData['data']);
      debugPrint("User Data is : ${responseData['data']}");
      emit(GetUserDataSuccessState());
    }
    else
    {
      emit(FailedToGetUserDataState(responseData['message']));
    }
  }
}
