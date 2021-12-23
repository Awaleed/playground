import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/errors/custom_error.dart';
import '../../core/errors/error_handlers.dart';
import '../../core/new_api_caller.dart';

part 'base_data_cubit.freezed.dart';
part 'base_data_state.dart';

typedef BaseDataCubitResParser<T> = T Function(dynamic res);

abstract class BaseDataCubit<T> extends Cubit<BaseDataCubitState<T>> {
  BaseDataCubit() : super(const BaseDataCubitState.initial()) {
    apiCaller = NewApiCaller(logResponse: true);
  }
  late IApiCaller apiCaller;

  RequestMethod get requestMethod => RequestMethod.get;

  bool get logResponse;

  String get path;

  BaseDataCubitResParser<T> get parser;

  @override
  Future<void> close() async {
    apiCaller.close();
    super.close();
  }

  Future<void> load([dynamic data]) async {
    emit(const BaseDataCubitState.loading());
    try {
      final res = await apiCaller.makeReq(path, requestMethod, data: data);
      emit(BaseDataCubitState.success(parser(res)));
    } catch (e) {
      emit(BaseDataCubitState.failure(ErrorsHandler.decodeError(e)));
      addError(e);
    }
  }
}
