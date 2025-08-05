import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/api/client.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final dio = Dio();

  @override
  void dispose() {
    dio.close();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return RepositoryProvider(
      create: (final context) => ApiClient(dio),
      child: const CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: HomePage(),
      ),
    );
  }
}
