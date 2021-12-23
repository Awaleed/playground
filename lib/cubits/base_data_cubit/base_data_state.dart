part of 'base_data_cubit.dart';

@freezed
class BaseDataCubitState<T> with _$BaseDataCubitState<T> {
  const factory BaseDataCubitState.initial() = _Initial;
  const factory BaseDataCubitState.loading() = _Loading;
  const factory BaseDataCubitState.success(T value) = _Success;
  const factory BaseDataCubitState.failure(CustomError error) = _Failure;
}
