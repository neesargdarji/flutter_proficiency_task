import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/home_model.dart';
import '../model/status_model.dart';
import '../utils/config.dart';
import '../utils/string_resources.dart';

class ApiController {
  static final ApiController _apiController = ApiController._internal();
  late Dio _dio;

  factory ApiController({bool delay = false}) {
    _apiController.prepareRequest();
    return _apiController;
  }

  static ApiController get instance => _apiController;

  ApiController._internal();

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      baseUrl: Config.baseUrl,
      responseType: ResponseType.json,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    _dio = Dio(dioOptions);
    String tag = "API call :";
    final mInterceptorsWrapper = InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint("$tag headers ${options.headers.toString()}",
            wrapWidth: 1024);
        debugPrint("$tag ${options.baseUrl.toString() + options.path}",
            wrapWidth: 1024);
        debugPrint("$tag queryParameters ${options.queryParameters.toString()}",
            wrapWidth: 1024);
        debugPrint("$tag ${options.data.toString()}", wrapWidth: 1024);
        return handler.next(options);
      },
      onResponse: (e, handler) {
        debugPrint("Code  ${e.statusCode.toString()}", wrapWidth: 1024);
        debugPrint("Response ${e.toString()}", wrapWidth: 1024);
        return handler.next(e);
      },
      onError: (e, handler) {
        debugPrint("$tag ${e.error.toString()}", wrapWidth: 1024);
        debugPrint("$tag ${e.response.toString()}", wrapWidth: 1024);
        return handler.next(e);
      },
    );
    _dio.interceptors.add(mInterceptorsWrapper);
  }

  Future<Response> _post(String url, Map<String, dynamic> param) async {
    Response response = await _dio.post(
      url,
      data: param,
    );

    return response;
  }

  Status _handleError(DioError error) {
    if (error.type == DioErrorType.other &&
        error.error != null &&
        error.error is SocketException) {}

    late Status errorResponse;

    switch (error.type) {
      case DioErrorType.cancel:
        return Status(
          success: false,
          errorCode: 401,
          errorDescription: StringRes.someThingWentWrong,
        );
      case DioErrorType.response:
        if (error.response != null && error.response!.data != null) {
          try {
            if (error.response!.data!['error'] != null) {
              if (error.response!.data!['error']['data']['message'] != null) {
                errorResponse = Status(
                  success: false,
                  errorCode: 401,
                  errorDescription: StringRes.someThingWentWrong,
                );
              } else {
                errorResponse = Status(
                  success: false,
                  errorCode: 401,
                  errorDescription: StringRes.someThingWentWrong,
                );
              }
            } else {
              errorResponse = Status(
                success: false,
                errorCode: 401,
                errorDescription: StringRes.someThingWentWrong,
              );
            }
          } catch (e) {
            errorResponse = Status(
              success: false,
              errorCode: 401,
              errorDescription: StringRes.someThingWentWrong,
            );
          }
        } else {
          errorResponse = Status(
            success: false,
            errorCode: 401,
            errorDescription: StringRes.someThingWentWrong,
          );
        }

        break;
      case DioErrorType.connectTimeout:
        errorResponse = Status(
          success: false,
          errorCode: 401,
          errorDescription: StringRes.connectionTimeout,
        );
        break;
      case DioErrorType.receiveTimeout:
        errorResponse = Status(
          success: false,
          errorCode: 401,
          errorDescription: StringRes.receiveTimeout,
        );
        break;
      case DioErrorType.sendTimeout:
        errorResponse = Status(
          success: false,
          errorCode: 401,
          errorDescription: StringRes.sendTimeout,
        );
        break;
      case DioErrorType.other:
        errorResponse = Status(
          success: false,
          errorCode: 401,
          errorDescription: StringRes.someThingWentWrong,
        );
        break;
    }
    return errorResponse;
  }

  Future<HomeResponse?> getHomeData(
      {required Map<String, dynamic> param}) async {
    try {
      Response response = await _dio.get(
        Config.apiEndpoint,
      );
      if (response.statusCode == 200) {
        return HomeResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }
}
