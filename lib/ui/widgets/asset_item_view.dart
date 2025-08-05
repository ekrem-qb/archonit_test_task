import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/assets/assets_bloc.dart';
import '/consts.dart';
import '/ui/asset_color.dart';
import '/utils/result.dart';

class AssetItemView extends StatelessWidget {
  const AssetItemView(this.index, {super.key});

  final int index;

  @override
  Widget build(final BuildContext context) {
    final asset = context.select((final AssetsBloc bloc) {
      switch (bloc.state.assets) {
        case Success(:final data):
          if (index >= data.length) {
            if (bloc.state.totalCount == null) {
              bloc.add(AssetsEventLoadRequested(offset: data.length));
            }

            return null;
          }

          return data[index];
        default:
          return null;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          _Icon(asset?.color),
          if (asset != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultTextStyle(
                  style: kAssetTextStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(asset.symbol),
                      Text(
                        CurrencyFormatter.format(
                          asset.priceUsd ?? 0,
                          kCurrencyFormat,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon(this.color);

  final Color? color;

  @override
  Widget build(final BuildContext context) {
    return SizedBox.square(
      dimension: kAssetIconSize,
      child: color != null
          ? DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                borderRadius: kAssetIconBorderRadius,
              ),
            )
          : const CupertinoActivityIndicator(),
    );
  }
}
