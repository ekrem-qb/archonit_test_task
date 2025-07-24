import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '/api/client.dart';
import '/ui/home_page.dart';

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
    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: Provider(
        create: (final context) => ApiClient(dio),
        child: const HomePage(),
      ),
    );
  }
}
