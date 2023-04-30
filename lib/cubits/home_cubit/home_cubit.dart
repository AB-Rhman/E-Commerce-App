import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_shopping_app/constants/constant.dart';
import 'package:e_shopping_app/models/banner_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../models/categories_model.dart';
import '../../models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<BannerModel> banners = [];

  getBannersData() async {
    emit(GetBannersLoadingState());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/banners'),
    );
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(BannerModel.fromJson(data: item));
      }
      emit(GetBannersSuccessState());
    } else {
      emit(FailedToGetBannersState());
    }
  }

  List<CategoriesModel> categories = [];

  getCategoriesData() async {
    emit(GetCategoriesLoadingState());
    Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/categories'),
        headers: {"lang": "en"});
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(CategoriesModel.fromJson(data: item));
      }
      emit(GetCategoriesSuccessState());
    } else {
      emit(FailedToGetCategoriesState());
    }
  }

  List<ProductModel> products = [];

  void getProducts() async {
    emit(GetProductsLoadingState());
     Response response = await http.get(Uri.parse('https://student.valuxapps.com/api/home'),
        headers: {'Authorization': token!, 'lang': 'en'});
     var responseBody = jsonDecode(response.body);
     if(responseBody['status'] == true){
       for(var item in responseBody['data']['products']){
         products.add(ProductModel.fromJson(data: item));
       }

       emit(GetProductsSuccessState());
     }else{
       emit(FailedToGetProductsState());
     }
  }
}
