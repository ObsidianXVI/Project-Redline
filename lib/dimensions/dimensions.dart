library redline.dimensions;

import 'package:flutter/widgets.dart';

part './viewport_size.dart';
part './parent_size.dart';

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
