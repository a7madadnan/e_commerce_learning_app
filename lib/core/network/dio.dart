import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final dioProvider = Provider(
  (red) => Dio(
    BaseOptions(
      baseUrl: 'https://taliphus.vercel.app/api',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  ),
);
