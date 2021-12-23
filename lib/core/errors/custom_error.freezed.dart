// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomErrorTearOff {
  const _$CustomErrorTearOff();

  _General general([String? messageStr]) {
    return _General(
      messageStr,
    );
  }

  _NoConnection noConnection([String? messageStr]) {
    return _NoConnection(
      messageStr,
    );
  }

  _Server server([String? messageStr]) {
    return _Server(
      messageStr,
    );
  }

  _Unimplemented unimplemented([String? messageStr]) {
    return _Unimplemented(
      messageStr,
    );
  }

  _CanceledByUser canceledByUser([String? messageStr]) {
    return _CanceledByUser(
      messageStr,
    );
  }
}

/// @nodoc
const $CustomError = _$CustomErrorTearOff();

/// @nodoc
mixin _$CustomError {
  String? get messageStr => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? messageStr) general,
    required TResult Function(String? messageStr) noConnection,
    required TResult Function(String? messageStr) server,
    required TResult Function(String? messageStr) unimplemented,
    required TResult Function(String? messageStr) canceledByUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Server value) server,
    required TResult Function(_Unimplemented value) unimplemented,
    required TResult Function(_CanceledByUser value) canceledByUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomErrorCopyWith<CustomError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomErrorCopyWith<$Res> {
  factory $CustomErrorCopyWith(
          CustomError value, $Res Function(CustomError) then) =
      _$CustomErrorCopyWithImpl<$Res>;
  $Res call({String? messageStr});
}

/// @nodoc
class _$CustomErrorCopyWithImpl<$Res> implements $CustomErrorCopyWith<$Res> {
  _$CustomErrorCopyWithImpl(this._value, this._then);

  final CustomError _value;
  // ignore: unused_field
  final $Res Function(CustomError) _then;

