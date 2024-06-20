import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:roaia_app/core/helpers/cache_helper.dart';
import 'package:roaia_app/core/networking/api_constants.dart';
import 'package:roaia_app/core/networking/dio_manager.dart';
import 'package:roaia_app/models/user_info_model.dart';
import 'package:roaia_app/screen/refresh_token/refresh_token/view.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoStates> {
  UserInfoCubit() : super(UserInfoInitial());
  final logger = Logger();
  final dioManager = DioManager();
  UserInfoModel? userInfo;
  String url = '${ApiConstants.userInfo}/${CacheHelper.get(key: 'email')}';

  Future<void> userInfoData() async {
    emit(UserInfoLoadingState());
    try {
      final response = await dioManager.get(url);
      if (response.statusCode == 200) {
        userInfo = UserInfoModel.fromJson(response.data);
        CacheHelper.put(
            key: 'blindId',
            value: "${userInfo!.blindId}",
          );
        emit(UserInfoSuccessState());
        // CacheHelper.put(
        //   key: 'access_token',
        //   value: "${response.data['token']}",
        // );
        // CacheHelper.put(
        //   key: 'email',
        //   value: "${response.data['email']}",
        // );
      } else {
        emit(UserInfoFailedState(msg: response.data));
      }
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      emit(UserInfoFailedState(msg: 'An unknown error: $e'));
      logger.e(e);
    }
  }

  void handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        emit(UserInfoFailedState(msg: "Request was cancelled"));
        break;
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        emit(NetworkErrorState());
        break;
      case DioExceptionType.badResponse:
             if(e.response!.statusCode==401)
             {
               emit(UnAuthorizedState());
             }
             else {
               emit(UserInfoFailedState(msg: "${e.response?.data}"));
             }
        break;
      default:
        emit(NetworkErrorState());
    }
    logger.e(e);
  }
}
