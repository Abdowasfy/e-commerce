import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showAnimatedSnackBarDialog({
  required BuildContext context,
  String? message,
  AnimatedSnackBarType? type,
}) {
  AnimatedSnackBar.material(
    message ?? '',
    type: type ?? AnimatedSnackBarType.success,
    duration: Duration(seconds: 2),
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
  ).show(context);
}