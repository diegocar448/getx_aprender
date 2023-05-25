import 'package:get/get.dart';
import 'package:getxintro/user_model.dart';

class UserController extends GetxController {
  //Objeto Observavel
  Rx<UserModel> user = UserModel().obs;

  // Aqui setamos a nossa propriedade nome
  void setUserName(String userName) {
    /* user.update((obj) {
      obj?.name = userName;
    }); */
    user.value.name = userName;
    user.refresh();
  }

  // Aqui setamos a nossa propriedade age no formato int
  void setUserAge(int userAge) {
    /* user.update((obj) {
      obj?.age = userAge;
    }); */
    user.value.age = userAge;
    user.refresh();
  }
}
