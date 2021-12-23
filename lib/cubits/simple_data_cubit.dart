import 'dart:async';

import 'base_data_cubit/base_data_cubit.dart';

typedef BaseCRUDCubitResParser<T> = T Function(dynamic res);

class SimpleDataCubit<T> extends BaseDataCubit<T> {
  SimpleDataCubit({
    required bool logResponse,
    required BaseCRUDCubitResParser<T> parser,
    required String path,
  })  : _logResponse = logResponse,
        _parser = parser,
        _path = path,
        super() {
    unawaited(load());
  }

  final bool _logResponse;
  final BaseCRUDCubitResParser<T> _parser;
  final String _path;

  @override
  bool get logResponse => _logResponse;

  @override
  BaseCRUDCubitResParser<T> get parser => _parser;

  @override
  String get path => _path;
}
