import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  double _inputNGN = 0;
  double _converted = 0;
  String _target = 'USD';
  
  final Map<String, double> _toRates = {
    'USD': 0.00067, 
    'EUR': 0.00062,
    'GBP': 0.00053,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Naira Converter')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount in NGN', 
                prefixText: '₦ ',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) => _inputNGN = double.tryParse(val) ?? 0,
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: _target,
              items: _toRates.keys.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (val) => setState(() => _target = val!),
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Convert To'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              onPressed: () => setState(() => _converted = _inputNGN * _toRates[_target]!), 
              child: const Text('Convert NGN'),
            ),
            const SizedBox(height: 30),
            Text('${_converted.toStringAsFixed(4)} $_target', 
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal)),
          ],
        ),
      ),
    );
  }
}