import 'package:get/get.dart';

const baseUrl = 'http://10.0.2.2:8000';

class LoginProvider extends GetConnect {
  Future<Response> registerUser(
      String uid, String password, String email, String fullname) async {
    // Payload para enviar en la solicitud POST

    Map<String, dynamic> payload = {
      "uid": uid,
      "password": password,
      "email": email,
      "fullname": fullname
    };

    try {
      final raw = await post("$baseUrl/api/users/", payload)
          .timeout(const Duration(milliseconds: 8000));

      return raw;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
