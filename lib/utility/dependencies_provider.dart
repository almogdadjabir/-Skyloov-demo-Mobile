import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:skyloov/utility/constants.dart';

final getIt = GetIt.instance;

class DependenciesProvider {
  DependenciesProvider._();
  static void build() {

    final Dio client = Dio();
    String _baseUrl = '${Constants.baseUrl}';

    client.interceptors.add(kDebugMode
        ? LogInterceptor(
      request: true,
      responseBody: true,
      requestHeader: true,
      error: true,
      requestBody: true,
      responseHeader: true,
    )
        : LogInterceptor(
      request: false,
      responseBody: false,
      requestHeader: false,
      error: false,
      requestBody: false,
      responseHeader: false,
    ));

    client.options = BaseOptions(
      baseUrl: _baseUrl,
      responseType: ResponseType.json,
    );
    client.options.headers['X-localization'] = 'ar';
    client.options.headers['Accept']='application/json';
    client.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestHeader: true,
      error: true,
      requestBody: true,
      responseHeader: true,
    ));

    // client.interceptors.add(TokenInterceptor(userSession));

    // getIt.registerSingleton<UserSession>(userSession);
    getIt.registerSingleton<Dio>(client);

     // getIt.registerFactory<AuthRepository>(() => AuthRepository(client));
  }

  static T provide<T extends Object>() {
    return getIt.get<T>();
  }


}