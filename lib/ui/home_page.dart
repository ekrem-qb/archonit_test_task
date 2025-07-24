import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '/api/client.dart';
import '/consts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    final assetsFuture = context.read<ApiClient>().getAssets();

    return CupertinoPageScaffold(
      child: FutureBuilder(
        future: assetsFuture,
        builder: (final context, final snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData) {
            return const Center(child: CupertinoActivityIndicator());
          } else {
            final assets = snapshot.data!;

            return ListView.builder(
              itemCount: assets.length,
              itemBuilder: (final context, final index) {
                final asset = assets[index];
                return Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Opacity(
                        opacity: 0.1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemRed,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const SizedBox.square(dimension: 56),
                        ),
                      ),
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
                                    asset.priceUsd,
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
              },
            );
          }
        },
      ),
    );
  }
}
