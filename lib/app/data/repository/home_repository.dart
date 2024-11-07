import 'package:retotok/app/data/model/challenge.dart';
import 'package:retotok/app/data/provider/home_provider.dart';

HomeProvider homeProvider = HomeProvider();

class HomeRepository {
  Future<Map<String, dynamic>> getDataUser(int idUser) async {
    final response = await homeProvider.getDataUser(idUser);
    Map<String, dynamic> body = response.body;
    return body;
  }

  Future<List<ActiveChallenges>> getChallengesList() async {
    final response = await homeProvider.getChallengesList();
    final List<dynamic> body = response.body;
    // Mapear cada elemento de la lista a una instancia de ActiveChallenges
    List<ActiveChallenges> listChallenges =
        body.map((dynamic item) => ActiveChallenges.fromJson(item)).toList();
    return listChallenges;
  }
}
