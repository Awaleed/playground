import 'dart:io';

import 'package:dio/dio.dart';

import 'custom_error.dart';

final kAppErrorHandler = ErrorsHandler();

class ErrorsHandler {
  static final _errorsInAppCollectedByWidget = <void Function()>[];

  void addErrorCallback(void Function() callback) =>
      _errorsInAppCollectedByWidget.add(callback);
  void removeErrorCallback(void Function() callback) =>
      _errorsInAppCollectedByWidget.remove(callback);

  void executeCallbacks() {
    for (final callback in _errorsInAppCollectedByWidget) {
      callback();
    }
    _errorsInAppCollectedByWidget.clear();
  }

  static CustomError decodeError(dynamic error) {
    if (error is CustomError) return error;
    try {
      CustomError message;
      if (error is DioError) {
        message = _mapDioError(error);
      } else if (error is UnimplementedError) {
        message = const CustomError.unimplemented();
      } else {
        message = CustomError.general('$error');
      }
      return message;
    } catch (e) {
      return CustomError.general('$e');
    }
  }

  static CustomError _mapDioError(DioError error) {
    if (error.error is SocketException) {
      return const CustomError.noConnection();
    }

    if (error.response?.data['errors'] != null &&
        error.response?.data['errors'] is Map) {
      final message = StringBuffer();
      final map = error.response?.data['errors'] as Map;
      for (final value in map.values) {
        if (value is List) {
          for (final str in value) {
            message.write('$str\n');
          }
        } else {
          message.write('$value\n');
        }
      }
      return CustomError.general(message.toString());
    } else if (error.response?.data['error'] != null) {
      return CustomError.general('${error.response?.data['error']}');
    } else if (error.response?.data['message'] != null) {
      return CustomError.general('${error.response?.data['message']}');
    } else {
      return CustomError.general(error.message);
    }
  }
}
