part of redline.tools;

mixin SynchronisedScrollLists {
  final PageController controller1 = PageController();
  final PageController controller2 = PageController();

  void controller1Callback(int pos) => controller2.jumpToPage(pos);
  void controller2Callback(int pos) => controller1.jumpToPage(pos);
}
