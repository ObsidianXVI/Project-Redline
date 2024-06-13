part of redline.dimensions;

mixin ViewportScaling {
  double responsive(num original) =>
      original * Multiplatform.currentPlatform.widthRatio;
  double reciprocalResponsive(num original) =>
      original / Multiplatform.currentPlatform.widthRatio;
}
