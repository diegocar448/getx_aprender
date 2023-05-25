import 'package:get/get.dart';

class ValueController extends GetxController {
  /// Aqui temos uma variavel observavel
  RxString definedValue = ''.obs;

  RxBool isLoading = false.obs;

  Future<void> setValue(String newValue) async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));
    definedValue.value = newValue;
    isLoading.value = false;

    /** Vai atualizar o valor da nossa definedValue que será 
     * refletido no nosso GetBuilder 
    */
    //update();
  }
}
