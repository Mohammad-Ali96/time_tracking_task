import 'package:time_tracking/core/domain/entities/failures.dart';
import 'package:time_tracking/core/domain/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

mixin ScreenUtils<T extends StatefulWidget> on State<T> {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? handleError(
      {Failure? failure,
      String? customMessage,
      bool isFloating = true}) {
    return showError(
        failure: failure,
        customMessage: customMessage,
        isFloating: isFloating);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
      {Failure? failure,
      String? customMessage,
      bool isFloating = false}) {
    String message = customMessage ?? 'error_message'.tr();

    if (failure != null && failure is ServerFailure) {
      if (failure.errorCode == ServerErrorCode.noInternetConnection) {
        message = 'no_internet_connection_message'.tr();
      } else if (failure.errorCode == ServerErrorCode.forbidden) {
        message = 'access_denied_message'.tr();
      } else if (failure.errorCode == ServerErrorCode.unauthenticated) {
        message = 'unauthenticated_message'.tr();
      } else if (failure.message.isNotEmpty) {
        message = failure.message;
      } else if (failure.errorCode == ServerErrorCode.invalidData && failure.messages != null && failure.messages!.isNotEmpty) {
        message = failure.messages!.first;
      }
    } else if (failure != null && failure is LogicFailure) {
      if (failure.message.isNotEmpty) {
        message = failure.message;
      }
    } else if (failure != null && failure is AppAccessDeniedFailure) {
      message = 'no_access'.tr();
    }

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).errorColor,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
      {String? customMessage, bool isFloating = false}) {
    String message = customMessage ?? 'success'.tr();

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }
}
