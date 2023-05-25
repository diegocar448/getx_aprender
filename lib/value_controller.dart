import 'package:get/get.dart';

class ValueController extends GetxController {
  String definedValue = '';

  bool isLoading = false;

  void setValue(String value) async {
    isLoading = true;
    update();

    await Future.delayed(const Duration(seconds: 2));
    definedValue = value;
    isLoading = false;

    /** Vai atualizar o valor da nossa definedValue que será 
     * refletido no nosso GetBuilder 
    */
    update();
  }
}
