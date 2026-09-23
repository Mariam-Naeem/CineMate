import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cinemate/core/networking/api_constants.dart';
import 'package:cinemate/core/networking/api_error_handler.dart';
import 'package:cinemate/core/networking/api_result.dart';
import 'package:cinemate/core/utils/app_constants.dart';
import 'package:cinemate/core/utils/local_storage.dart';
import 'package:cinemate/feature/auth/data/models/register_requires_model.dart';

@lazySingleton
class RegisterRepo {
  final Dio _dio;
  final LocalStorage _localStorage;

  RegisterRepo(this._dio, this._localStorage);

  Future<ApiResult<dynamic>> register(
    RegisterRequestModel registerModel,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: registerModel.toJson(),
      );
      final data = response.data;
      String? token;
      if (data is Map<String, dynamic> &&
          data['data'] is Map<String, dynamic>) {
        token = (data['data'] as Map<String, dynamic>)['token'] as String?;
      }
      if (token != null && token.isNotEmpty) {
        await saveToken(token);
      }
      return Success(
        data is Map<String, dynamic>
            ? data['message']
            : 'Registered successfully',
      );
    } on DioException catch (e) {
      return Error(ApiErrorHandler.handle(e).message);
    }
  }

  Future<void> saveToken(String token) async {
    await _localStorage.setString(key: AppConstants.token, value: token);
  }
}
