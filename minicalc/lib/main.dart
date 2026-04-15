import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //Controllers
  final TextEditingController _n1Controller = TextEditingController();
  final TextEditingController _n2Controller = TextEditingController();
  final TextEditingController _resultadoController = TextEditingController();
  @override
  void dispose() {
    //Limpa os controllers ao fechar a tela
    _n1Controller.dispose();
    _n2Controller.dispose();
    _resultadoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //AppBar
        appBar: AppBar(
          title: Text("Mini calculadora"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Campo de Valor A
              TextField(
                controller: _n1Controller,
                decoration: InputDecoration(
                  labelText: 'Informe o primeiro valor',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              //Espaçamento entre os campos
              SizedBox(height: 16),

              //Campo de Valor B
              TextField(
                controller: _n2Controller,
                decoration: InputDecoration(
                  labelText: 'Informe o segundo valor',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 16),
              //Row para colocar dois botões na mesma linha
              Row(
                children: [
                  //Botao de somar
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print(
                        "Valores informados: \n n1: ${_n1Controller.text} n2: ${_n2Controller.text}"
                        );
                        //Necessário tratar os números antes de operar a conta
                        //TODO, implementar soma
                        String n1tratado = _n1Controller.text.replaceAll(',','.');
                        String n2tratado = _n2Controller.text.replaceAll(',','.');
                        try {
                          double resultado =
                            double.parse(n1tratado) + double.parse(n2tratado);

                          print("Resultado: ${resultado}");

                          _resultadoController.text = resultado.toString();
                        } catch (e) {
                          _resultadoController.text = "Error!";
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text('Soma'),
                    ),
                  ),
                  SizedBox(width: 10),
                  //Botao de subtrair
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO, implementar subtracao
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text('Subtração'),
                    ),
                  ),
                ],
              ),
              //Campo entre os resultados
              TextField(
                controller: _resultadoController,
                decoration: InputDecoration(
                  labelText: 'Resultado',
                  prefixIcon: Icon(Icons.equalizer),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                enabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
