import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:roaia_app/core/helpers/cache_helper.dart';
import 'package:roaia_app/core/networking/api_constants.dart';
import 'package:roaia_app/core/networking/dio_manager.dart';

import 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final dioManager = DioManager();
  final logger = Logger();
  bool isObscure = true;
  bool isRemember = true;
  changeVisibility() {
    isObscure = !isObscure;
    emit(ChanceVisibilityState());
  }
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      try {
        final response = await dioManager.post(
          ApiConstants.login,
          data: {
            "email": emailController.text,
            "password": passwordController.text,
          },
        );

        if (response.statusCode == 200) {
          emit(LoginSuccessState());
          CacheHelper.put(
            key: 'access_token',
            value: "${response.data['token']}",
          );
          CacheHelper.put(
            key: 'email',
            value: "${response.data['email']}",
          );
          logger.i(response.data["token"]);
        } else {
          emit(LoginFailedState(msg: response.data));
        }
      } on DioException catch (e) {
        handleDioException(e);
      } catch (e) {
        emit(LoginFailedState(msg: 'An unknown error: $e'));
        logger.e(e);
      }
    }
  }

  void handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        emit(LoginFailedState(msg: "Request was cancelled"));
        break;
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        emit(NetworkErrorState());
        break;
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 400 &&
            "${e.response?.data}" != "Email or Password is incorrect!") {
          emit(NotVerifyState());
        } else {
          emit(LoginFailedState(msg: "${e.response?.data}"));
        }

        break;
      default:
        emit(NetworkErrorState());
    }
    logger.e(e);
  }

  //=================================================================

  Future<void> sendOtp() async {
    try {
      final response = await dioManager.post(
        "${ApiConstants.sendOtp}/${emailController.text}",
      );

      if (response.statusCode == 200) {
        emit(SendCodeSuccessState(msg: "${response.data}"));
      } else {
        emit(SendCodeFailedState(msg: "${response.data}"));
      }
    } on DioException catch (e) {
      emit(SendCodeFailedState(msg: "handleDioException"));
    } catch (e) {
      emit(SendCodeFailedState(msg: 'An unknown error: $e'));
      logger.e(e);
    }
  }

  //=================================================================

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
