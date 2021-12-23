import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

enum RequestMethod { get, post, put, patch, delete }

abstract class IApiCaller {
  IApiCaller({bool? logResponse = false}) {
    this.logResponse = logResponse ?? false;
  }
  late bool logResponse;

  void close();

  Future makeReq(String path, RequestMethod method, {dynamic data});

  Future get(String path, {dynamic data});

  Future post(String path, {dynamic data});

  Future put(String path, {dynamic data});

  Future patch(String path, {dynamic data});

  Future delete(String path, {dynamic data});
}

@Injectable(as: IApiCaller)
class NewApiCaller extends IApiCaller {
  NewApiCaller({@factoryParam bool? logResponse})
      : super(logResponse: logResponse) {
    // userBox = Hive.box<String>(userBoxName).listenable()
    //   ..addListener(_refreshDio);
    // settingsBox = Hive.box<SettingsModel>(settingsBoxName).listenable()
    //   ..addListener(_refreshDio);

    _dio = _configureDioClient();
  }

  // late ValueListenable<Box<String>> userBox;
  // late ValueListenable<Box<SettingsModel>> settingsBox;

  // void _refreshDio() {
  //   debugPrint(
  //     '${DateFormat.Hms('en').format(DateTime.now())} -> NewApiCaller::refreshing Dio clint',
  //   );
  //   _dio = _configureDioClient();
  // }

  late Dio _dio;

  final cancelTokensList = <CancelToken>[];

  void _addNewCancelToken(CancelToken cancelToken) {
    debugPrint(
      '${DateFormat.Hms('en').format(DateTime.now())} -> NewApiCaller::adding new cancelToken ${cancelToken.url}',
    );

    cancelTokensList.add(cancelToken);
  }

  @override
  void close() {
    debugPrint(
      '${DateFormat.Hms('en').format(DateTime.now())} -> NewApiCaller::begin close()',
    );
    // userBox.removeListener(_refreshDio);
    // settingsBox.removeListener(_refreshDio);
    for (final cancelToken in cancelTokensList) {
      try {
        debugPrint(
          '${DateFormat.Hms('en').format(DateTime.now())} -> NewApiCaller::closing ${cancelToken.url}',
        );
        cancelToken.cancel();
      } catch (e) {
        debugPrint(
          '${DateFormat.Hms('en').format(DateTime.now())} -> NewApiCaller::${cancelToken.url} closing failed',
        );
      }
    }
  }

  @override
  Future makeReq(String path, RequestMethod method, {dynamic data}) async {
    switch (method) {
      case RequestMethod.get:
        return get(path, data: data);
      case RequestMethod.post:
        return post(path, data: data);
      case RequestMethod.put:
        return put(path, data: data);
      case RequestMethod.patch:
        return patch(path, data: data);
      case RequestMethod.delete:
        return delete(path, data: data);
    }
  }

  @override
  Future get(String path, {dynamic data}) async {
    final cancelToken = CancelToken();
    final res = _dio.get(path, queryParameters: data, cancelToken: cancelToken);
    _addNewCancelToken(cancelToken);
    return (await res).data;
  }

  @override
  Future post(String path, {dynamic data}) async {
    final cancelToken = CancelToken();
    final res = _dio.post(path, data: data, cancelToken: cancelToken);
    _addNewCancelToken(cancelToken);
    return (await res).data;
  }

  @override
  Future put(String path, {dynamic data}) async {
    final cancelToken = CancelToken();
    final res = _dio.put(path, data: data, cancelToken: cancelToken);
    _addNewCancelToken(cancelToken);
    return (await res).data;
  }

  @override
  Future patch(String path, {dynamic data}) async {
    final cancelToken = CancelToken();
    final res = _dio.patch(path, data: data, cancelToken: cancelToken);
    _addNewCancelToken(cancelToken);
    return (await res).data;
  }

  @override
  Future delete(String path, {dynamic data}) async {
    final cancelToken = CancelToken();
    final res = _dio.delete(path, data: data, cancelToken: cancelToken);
    _addNewCancelToken(cancelToken);
    return (await res).data;
  }

  static Map<String, dynamic> _getHeaders() {
    // final token = getIt<IUserLocalDataSource>().readAuthToken();
    // final languageCode =
    //     getIt<ISettingsDataSource>().getSettings().languageCode;
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Accept-Language': languageCode,
      // if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Dio _configureDioClient() {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://talab.evancarlo.com/api',
      headers: _getHeaders(),
    ));
    final options = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    dio.interceptors.add(DioCacheInterceptor(options: options));

    return dio;
  }
}

extension on CancelToken {
  String? get url => requestOptions?.path;
}

typedef ListItemParser<T> = T Function(dynamic data);

List<T> listParser<T>(dynamic data, ListItemParser<T> parser) {
  final list = <T>[];
  if (data is List) {
    for (final item in data) {
      list.add(parser(item));
    }
  }
  return list;
}
