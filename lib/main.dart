import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Valor
          Obx(
            () {
              return Text('Valor definido: ${valueController.definedValue}');
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
          Obx(
            () {
              return valueController.isLoading.value
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
