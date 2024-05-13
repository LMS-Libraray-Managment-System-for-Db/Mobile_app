import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:library_management_system/constants/cache_helper.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://graduation-api-zaj9.onrender.com/api/v1';

  Future<Either<String, Response>> signinPostRequest(
      Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        '$baseUrl/user/login',
        data: data,
      );

      return Right(response);
    } catch (e) {
      log('API Error: $e');
      return const Left('Failed to sign in. Please try again.');
    }
  }

  Future<Either<String, Response>> getUserProfile(String accessToken) async {
    try {
      final response = await _dio.get(
        '$baseUrl/user/profile',
        options: Options(headers: {'Authorization': accessToken}),
      );
      return Right(response);
    } catch (e) {
      log('API Error: $e');
      return const Left('Failed to fetch user profile.');
    }
  }
}
