import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '/bloc/assets/assets_bloc.dart';
import '/consts.dart';
import '/utils/result.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return const CupertinoPageScaffold(
      child: _List(),
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(final BuildContext context) {
    final (_, count, bloc) = context.select(
      (final AssetsBloc bloc) =>
          (bloc.state.assets.runtimeType, bloc.state.totalCount, bloc),
    );

    return switch (bloc.state.assets) {
      Loading() => const Center(
        child: CupertinoActivityIndicator(),
      ),
      Error(:final error) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            error.toString(),
            style: const TextStyle(
              color: CupertinoColors.systemRed,
            ),
          ),
        ),
      ),
      Success() => ListView.builder(
        itemCount: count,
        itemBuilder: (final context, final index) => _Item(index),
      ),
    };
  }
}

class _Item extends StatelessWidget {
  const _Item(this.index);

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
          SizedBox.square(
            dimension: 56,
            child: asset != null
                ? Opacity(
                    opacity: 0.1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemRed,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  )
                : const CupertinoActivityIndicator(),
          ),
          if (asset != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.41,
                    color: Color(0xFF17171A),
                  ),
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
