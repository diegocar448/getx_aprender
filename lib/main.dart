import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxintro/user_controller.dart';

void main() {
  // Aqui adicionamos a nossa injeção de dependecias no dispositivo
  // evitando ter que ficar passando sempre pelo construtor
  //Get.put<UserController>(UserController());

  //Aqui so vai injetar na memoria quando for solicitado
  Get.lazyPut<UserController>(() => UserController());
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

  // Aqui ele busca o userController injetado em outra classe anterior
  final UserController userController = Get.find();

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
            // Obx(() => Text(
            //       'Nome: ${userController.user.value.name}',
            //       style: commonStyle(),
            //     )),

            // // Apresentação Idade
            // Obx(() => Text(
            //       'Idade: ${userController.user.value.age}',
            //       style: commonStyle(),
            //     )),

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
                    decoration: const InputDecoration(labelText: 'Nome'),
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
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo Idade
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(labelText: 'Idade'),
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

            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DataScreen();
                }));
              },
              child: const Text('Tela de dados'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataScreen extends StatelessWidget {
  //const DataScreen({super.key});

  DataScreen({
    Key? key,
  }) : super(key: key);
  TextStyle commonStyle() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  final UserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => Text(
                  'Nome: ${controller.user.value.name}',
                  style: commonStyle(),
                )),
            Obx(() => Text(
                  'Idade: ${controller.user.value.age}',
                  style: commonStyle(),
                )),
          ],
        ),
      ),
    );
  }
}
