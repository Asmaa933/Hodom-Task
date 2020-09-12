import 'package:hodom_task/api/ApiHandler.dart';
import 'package:hodom_task/models/CategoriesModel.dart';

class CategoryRepository {
  Future<List<Result>> getAllCategories() async {
    List<Result> categories = await ApiHandler().fetchCategories();
    return categories;
  }
}
