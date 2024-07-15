import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();
  bool _isFtoC = true;
  double? _convertedValue;
  final List<String> _history = [];

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

    double result;
    if (_isFtoC) {
      result = (input - 32) * 5 / 9;
      _history.add('F to C: $input => ${result.toStringAsFixed(2)}');
    } else {
      result = input * 9 / 5 + 32;
      _history.add('C to F: $input => ${result.toStringAsFixed(2)}');
    }

    setState(() {
      _convertedValue = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Fahrenheit-to-Celsius'),
              Radio<bool>(
                value: true,
                groupValue: _isFtoC,
                onChanged: (value) {
                  setState(() {
                    _isFtoC = value!;
                  });
                },
              ),
              Text('Celsius-to-Fahrenheit'),
              Radio<bool>(
                value: false,
                groupValue: _isFtoC,
                onChanged: (value) {
                  setState(() {
                    _isFtoC = value!;
                  });
                },
              ),
            ],
          ),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter temperature',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _convert,
            child: Text('Convert'),
          ),
          if (_convertedValue != null)
            Text(
              'Converted Value: ${_convertedValue!.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_history[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
