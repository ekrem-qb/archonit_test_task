import 'package:currency_formatter/currency_formatter.dart';

const String kApiKey = String.fromEnvironment('API_KEY');

const CurrencyFormat kCurrencyFormat = CurrencyFormat(
  code: 'usd',
  symbol: r'$',
  symbolSeparator: '',
);
