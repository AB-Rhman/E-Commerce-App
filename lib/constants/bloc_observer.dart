import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('onChange ==> ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {
    print('onClose ==> ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    print('onCreate ==> ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError ==> ${bloc.runtimeType}, $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}