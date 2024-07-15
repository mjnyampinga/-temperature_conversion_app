import 'package:flutter/material.dart';
import '../../widgets/temperature_converter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: TemperatureConverter(),
    );
  }
}
