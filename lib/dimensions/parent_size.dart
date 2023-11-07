part of redline.dimensions;

class ParentSize extends StatelessWidget {
  final Widget child;
  final Color? color;

  const ParentSize({
    required this.child,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: color,
      child: child,
    );
  }
}
