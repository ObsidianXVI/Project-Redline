/// # Adaptive Switching
/// To use adaptive breakpoint switching (ABS):
/// ## Configure
/// - Fill up the [AdaptiveBreakpointConfigs.breakpointsRegistry] with different contstraints for each breakpoint. Each entry maps a [List] of 2 [Size]s — the lower bound and upper bound — to a [Widget] builder
/// - Each [Widget] builder is passed an instance of the widget's [AdaptiveBreakpointSwitching] instance
/// - Inside the builder, call the desired method on the [AdaptiveBreakpointSwitching] instance that builds the right [Widget] for that breakpoint
///
/// ## Use
/// - Extend one of the base classes with ABS: [StatelessABS] for [StatelessWidget]s and [StatefulABS] for [State] objects accompanying [StatefulWidget]s
/// - Implement the

/**
 * mixin MyAbs on AdaptiveBreakpointSwitching {
  Widget buildIOS();
}

class MyCard extends StatelessABS with MyAbs {
  @override
  Widget buildIOS() {
    // TODO: implement buildIOS
    throw UnimplementedError();
  }
}

 */
library redline.multiplatform;

import 'dart:math';

import 'package:flutter/widgets.dart';
import 'dart:html';

part './adaptive_switching.dart';
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

typedef PlatformSelector = DetectedPlatform Function(int width, int height);

class Multiplatform {
  static late DetectedPlatform currentPlatform;
  static late PlatformSelector platformSelector;
  static late final TextStyle baseStyle;
  static bool _hasInit = false;

  /// [init] needs to access [BuildContext] to use [MediaQuery.of] and _then_ deicde
  /// the platform to use. [window.innerWidth] has been used previously, but it is
  /// inconsistent across browsers. On iOS, for instance, it returns 980x1461. Just
  /// another day in the ducked-up world that we live in. This is what happens when
  /// the world wide web, with its billions of users, is held together with glue and tape,
  /// and nobody can change it because we've already been vendor locked-in to stupid
  /// JavaScript and DOM.
  /// See also: https://stackoverflow.com/questions/4629969/ios-return-bad-value-for-window-innerheight-width
  static void init({
    required BuildContext context,
    required PlatformSelector platformSelector,
    required TextStyle baseStyle,
  }) {
    if (_hasInit) return;
    Multiplatform.platformSelector = platformSelector;
    Multiplatform.baseStyle = baseStyle;
    Multiplatform.currentPlatform = platformSelector(
        document.body!.clientWidth, document.body!.clientHeight);

    _hasInit = true;
  }
}
