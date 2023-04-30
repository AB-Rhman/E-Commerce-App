part of 'user_data_cubit.dart';

@immutable
abstract class UserDataState {}

class UserDataInitial extends UserDataState {}


class GetUserDataSuccessState extends UserDataState {}
class GetUserDataLoadingState extends UserDataState {}
class FailedToGetUserDataState extends UserDataState{
     String message;
     FailedToGetUserDataState(this.message);
}