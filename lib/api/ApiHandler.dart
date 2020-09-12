import 'package:hodom_task/api/HttpClient.dart';
import 'package:hodom_task/models/CategoriesModel.dart';

class ApiHandler {
  Future<List<Result>> fetchCategories() async {
    var response = await HttpClient().getAllCategories();
    return List.from(response.map((jsonObject) => Result.fromJson(jsonObject)));
  }
}
