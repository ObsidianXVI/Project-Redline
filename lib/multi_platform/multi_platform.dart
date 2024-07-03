library redline.multiplatform;

import 'dart:html';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:project_redline/dimensions/dimensions.dart';

part './textstyle_delegate.dart';

abstract class DetectedPlatform {
  final String platformId;
  final int baseWidth;
  final int baseHeight;

  const DetectedPlatform(
    this.platformId, {
    required this.baseWidth,
    required this.baseHeight,
  });

  double get widthRatio => window.innerWidth! / baseWidth;

  @override
  bool operator ==(Object? other) =>
      other is DetectedPlatform && platformId == other.platformId;

  @override
  int get hashCode => platformId.hashCode;
}

typedef PlatformSelector = DetectedPlatform Function(
    double width, double height);

class Multiplatform {
  static late DetectedPlatform currentPlatform;
  static late PlatformSelector platformSelector;
  static late final TextStyle baseStyle;
  static bool _hasInit = false;

  /// Previous attempts to use [MediaQuery.of] or  [window.innerWidth] to decide
  /// the platform have proven inconsistent across browsers. On iOS, for instance,
  /// it returns 980x1461 due to the fact that the device pixel ratio is not taken into account.
  /// Just another day in the ducked-up world that we live in. This is what happens when
  /// the world wide web, with its billions of users, is held together with glue and tape,
  /// and nobody can change it because we've already been vendor locked-in to stupid
  /// JavaScript and DOM.
  /// See also: https://stackoverflow.com/questions/4629969/ios-return-bad-value-for-window-innerheight-width
  /// Fixed with: https://stackoverflow.com/a/57237870/19418962
  static void init({
    required PlatformSelector platformSelector,
    required TextStyle baseStyle,
  }) {
    if (_hasInit) return;
    Multiplatform.platformSelector = platformSelector;
    Multiplatform.baseStyle = baseStyle;
    Multiplatform.currentPlatform =
        platformSelector(Dimensions.width(), Dimensions.height());

    _hasInit = true;
  }
}