  @override
  $Res call({
    Object? messageStr = freezed,
  }) {
    return _then(_value.copyWith(
      messageStr: messageStr == freezed
          ? _value.messageStr
          : messageStr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GeneralCopyWith<$Res> implements $CustomErrorCopyWith<$Res> {
  factory _$GeneralCopyWith(_General value, $Res Function(_General) then) =
      __$GeneralCopyWithImpl<$Res>;
  @override
  $Res call({String? messageStr});
}

/// @nodoc
class __$GeneralCopyWithImpl<$Res> extends _$CustomErrorCopyWithImpl<$Res>
    implements _$GeneralCopyWith<$Res> {
  __$GeneralCopyWithImpl(_General _value, $Res Function(_General) _then)
      : super(_value, (v) => _then(v as _General));

  @override
  _General get _value => super._value as _General;

  @override
  $Res call({
    Object? messageStr = freezed,
  }) {
    return _then(_General(
      messageStr == freezed
          ? _value.messageStr
          : messageStr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_General extends _General {
  const _$_General([this.messageStr]) : super._();

  @override
  final String? messageStr;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _General &&
            const DeepCollectionEquality()
                .equals(other.messageStr, messageStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messageStr));

  @JsonKey(ignore: true)
  @override
  _$GeneralCopyWith<_General> get copyWith =>
      __$GeneralCopyWithImpl<_General>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? messageStr) general,
    required TResult Function(String? messageStr) noConnection,
    required TResult Function(String? messageStr) server,
    required TResult Function(String? messageStr) unimplemented,
    required TResult Function(String? messageStr) canceledByUser,
  }) {
    return general(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
  }) {
    return general?.call(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(messageStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Server value) server,
    required TResult Function(_Unimplemented value) unimplemented,
    required TResult Function(_CanceledByUser value) canceledByUser,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
  }) {
    return general?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class _General extends CustomError {
  const factory _General([String? messageStr]) = _$_General;
  const _General._() : super._();

  @override
  String? get messageStr;
  @override
  @JsonKey(ignore: true)
  _$GeneralCopyWith<_General> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NoConnectionCopyWith<$Res>
    implements $CustomErrorCopyWith<$Res> {
  factory _$NoConnectionCopyWith(
          _NoConnection value, $Res Function(_NoConnection) then) =
      __$NoConnectionCopyWithImpl<$Res>;
  @override
  $Res call({String? messageStr});
}

/// @nodoc
class __$NoConnectionCopyWithImpl<$Res> extends _$CustomErrorCopyWithImpl<$Res>
    implements _$NoConnectionCopyWith<$Res> {
  __$NoConnectionCopyWithImpl(
      _NoConnection _value, $Res Function(_NoConnection) _then)
      : super(_value, (v) => _then(v as _NoConnection));

  @override
  _NoConnection get _value => super._value as _NoConnection;

  @override
  $Res call({
    Object? messageStr = freezed,
  }) {
    return _then(_NoConnection(
      messageStr == freezed
          ? _value.messageStr
          : messageStr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NoConnection extends _NoConnection {
  const _$_NoConnection([this.messageStr]) : super._();

  @override
  final String? messageStr;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoConnection &&
            const DeepCollectionEquality()
                .equals(other.messageStr, messageStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messageStr));

  @JsonKey(ignore: true)
  @override
  _$NoConnectionCopyWith<_NoConnection> get copyWith =>
      __$NoConnectionCopyWithImpl<_NoConnection>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? messageStr) general,
    required TResult Function(String? messageStr) noConnection,
    required TResult Function(String? messageStr) server,
    required TResult Function(String? messageStr) unimplemented,
    required TResult Function(String? messageStr) canceledByUser,
  }) {
    return noConnection(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
  }) {
    return noConnection?.call(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(messageStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Server value) server,
    required TResult Function(_Unimplemented value) unimplemented,
    required TResult Function(_CanceledByUser value) canceledByUser,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection extends CustomError {
  const factory _NoConnection([String? messageStr]) = _$_NoConnection;
  const _NoConnection._() : super._();

  @override
  String? get messageStr;
  @override
  @JsonKey(ignore: true)
  _$NoConnectionCopyWith<_NoConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ServerCopyWith<$Res> implements $CustomErrorCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) then) =
      __$ServerCopyWithImpl<$Res>;
  @override
  $Res call({String? messageStr});
}

/// @nodoc
class __$ServerCopyWithImpl<$Res> extends _$CustomErrorCopyWithImpl<$Res>
    implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(_Server _value, $Res Function(_Server) _then)
      : super(_value, (v) => _then(v as _Server));

  @override
  _Server get _value => super._value as _Server;

  @override
  $Res call({
    Object? messageStr = freezed,
  }) {
    return _then(_Server(
      messageStr == freezed
          ? _value.messageStr
          : messageStr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Server extends _Server {
  const _$_Server([this.messageStr]) : super._();

  @override
  final String? messageStr;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Server &&
            const DeepCollectionEquality()
                .equals(other.messageStr, messageStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messageStr));

  @JsonKey(ignore: true)
  @override
  _$ServerCopyWith<_Server> get copyWith =>
      __$ServerCopyWithImpl<_Server>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? messageStr) general,
    required TResult Function(String? messageStr) noConnection,
    required TResult Function(String? messageStr) server,
    required TResult Function(String? messageStr) unimplemented,
    required TResult Function(String? messageStr) canceledByUser,
  }) {
    return server(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
  }) {
    return server?.call(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(messageStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Server value) server,
    required TResult Function(_Unimplemented value) unimplemented,
    required TResult Function(_CanceledByUser value) canceledByUser,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _Server extends CustomError {
  const factory _Server([String? messageStr]) = _$_Server;
  const _Server._() : super._();

  @override
  String? get messageStr;
  @override
  @JsonKey(ignore: true)
  _$ServerCopyWith<_Server> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnimplementedCopyWith<$Res>
    implements $CustomErrorCopyWith<$Res> {
  factory _$UnimplementedCopyWith(
          _Unimplemented value, $Res Function(_Unimplemented) then) =
      __$UnimplementedCopyWithImpl<$Res>;
  @override
  $Res call({String? messageStr});
}

/// @nodoc
class __$UnimplementedCopyWithImpl<$Res> extends _$CustomErrorCopyWithImpl<$Res>
    implements _$UnimplementedCopyWith<$Res> {
  __$UnimplementedCopyWithImpl(
      _Unimplemented _value, $Res Function(_Unimplemented) _then)
      : super(_value, (v) => _then(v as _Unimplemented));

  @override
  _Unimplemented get _value => super._value as _Unimplemented;

  @override
  $Res call({
    Object? messageStr = freezed,
  }) {
    return _then(_Unimplemented(
      messageStr == freezed
          ? _value.messageStr
          : messageStr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Unimplemented extends _Unimplemented {
  const _$_Unimplemented([this.messageStr]) : super._();

  @override
  final String? messageStr;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Unimplemented &&
            const DeepCollectionEquality()
                .equals(other.messageStr, messageStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messageStr));

  @JsonKey(ignore: true)
  @override
  _$UnimplementedCopyWith<_Unimplemented> get copyWith =>
      __$UnimplementedCopyWithImpl<_Unimplemented>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? messageStr) general,
    required TResult Function(String? messageStr) noConnection,
    required TResult Function(String? messageStr) server,
    required TResult Function(String? messageStr) unimplemented,
    required TResult Function(String? messageStr) canceledByUser,
  }) {
    return unimplemented(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
  }) {
    return unimplemented?.call(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
    required TResult orElse(),
  }) {
    if (unimplemented != null) {
      return unimplemented(messageStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Server value) server,
    required TResult Function(_Unimplemented value) unimplemented,
    required TResult Function(_CanceledByUser value) canceledByUser,
  }) {
    return unimplemented(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
  }) {
    return unimplemented?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
    required TResult orElse(),
  }) {
    if (unimplemented != null) {
      return unimplemented(this);
    }
    return orElse();
  }
}

abstract class _Unimplemented extends CustomError {
  const factory _Unimplemented([String? messageStr]) = _$_Unimplemented;
  const _Unimplemented._() : super._();

  @override
  String? get messageStr;
  @override
  @JsonKey(ignore: true)
  _$UnimplementedCopyWith<_Unimplemented> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CanceledByUserCopyWith<$Res>
    implements $CustomErrorCopyWith<$Res> {
  factory _$CanceledByUserCopyWith(
          _CanceledByUser value, $Res Function(_CanceledByUser) then) =
      __$CanceledByUserCopyWithImpl<$Res>;
  @override
  $Res call({String? messageStr});
}

/// @nodoc
class __$CanceledByUserCopyWithImpl<$Res>
    extends _$CustomErrorCopyWithImpl<$Res>
    implements _$CanceledByUserCopyWith<$Res> {
  __$CanceledByUserCopyWithImpl(
      _CanceledByUser _value, $Res Function(_CanceledByUser) _then)
      : super(_value, (v) => _then(v as _CanceledByUser));

  @override
  _CanceledByUser get _value => super._value as _CanceledByUser;

  @override
  $Res call({
    Object? messageStr = freezed,
  }) {
    return _then(_CanceledByUser(
      messageStr == freezed
          ? _value.messageStr
          : messageStr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CanceledByUser extends _CanceledByUser {
  const _$_CanceledByUser([this.messageStr]) : super._();

  @override
  final String? messageStr;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CanceledByUser &&
            const DeepCollectionEquality()
                .equals(other.messageStr, messageStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messageStr));

  @JsonKey(ignore: true)
  @override
  _$CanceledByUserCopyWith<_CanceledByUser> get copyWith =>
      __$CanceledByUserCopyWithImpl<_CanceledByUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? messageStr) general,
    required TResult Function(String? messageStr) noConnection,
    required TResult Function(String? messageStr) server,
    required TResult Function(String? messageStr) unimplemented,
    required TResult Function(String? messageStr) canceledByUser,
  }) {
    return canceledByUser(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
  }) {
    return canceledByUser?.call(messageStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? messageStr)? general,
    TResult Function(String? messageStr)? noConnection,
    TResult Function(String? messageStr)? server,
    TResult Function(String? messageStr)? unimplemented,
    TResult Function(String? messageStr)? canceledByUser,
    required TResult orElse(),
  }) {
    if (canceledByUser != null) {
      return canceledByUser(messageStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Server value) server,
    required TResult Function(_Unimplemented value) unimplemented,
    required TResult Function(_CanceledByUser value) canceledByUser,
  }) {
    return canceledByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
  }) {
    return canceledByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Server value)? server,
    TResult Function(_Unimplemented value)? unimplemented,
    TResult Function(_CanceledByUser value)? canceledByUser,
    required TResult orElse(),
  }) {
    if (canceledByUser != null) {
      return canceledByUser(this);
    }
    return orElse();
  }
}

abstract class _CanceledByUser extends CustomError {
  const factory _CanceledByUser([String? messageStr]) = _$_CanceledByUser;
  const _CanceledByUser._() : super._();

  @override
  String? get messageStr;
  @override
  @JsonKey(ignore: true)
  _$CanceledByUserCopyWith<_CanceledByUser> get copyWith =>
      throw _privateConstructorUsedError;
}
