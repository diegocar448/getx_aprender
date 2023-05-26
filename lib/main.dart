import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // Aqui adicionamos a nossa injeção de dependecias no dispositivo
  // evitando ter que ficar passando sempre pelo construtor
  //Get.put<UserController>(UserController());

  //Aqui so vai injetar na memoria quando for solicitado
  //Get.lazyPut<UserController>(() => UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // HomePage({super.key});
  const HomePage({Key? key}) : super(key: key);

  // Aqui ele busca o userController injetado em outra classe anterior
  //final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegação'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'Valor:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Botao para navegacao
            ElevatedButton(
              onPressed: () async {
                /* -------------------------------------------*/
                // final result = await Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return DataScreen();
                //     },
                //   ),
                // );

                // redirecionar usando o getX
                final result = await Get.to(() => DataScreen());

                // Navigator.of(context).pushNamed('/signin');
                // Get.toNamed('/signin');
                // print(result);
                /* -------------------------------------------*/
              },
              child: const Text('Segunda tela'),
            ),
          ],
        ),
      ),
    );
  }
}

//class DataScreen extends GetView<UserController> {
class DataScreen extends StatelessWidget {
  //const DataScreen({super.key});

  DataScreen({
    Key? key,
  }) : super(key: key);
  // TextStyle commonStyle() => const TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w700,
  //   );

  // @override
  // final UserController controller = Get.find();

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Definicao de dado'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de definicao de valor
            TextField(
              controller: textController,
            ),
            // Espacamento
            const SizedBox(
              height: 10,
            ),

            // Botao para voltar passando o valor
            ElevatedButton(
              onPressed: () {
                final value = textController.text;
                //Navigator.of(context).pop(value);
                Get.back(result: value);
              },
              child: const Text('Retornar'),
            )
          ],
        ),
      ),
    );
  }
}
