part of redline.multiplatform;

class AdaptiveBreakpointConfigs {
  static final Map<List<int>, Widget Function(AdaptiveBreakpointSwitching)>
      breakpointsRegistry = {};
}

mixin AdaptiveBreakpointSwitching {
  int getIndexOfMatchingEntry(
    List<MapEntry<List<int>, Widget Function(AdaptiveBreakpointSwitching)>>
        entries,
    Size size,
  ) {
    for (int i = 0; i < entries.length; i++) {
      final lower = entries[i].key[0];
      final upper = entries[i].key[1];
      if (lower <= size.width && size.width <= upper) {
        return i;
      }
    }
    throw "redline.multiplatfom.abs (render): No matching breakpoint found for current window size";
  }

  Widget render(BuildContext context) {
    if (AdaptiveBreakpointConfigs.breakpointsRegistry.isNotEmpty) {
      final size = MediaQuery.of(context).size;
      final entries =
          AdaptiveBreakpointConfigs.breakpointsRegistry.entries.toList();
      return entries[getIndexOfMatchingEntry(entries, size)].value.call(this);
    } else {
      throw "redline.multiplatfom.abs (render): MultiPlatformConfigs.breakpointsRegistry is empty";
    }
  }
}

abstract class StatelessABS extends StatelessWidget
    with AdaptiveBreakpointSwitching {
  const StatelessABS({super.key});

  @override
  Widget build(BuildContext context) => render(context);
}

abstract class StatefulABS<T extends StatefulWidget> extends State<T>
    with AdaptiveBreakpointSwitching {
  @override
  Widget build(BuildContext context) => render(context);
}
