import 'package:archonit_test_task/api/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final apiClient = ApiClient(Dio());
  late final assetsFuture = apiClient.getAssets();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoPageScaffold(
        child: FutureBuilder(
          future: assetsFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (!snapshot.hasData) {
              return const Center(child: CupertinoActivityIndicator());
            } else {
              final assets = snapshot.data!;

              return ListView.builder(
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  var asset = assets[index];
                  return Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Opacity(
                          opacity: 0.1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: SizedBox.square(dimension: 56),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.41,
                                color: Color(0xFF17171A),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(asset.symbol),
                                  Text(asset.priceUsd),
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
      ),
    );
  }
}
