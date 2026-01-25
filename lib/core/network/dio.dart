import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

final dioProvider = Provider((red) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://taliphus.vercel.app/api',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  dio.interceptors.add(
    TalkerDioLogger(
      talker: logger,
      settings: TalkerDioLoggerSettings(
        responseFilter: (response) => response.data.toString().length < 10000,
        printErrorData: true,
        printRequestHeaders: true,
        printErrorHeaders: true,
        printErrorMessage: true,
      ),
    ),
  );
  return dio;
});

final logger = Talker(
  settings: TalkerSettings(maxHistoryItems: 100),
  logger: TalkerLogger(
    formatter: const ColoredLoggerFormatter(),
    output: (message) {
      defaultTargetPlatform == TargetPlatform.android
          ? message.split('\n').forEach(debugPrint)
          : log(message, name: 'Talker');
    },
  ),
);
