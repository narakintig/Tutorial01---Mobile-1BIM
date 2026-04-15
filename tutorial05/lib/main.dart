import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //AppBar
        appBar: AppBar(title: Text("Quizz"), backgroundColor: Colors.green,),
        
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),

          child: Column(
            children: [
              DropdownMenu<String>(
                initialSelection: 'Pix',
                label: const Text('Forma de Pagamento'),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 'Pix', label: 'Pix'),
                  DropdownMenuEntry(value: 'Boleto', label: 'Boleto Bancário'),
                  DropdownMenuEntry(value: 'Cartao', label: 'Cartão de Crédito'),
                ],
                onSelected: (String? novoValor) {
                  print('Selecionado: $novoValor');
                  opcaoPagamento = novoValor;
                },
              ),

              ElevatedButton(
                onPressed: () {

                  print("Valor selecionado: ${opcaoPagamento}");

                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 100),
                ),
                child: Text('Go!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}