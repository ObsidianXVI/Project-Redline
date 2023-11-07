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
      height: Dimensions.height(context),
      width: Dimensions.width(context),
      child: child,
    );
  }
}
