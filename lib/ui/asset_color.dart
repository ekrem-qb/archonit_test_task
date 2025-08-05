import 'dart:ui';

import '/api/entity/asset.dart';
import '/consts.dart';

extension AssetColor on Asset {
  /// Generates a color based on the asset id.
  Color get color {
    final value = id.hashCode;

    final r = (value ~/ (256 * 256)) % 256;
    final g = (value ~/ 256) % 256;
    final b = value % 256;

    return Color.fromRGBO(r, g, b, kAssetColorOpacity);
  }
}
