import 'dart:convert';

import 'package:dine_dealer/core/constants/urls.dart';
import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/features/domain/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class LogInRepository {
  Future<Either<Failure, String>> logIn(String phone) async {
    //return Right('');
    try {
      final response = await Dio().post(
        Urls.login,
        data: {
          'phone': phone,
        },
      );

      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(Failure(e.response?.statusCode, e.response!.data['error']));
    }
  }

  Future<Either<Failure, AuthModel>> sendOtp(String phone, String code) async {
    //return Right('');
    final Map<String, String> data = {
      'phone': phone,
      'code': code,
    };

    try {
      final response = await Dio().post(Urls.login, data: data);
      print(response);

      final authModel = AuthModel(
        message: response.data['message'],
        token: response.data['token'],
      );

      return Right(authModel);
    } on DioException catch (e) {
      return Left(Failure(e.response?.statusCode, e.response!.data['error']));
    }
  }
}
