part of redline.multiplatform;

/// A [ResponsiveTypeface] allows different [TextStyle]s to be used for different
/// [DetectedPlatform]s. To use this, follow the subsequent steps:
/// ```dart
/// class HeaderOne extends ResponsiveTypeface {
///   HeaderOne() {
///     styleDelegates.addAll({
///       const DesktopPlatform(): TextStyle(fontSize: scaled(120)),
///       const MobilePlatform(): TextStyle(fontSize: 50),
///     });
///   }
/// }
/// ```
/// In the above case, we want the typeface to have a font size of 120, but also
/// to scale responsively with the desktop dimensions, hence the call to `scaled`.
/// The reason the delegate's method signature includes another [TextStyle]
/// is so that we can override, at any point in our app, the result provided
/// by the delegate. Refer to the following for an example usage of the delegate:
/// ```dart
/// final heading1 = HeaderOne();
/// ...
///   Text(
///     'Default heading1 style',
///     style: heading1.apply(),
///   ),
///   Text(
///     'Overriden to be bolded',
///     style: heading1.apply(TextStyle(fontWeight: FontWeight.bold)),
///   ),
/// ```
abstract class ResponsiveTypeface {
  final Map<DetectedPlatform, TextStyle> styleDelegates = {};

  TextStyle apply([TextStyle? override]) {
    final bool hasStyleForPlatform =
        styleDelegates.containsKey(Multiplatform.currentPlatform);

    if (hasStyleForPlatform) {
      return Multiplatform.baseStyle
          .merge(styleDelegates[Multiplatform.currentPlatform]!)
          .merge(override);
    } else {
      return Multiplatform.baseStyle.merge(override);
    }
  }
}

double scaled(double baseSize, [double? minSize]) {
  if (minSize == null) {
    return Multiplatform.currentPlatform.widthRatio * baseSize;
  } else {
    return max(Multiplatform.currentPlatform.widthRatio * baseSize, minSize);
  }
}
