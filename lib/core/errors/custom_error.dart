import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_error.freezed.dart';

@freezed
class CustomError with _$CustomError {
  const CustomError._();

  const factory CustomError.general([String? messageStr]) = _General;
  const factory CustomError.noConnection([String? messageStr]) = _NoConnection;
  const factory CustomError.server([String? messageStr]) = _Server;
  const factory CustomError.unimplemented([String? messageStr]) =
      _Unimplemented;
  const factory CustomError.canceledByUser([String? messageStr]) =
      _CanceledByUser;

  String get message => when(
        general: (message) => message ?? 'something_went_wrong',
        noConnection: (message) => message ?? 'there_is_no_internet_connection',
        unimplemented: (message) => message ?? 'yet_to_be_implemented',
        server: (message) => message ?? 'server_error',
        canceledByUser: (message) => message ?? 'canceled_by_user',
      );

  @override
  String toString() => message;
}
