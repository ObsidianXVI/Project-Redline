part of redline.dimensions;

class ParentSize extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;

  const ParentSize({
    required this.child,
    this.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: decoration,
      child: child,
    );
  }
}
