part of redline.tools;

class ViewportSnappingScrollView extends StatelessWidget {
  final List<ViewportSize> children;

  const ViewportSnappingScrollView({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: PageController(),
      physics: const PageScrollPhysics(),
      child: Column(
        children: children,
      ),
    );
  }
}
