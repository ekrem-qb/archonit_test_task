import 'package:currency_formatter/currency_formatter.dart';

const String kBaseUrl = 'https://rest.coincap.io/v3/';

const String kApiKey = String.fromEnvironment('API_KEY');

const CurrencyFormat kCurrencyFormat = CurrencyFormat(
  code: 'usd',
  symbol: r'$',
  symbolSeparator: '',
);

const double kAssetColorOpacity = .1;
