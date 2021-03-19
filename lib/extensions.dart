import 'dart:async';

import 'package:flutter/material.dart';

typedef FutureDelayCallBack = FutureOr Function();

extension ExtendedBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get mediaQuerySize => mediaQuery.size;
  double get width => mediaQuerySize.width;
  double get height => mediaQuerySize.height;
}

extension ExtendedNum on num {
  Duration get milliseconds => Duration(microseconds: (this * 1000).round());

  Duration get seconds => Duration(milliseconds: (this * 1000).round());

  Duration get minutes =>
      Duration(seconds: (this * Duration.secondsPerMinute).round());

  Duration get hours =>
      Duration(minutes: (this * Duration.minutesPerHour).round());

  Duration get days => Duration(hours: (this * Duration.hoursPerDay).round());

  Future delay([FutureDelayCallBack? callback]) async => Future.delayed(
        Duration(milliseconds: (this * 1000).round()),
        callback,
      );
  double get _double => toDouble();
  SizedBox get sizedHeight => SizedBox(
        height: _double,
      );
  SizedBox get sizedWidth => SizedBox(
        width: _double,
      );
  EdgeInsetsGeometry get padAll => EdgeInsets.all(_double);
  EdgeInsetsGeometry get padBottom => EdgeInsets.only(bottom: _double);
  EdgeInsetsGeometry get padTop => EdgeInsets.only(top: _double);
  EdgeInsetsGeometry get padRight => EdgeInsets.only(right: _double);
  EdgeInsetsGeometry get padLeft => EdgeInsets.only(left: _double);
  EdgeInsetsGeometry get padHort => EdgeInsets.symmetric(horizontal: _double);
  EdgeInsetsGeometry get padVert => EdgeInsets.symmetric(vertical: _double);
}

extension ExtendedButtonType on ButtonStyle {
  ButtonStyle customCopyWith(ButtonStyle buttonStyle) {
    return ButtonStyle(
      textStyle: buttonStyle.textStyle ?? textStyle,
      backgroundColor: buttonStyle.backgroundColor ?? backgroundColor,
      foregroundColor: buttonStyle.foregroundColor ?? foregroundColor,
      overlayColor: buttonStyle.overlayColor ?? overlayColor,
      shadowColor: buttonStyle.shadowColor ?? shadowColor,
      elevation: buttonStyle.elevation ?? elevation,
      padding: buttonStyle.padding ?? padding,
      minimumSize: buttonStyle.minimumSize ?? minimumSize,
      side: buttonStyle.side ?? side,
      shape: buttonStyle.shape ?? shape,
      mouseCursor: buttonStyle.mouseCursor ?? mouseCursor,
      visualDensity: buttonStyle.visualDensity ?? visualDensity,
      tapTargetSize: buttonStyle.tapTargetSize ?? tapTargetSize,
      animationDuration: buttonStyle.animationDuration ?? animationDuration,
      enableFeedback: buttonStyle.enableFeedback ?? enableFeedback,
    );
  }
}

extension ExtendedType on Object {
  bool get isEnum => toString().contains('.');

  String get getString {
    if (isEnum) {
      return toString().substring(toString().indexOf('.') + 1);
    } else {
      return toString();
    }
  }
}

extension ExtendedOrientation on Orientation {
  bool get isLandscape => this == Orientation.landscape;
  bool get isPortrait => this == Orientation.portrait;
}

extension ExtendedAnimationController on AnimationStatus {
  /// The animation is stopped at the end.
  bool get isCompleted => this == AnimationStatus.completed;

  /// The animation is running backwards, from end to beginning.
  bool get isDismissed => this == AnimationStatus.dismissed;

  /// The animation is running from beginning to end.
  bool get forwarding => this == AnimationStatus.forward;

  /// The animation is stopped at the beginning.
  bool get reversing => this == AnimationStatus.reverse;
}

extension ExtendedString on String {
  int toInt() => int.parse(this);
  double toDouble() => double.parse(this);
  DateTime toDate() => DateTime.parse(this);
}
