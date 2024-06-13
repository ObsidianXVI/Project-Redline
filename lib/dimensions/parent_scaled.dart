part of redline.dimensions;

/// Widgets placed in a [ParentScaled] allow their dimensions to be responsive
/// according to the parent widget's dimensions. This works great but uses [LayoutBuilder]
/// which is relatively expensive. See [ViewportScaled] for an alternative.
class ParentScaled extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final double heightFactor;

  const ParentScaled({
    required this.child,
    this.widthFactor = 1,
    this.heightFactor = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => SizedBox(
        height: heightFactor * constraints.maxHeight,
        width: widthFactor * constraints.maxWidth,
        child: child,
      ),
    );
  }
}
