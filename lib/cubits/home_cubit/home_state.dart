part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetBannersLoadingState extends HomeState{}
class GetBannersSuccessState extends HomeState{}
class FailedToGetBannersState extends HomeState{}


class GetCategoriesLoadingState extends HomeState{}
class GetCategoriesSuccessState extends HomeState{}
class FailedToGetCategoriesState extends HomeState{}



class GetProductsLoadingState extends HomeState{}
class GetProductsSuccessState extends HomeState{}
class FailedToGetProductsState extends HomeState{}
