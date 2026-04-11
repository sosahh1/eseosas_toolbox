import 'package:flutter/material.dart';

class MultiConverterPage extends StatefulWidget {
  const MultiConverterPage({super.key});

  @override
  State<MultiConverterPage> createState() => _MultiConverterPageState();
}

class _MultiConverterPageState extends State<MultiConverterPage> {
  double _input = 0;
  String _type = 'Kg to Lbs';
  double _result = 0;

  void _calculate() {
    setState(() {
      if (_type == 'Kg to Lbs') {
        _result = _input * 2.20462;
      } else if (_type == 'Celsius to Fahrenheit') {
        _result = (_input * 9 / 5) + 32;
      } else {
        _result = _input * 3.28084; // Meters to Feet
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unit Converter')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _type,
              items: ['Kg to Lbs', 'Celsius to Fahrenheit', 'Meters to Feet']
                  .map((label) => DropdownMenuItem(value: label, child: Text(label)))
                  .toList(),
              onChanged: (val) => setState(() => _type = val!),
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Select Conversion'),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Enter value', border: const OutlineInputBorder()),
              keyboardType: TextInputType.number,
              onChanged: (val) => _input = double.tryParse(val) ?? 0,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              onPressed: _calculate, 
              child: const Text('Calculate')
            ),
            const SizedBox(height: 30),
            Text('Result: ${_result.toStringAsFixed(2)}', 
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal)),
          ],
        ),
      ),
    );
  }
}