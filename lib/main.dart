import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getxintro/user_controller.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // HomePage({super.key});
  HomePage({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final userController = UserController();

  TextStyle commonStyle() => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Apresentação Nome
            Obx(() => Text(
                  'Nome: ${userController.user.value.name}',
                  style: commonStyle(),
                )),

            // Apresentação Idade
            Obx(() => Text(
                  'Idade: ${userController.user.value.age}',
                  style: commonStyle(),
                )),

            const Divider(
              thickness: 1.5,
              color: Colors.blue,
              height: 20,
            ),
            // Espaçamento
            const SizedBox(
              height: 10,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo Nome
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    userController.setUserName(nameController.text);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo Idade
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    userController.setUserAge(int.parse(ageController.text));
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            // Espaçamento
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
