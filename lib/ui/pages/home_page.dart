import 'package:flutter/cupertino.dart';

import '/ui/widgets/assets_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return const CupertinoPageScaffold(
      child: AssetsList(),
    );
  }
}
