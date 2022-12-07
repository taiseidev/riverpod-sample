import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((_) {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor());
  return dio;
});
