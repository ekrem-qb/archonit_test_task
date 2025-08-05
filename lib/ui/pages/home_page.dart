import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/assets/assets_bloc.dart';
import '/ui/widgets/assets_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return CupertinoPageScaffold(
      child: BlocProvider(
        create: (final context) =>
            AssetsBloc(apiClient: context.read())
              ..add(const AssetsEventLoadRequested()),
        child: const AssetsList(),
      ),
    );
  }
}
