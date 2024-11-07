import 'package:retotok/app/data/provider/login_provider.dart';

LoginProvider loginProvider = LoginProvider();

class LoginRepository {
  Future<int> registerUser(
      String uid, String password, String email, String fullname) async {
    final response =
        await loginProvider.registerUser(uid, password, email, fullname);
    print(response.body["id"]);
    print("--");
    int idUser = response.body["id"];
    return idUser;
  }
}
