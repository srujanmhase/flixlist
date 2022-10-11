import 'package:flutter/material.dart';

class AppUtils {
  static void showSnackBar(
    BuildContext context,
    String message, {
    double? width,
    Color? backgroundColor,
    void Function()? onComplete,
    SnackBarBehavior? behavior,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            backgroundColor: backgroundColor,
            content: Text(message),
            duration: duration ?? const Duration(seconds: 4),
            width: width,
            behavior: behavior,
          ),
        )
        .closed
        .then((value) {
      if (onComplete != null) onComplete();
    });
  }
}
