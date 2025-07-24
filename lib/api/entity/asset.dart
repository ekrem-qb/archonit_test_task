import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
sealed class Asset with _$Asset {
  const factory Asset({
    required final String id,
    required final String rank,
    required final String symbol,
    required final String? priceUsd,
  }) = _Asset;

  factory Asset.fromJson(final Map<String, dynamic> json) =>
      _$AssetFromJson(json);
}
