import 'package:flutter/material.dart';
import 'package:konversi_suhu_map_flutter/widget/dropdown_conversion.dart';
import 'package:konversi_suhu_map_flutter/widget/result.dart';
import 'package:konversi_suhu_map_flutter/widget/conversion_history.dart';
import 'package:konversi_suhu_map_flutter/widget/user_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listViewItem = [];
  var listItem = ['Kelvin', 'Reamur', "Fahrenheit", "Celcius"];

  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _inputUser = 0;
  double _result = 0;

  onDropdownChange(newValue) {
    setState(() {
      _newValue = newValue;
      perhitunganSuhu();
    });
  }

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listViewItem.add('Kelvin : $_result');
      } else if (_newValue == "Reamur") {
        _result = (4 / 5) * _inputUser;
        listViewItem.add('Reamur : $_result');
      } else if (_newValue == "Fahrenheit") {
        _result = (9 / 5) * _inputUser + 32;
        listViewItem.add('Fahrenheit : $_result');
      } else {
        _result = _inputUser;
        listViewItem.add('Celcius : $_result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text('Siti Nurhalisa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text('2031710078',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          UserInput(inputController: inputController),
          const SizedBox(
            height: 10,
          ),
          DropdownConversion(
            listItem: listItem,
            newValue: _newValue,
            onDropdownChange: onDropdownChange,
          ),
          Result(result: _result),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          const Center(
            child: Text(
              'Riwayat Konversi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //Riwayat Konversi dengan ListView
          Expanded(
            child: ConversionHistory(listViewItem: listViewItem),
          ),
        ],
      ),
    );
  }
}
