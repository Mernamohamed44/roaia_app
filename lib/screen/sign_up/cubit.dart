import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:roaia_app/core/helpers/cache_helper.dart';
import 'package:roaia_app/core/networking/api_constants.dart';
import 'package:roaia_app/core/networking/dio_manager.dart';

import 'controller.dart';
import 'states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final dioManager = DioManager();
  final formKey = GlobalKey<FormState>();
  final controllers = RegisterControllers();
  final logger = Logger();
  bool isObscure = true;
  File? imageFileCropper;

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      try {
        final response = await dioManager.post(
          ApiConstants.register,
          data: FormData.fromMap({
            "FirstName": controllers.firstNameController.text,
            "LastName": controllers.lastNameController.text,
            "Username": controllers.userNameController.text,
            "BlindId": "638470f3-79c5-43b3-90ed-d18c9a",
            "Email": controllers.emailController.text,
            "Password": controllers.passwordController.text,
            "ImageUrl": imageFileCropper != null
                ? MultipartFile.fromFileSync(
                    imageFileCropper!.path,
                    filename: imageFileCropper!.path.split("/").last,
                  )
                : null,
            "IsAgree": "true",
          }),
        );

        if (response.statusCode == 200) {
          emit(RegisterSuccessState());
          CacheHelper.put(
            key: 'access_token',
            value: "${response.data['token']}",
          );
          logger.i(response.data["token"]);
        } else {
          emit(RegisterFailedState(msg: "${response.data}"));
        }
      } on DioException catch (e) {
        handleDioException(e);
      } catch (e) {
        emit(RegisterFailedState(msg: 'An unknown error: $e'));
        logger.e(e);
      }
    }
  }

  void handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        emit(RegisterFailedState(msg: "Request was cancelled"));
        break;
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        emit(RegisterNetworkErrorState());
        break;
      case DioExceptionType.badResponse:
        emit(RegisterFailedState(msg: "${e.response?.data}"));
        break;
      default:
        emit(RegisterNetworkErrorState());
    }
    logger.e(e);
  }

  changeVisibility() {
    isObscure = !isObscure;
    emit(ChanceVisibilityState());
  }

  chooseLicenseImage() {
    ImagePicker.platform.getImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        imageFileCropper = File(value.path);
        emit(UploadImageStates());
      }
    });
  }

  @override
  Future<void> close() {
    controllers.dispose();
    return super.close();
  }
}
