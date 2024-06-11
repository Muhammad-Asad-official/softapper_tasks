

import 'package:flutter/material.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class SnackBarUtils {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
      {required String title, required bool isError, int duration = 2}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
    return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error : Icons.check_circle,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

          ],
        ),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: isError ? SnackBarBehavior.fixed :SnackBarBehavior.floating,
        duration: Duration(seconds: duration),
      ),
    );
  }
}
