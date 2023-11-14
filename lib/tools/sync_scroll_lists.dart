part of redline.tools;

mixin SynchronisedScrollLists {
  final PageController controller1 = PageController();
  final PageController controller2 = PageController();

  /// Cool mechanism to prevent the controller's callback from being
  /// fired by the follower controller while animating.
  PageController? activeController;

  /// If set, this [Duration] will be used for both controllers. Leave null to
  /// pass different [Duration]s to both controller animations.
  Duration? standardisedDuration;

  /// If set, this [Curve] will be used for both controllers. Leave null to
  /// pass different [Curve]s to both controller animations.
  Curve? standardisedCurve;

  void controller1Callback(
    int pos, {
    Duration? duration,
    Curve? curve,
  }) async {
    activeController ??= controller1;
    if (activeController == controller1) {
      await controller2.animateToPage(
        pos,
        duration: standardisedDuration ?? duration ?? Duration.zero,
        curve: standardisedCurve ?? curve ?? Curves.linear,
      );
      activeController = null;
    }
  }

  void controller2Callback(
    int pos, {
    Duration? duration,
    Curve? curve,
  }) async {
    activeController ??= controller2;
    if (activeController == controller2) {
      await controller1.animateToPage(
        pos,
        duration: standardisedDuration ?? duration ?? Duration.zero,
        curve: standardisedCurve ?? curve ?? Curves.linear,
      );
      activeController = null;
    }
  }
}
