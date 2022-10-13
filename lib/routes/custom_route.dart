import 'package:flutter/material.dart';

class FlixRoute extends PageRouteBuilder<dynamic> {
  FlixRoute({required this.widget, required this.offset, this.name})
      : super(
          opaque: false,
          barrierDismissible: true,
          barrierColor: Colors.grey.withOpacity(0.5),
          pageBuilder: (context, animation, _) {
            return widget;
          },
          settings: RouteSettings(name: name),
          transitionsBuilder: (context, animation, _, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset(0, offset),
                ).animate(animation),
                child: child,
              ),
            );
          },
        );
  final Widget widget;
  final double offset;
  final String? name;
}
