import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:roaia_app/core/helpers/cache_helper.dart';
import 'package:roaia_app/core/networking/api_constants.dart';
import 'package:roaia_app/core/networking/dio_manager.dart';

import 'states.dart';

class SendCodeCubit extends Cubit<SendCodeStates> {
  SendCodeCubit() : super(SendCodeInitialState());

  final emailController = TextEditingController();
  final dioManager = DioManager();
  final logger = Logger();

  Future<void> sendOtp() async {
    emit(SendCodeLoadingState());
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
  bool isObscure = true;

  changeVisibility() {
    isObscure = !isObscure;
    emit(ChanceVisibilityState());
  }
  //=================================================================

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
