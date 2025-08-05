import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/assets/assets_bloc.dart';
import '/ui/widgets/asset_item_view.dart';
import '/utils/result.dart';

class AssetsList extends StatelessWidget {
  const AssetsList({super.key});

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
        itemBuilder: (final context, final index) => AssetItemView(index),
      ),
    };
  }
}
