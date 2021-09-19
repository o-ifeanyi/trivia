import 'dart:async';

import 'package:dio/dio.dart';
import 'package:trivia/core/constants/constants.dart';
import 'package:trivia/core/errors/exceptions.dart';

class NetworkService {
  final Dio dio;

  NetworkService({required this.dio});

  Future<Response> get({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    try {
      print('GETTING $query');
      final response = await dio
          .get(
            path,
            options: Options(
              method: 'GET',
            ),
            queryParameters: query,
          )
          .onError<DioError>((error, stackTrace) =>
              throw CustomException(message: getErrorMessage(error)));
      print(response.data);
      if (response.data['response_code'] == 0) {
        return response;
      } else if (response.data['response_code'] == 1) {
        throw CustomException(
            message: 'No trivia was found for your selection');
      } else {
        print('ERROR RESPONSE ${response.data}');
        throw CustomException(message: response.data['message']);
      }
    } on CustomException catch (error) {
      throw error;
    } on DioError catch (error) {
      throw CustomException(message: getErrorMessage(error));
    } catch (error) {
      throw CustomException(message: DEFAULT_ERROR_MSG);
    }
  }

  String getErrorMessage(DioError error) {
    print('ERROR: $error');
    print('STATUS CODE: ${error.response?.statusCode}');
    print('ERROR MESSAGE: ${error.message}');
    print('ERROR ERROR RESPONSE: ${error.response}');
    String? message;
    switch (error.type) {
      case DioErrorType.other:
        if (error.message.contains('SocketException')) {
          message = 'Please check your network and try again';
        } else {
          message = DEFAULT_ERROR_MSG;
        }
        break;
      case DioErrorType.response:
        message = error.response?.data['error'];
        break;
      default:
    }
    return message ?? DEFAULT_ERROR_MSG;
  }
}
