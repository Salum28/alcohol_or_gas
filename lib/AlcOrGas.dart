import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlcOrGas extends StatefulWidget {
  const AlcOrGas({super.key});

  @override
  State<AlcOrGas> createState() => _AlcOrGasState();
}

class _AlcOrGasState extends State<AlcOrGas> {
  // Atributos
  final TextEditingController _alcoholController = TextEditingController();
  final TextEditingController _gasController = TextEditingController();
  String _resultText = '';

  // Métodos
  void _calculate() {
    double? alcoholValue = double.tryParse(_alcoholController.text);
    double? gasValue = double.tryParse(_gasController.text);

    if (alcoholValue == null || gasValue == null) {
      Fluttertoast.showToast(
        msg: 'Valore deve ser maior que 0 e deve-se utilizar o .',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 18
      );

    } else {
      if(alcoholValue / gasValue >= 0.7) {
        setState(() {
          _resultText = 'É recomendável abastecer com Álcool';
        });
      } else {
        setState(() {
          _resultText = 'É recomendável abastecer com Gasolina';
        });
      }
      _clearFields();
    }
  }
  void _clearFields() {
    _alcoholController.text = '';
    _gasController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Álcool ou Gasolina'),
        backgroundColor: Colors.blueAccent,
      ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset('images/logo.png', height: 100)
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Saiba qual a melhor opção para abastecimento do seu carro',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Preço do Álcool, EX: 1.59'
            ),
            style: const TextStyle(
                fontSize: 22
            ),
            controller: _alcoholController,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Preço da Gasolina, EX: 2.63'
            ),
            style: const TextStyle(
                fontSize: 22
            ),
            controller: _gasController,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: FilledButton(
                  onPressed: () => _calculate(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.blueAccent),
                    textStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    )),
                  ),
                  child: const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text('Calcular')
                  )
              )
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _resultText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              )
          )
        ],
      ),
    )
    );
  }
}
