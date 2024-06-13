part of redline.tools;

class ViewportSnappingScrollView extends StatelessWidget {
  final void Function(int pageIndex)? listener;
  final PageController pageController;
  final List<ViewportSize> children;

  ViewportSnappingScrollView({
    required this.children,
    PageController? controller,
    this.listener,
    super.key,
  }) : pageController = controller ?? PageController() {
    if (listener != null) {
      pageController.addListener(() {
        listener!.call(pageController.page!.toInt());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: pageController,
      physics: const PageScrollPhysics(),
      child: Column(
        children: children,
      ),
    );
  }
}
