library redline.dimensions;

import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:project_redline/multi_platform/multi_platform.dart';

part './viewport_size.dart';
part './viewport_scaled.dart';
part './parent_size.dart';
part './parent_scaled.dart';

class Dimensions {
  static double height(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;
    final height = MediaQuery.of(context).size.height;
    return height - padding.top;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
