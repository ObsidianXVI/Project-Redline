part of redline.dimensions;

class ViewportSize extends StatelessWidget {
  final Widget child;

  const ViewportSize({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height(),
      width: Dimensions.width(),
      child: child,
    );
  }
}

mixin VisibilityDetection {
  Widget withVisibilityCallback({
    required Key key,
    required Widget child,
    required void Function(VisibilityInfo) onVisibilityChanged,
  }) {
    return VisibilityDetector(
      key: key,
      onVisibilityChanged: onVisibilityChanged,
      child: child,
    );
  }
}
