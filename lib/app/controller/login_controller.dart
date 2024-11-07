import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:retotok/app/data/repository/login_repository.dart';
import 'package:retotok/app/routes/pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GetStorage _storage = GetStorage();
  Rx<User?> user = Rx<User?>(null);

  LoginRepository loginRepository = LoginRepository();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        user.value = userCredential.user;

        // Guardar en GetStorage (opcional)
        _storage.write('uid', userCredential.user?.uid);
        _storage.write('email', userCredential.user?.email);
        _storage.write('name', userCredential.user?.displayName);
        _storage.write('image', userCredential.user?.photoURL);
        _storage.write('isLogged', true);
        int idUser = await loginRepository.registerUser(
            userCredential.user!.uid.toString(),
            userCredential.user!.uid.toString(),
            userCredential.user!.email.toString(),
            userCredential.user!.displayName.toString());
        _storage.write('isUser', idUser);

        Get.offAndToNamed(Routes.HOME);
        Get.snackbar(
            'Login Successful', 'Welcome ${userCredential.user?.email}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in with Google: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();

      await _storage.remove('uid');
      await _storage.remove('email');
      await _storage.remove('name');
      await _storage.remove('image');
      await _storage.remove('isLogged');

      user.value = null;
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar('Logout', 'You have logged out successfully');
    } catch (e) {
      Get.snackbar('Error', 'Fallo cierre de sesión: $e');
    }
  }
}
