import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:getxintro/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // HomePage({super.key});
  HomePage({Key? key}) : super(key: key);

  final textController = TextEditingController();
  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    print('Criou Arvore');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Valor
          GetX<ValueController>(
            init: valueController,
            builder: (ctrl) {
              return Text('Valor definido: ${ctrl.definedValue}');
            },
          ),
          // Campo
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: TextField(
              controller: textController,
            ),
          ),
          // Botão
          GetX<ValueController>(
            init: valueController,
            builder: (ctrl) {
              return ctrl.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        String value = textController.text;

                        valueController.setValue(value);
                      },
                      child: const Text('Confirmar'),
                    );
            },
          )
        ],
      ),
    );
  }
}
