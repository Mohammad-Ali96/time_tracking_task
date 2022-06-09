// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:time_tracking/core/domain/entities/failures.dart';
import 'package:time_tracking/core/domain/repositories/base_repository.dart';
import 'package:time_tracking/core/domain/utils/constants.dart';
import 'package:time_tracking/core/domain/utils/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';




class BaseRepositoryImpl implements BaseRepository {
  final NetworkInfo _networkInfo;
  final Logger _logger;

  BaseRepositoryImpl(this._networkInfo, this._logger);

  @override
  Future<Either<Failure, T>> request<T>(
    FutureEitherFailureOrData<T> body, {
    bool checkToken = true,
  }) async {
    try {
      if (!await _networkInfo.isConnected) {
        return left(ServerFailure(
            errorCode: ServerErrorCode.noInternetConnection, messages: []));
      }
      return await body();
    } catch (e) {
      if (e is DioError) {
        _logger.e(e.message, e, e.stackTrace);

        var message = '';
        List<String>? messages;
        var errorCode = ServerErrorCode.serverError;

        if (e.response != null) {
          errorCode = _getErrorCode(e.response!.statusCode ?? 500);

        }

        return left(ServerFailure(
            errorCode: errorCode, message: message, messages: messages ?? []));
      } else if (e is Error) {
        _logger.e(e.toString(), e, e.stackTrace);
      } else {
        _logger.e(e);
      }

      return left(
          ServerFailure(errorCode: ServerErrorCode.serverError, messages: []));
    }
  }

  ServerErrorCode _getErrorCode(int statusCode) {
    switch (statusCode) {
      case 401:
        return ServerErrorCode.unauthenticated;
      case 404:
        return ServerErrorCode.notFound;
      case 403:
        return ServerErrorCode.forbidden;
      case 400:
        return ServerErrorCode.invalidData;
      case 422:
        return ServerErrorCode.wrongInput;
      default:
        return ServerErrorCode.serverError;
    }
  }

}
