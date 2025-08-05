import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/painting.dart';

const String kBaseUrl = 'https://rest.coincap.io/v3/';

const String kApiKey = String.fromEnvironment('API_KEY');

const CurrencyFormat kCurrencyFormat = CurrencyFormat(
  code: 'usd',
  symbol: r'$',
  symbolSeparator: '',
);

const double kAssetColorOpacity = .1;
const BorderRadius kAssetIconBorderRadius = BorderRadius.all(
  Radius.circular(18),
);
const double kAssetIconSize = 56;
