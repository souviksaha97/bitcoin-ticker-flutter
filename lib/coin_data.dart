import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String URL = 'https://rest.coinapi.io/v1/exchangerate/';
  String apiKey = 'apiKey=95F0EC5F-74CF-4EE3-BD9E-7864A34355B8';

  Future<double> returnExchangeRate(String crypto, String currency) async{
    var response = await http.get(URL + crypto + '/' + currency + '?' + apiKey);
    if (response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse['rate'];
    }
    else
      return 404.0;
  }

}
