library redline.dimensions;

import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:project_redline/multi_platform/multi_platform.dart';
import 'package:visibility_detector/visibility_detector.dart';

part './viewport_size.dart';
part './viewport_scaled.dart';
part './parent_size.dart';
part './parent_scaled.dart';

class Dimensions {
  static final ui.FlutterView _view =
      WidgetsBinding.instance.platformDispatcher.views.first;
  static double height() {
    return WidgetsBinding
            .instance.platformDispatcher.views.first.physicalSize.height /
        _view.devicePixelRatio;
  }

  static double width() {
    return WidgetsBinding
            .instance.platformDispatcher.views.first.physicalSize.width /
        _view.devicePixelRatio;
  }
}
