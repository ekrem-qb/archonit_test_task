import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MainApp());
}

const items = [
  ('BTC', r'$29,850.15', Color(0xFFF6543E)),
  ('ETH', r'$10,561.24', Color(0xFF6374C3)),
  ('LTC', r'$3,676.76', Color(0xFF30E0A1)),
  ('XRP', r'$5,241.62', Color(0xFF638FFE)),
  ('XRP', r'$5,241.62', Color(0xFF638FFE)),
  ('XRP', r'$5,241.62', Color(0xFF638FFE)),
  ('XRP', r'$5,241.62', Color(0xFF638FFE)),
  ('XRP', r'$5,241.62', Color(0xFF638FFE)),
  ('XRP', r'$5,241.62', Color(0xFF638FFE)),
];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoPageScaffold(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];
            return Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Opacity(
                    opacity: 0.1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: item.$3,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(item.$1), Text(item.$2)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
