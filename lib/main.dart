import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversion Euro en DH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConversionPage(),
    );
  }
}

class ConversionPage extends StatefulWidget {
  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  final TextEditingController _controller = TextEditingController();
  final double _tauxDeChange = 10.65; // Exemple de taux de change Euro -> DH
  String _result = "";
  List<String> _historique = [];

  void _convertir() {
    setState(() {
      double montantEuro = double.tryParse(_controller.text) ?? 0;
      double montantDH = montantEuro * _tauxDeChange;
      _result = montantDH.toStringAsFixed(2);
      _historique.add("€${montantEuro.toStringAsFixed(2)} = ${montantDH.toStringAsFixed(2)} DH");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversion Euro en DH'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Montant en Euro',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertir,
              child: Text('Convertir'),
            ),
            SizedBox(height: 16),
            Text(
              'Montant en DH : $_result',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _historique.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_historique[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}