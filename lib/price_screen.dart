import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  String selectedCrypto = "BTC";

  double currencyRate = 1.00;
  double cryptoRate = 1.00;

  CoinData coinData = new CoinData();

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async{
    var tempRate = await coinData.returnExchangeRate(selectedCrypto, selectedCurrency);
    setState(() {
      cryptoRate = tempRate;
    });
  }

  DropdownButton<String> dropdownCurrency() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      dropdownItems.add(
        DropdownMenuItem(
            child: Text(currenciesList[i]), value: currenciesList[i]),
      );
    }
    return DropdownButton<String>(
      items: dropdownItems,
      value: selectedCurrency,
      onChanged: (value) {
          selectedCurrency = value;
          updateUI();
      },
    );
  }

  DropdownButton<String> dropdownCrypto() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < cryptoList.length; i++) {
      dropdownItems.add(
        DropdownMenuItem(child: Text(cryptoList[i]), value: cryptoList[i]),
      );
    }
    return DropdownButton<String>(
      items: dropdownItems,
      value: selectedCrypto,
      onChanged: (value) {
          selectedCrypto = value;
          updateUI();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Coin Ticker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff3D3751), Color(0xff183554)])),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(currencyRate.toStringAsFixed(2)),
                dropdownCrypto(),
                Text(cryptoRate.toStringAsFixed(2)),
                dropdownCurrency(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
