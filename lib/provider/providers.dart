import 'package:flutter/cupertino.dart';
import 'package:hodom_task/models/CategoriesModel.dart';
import 'package:hodom_task/repository/repositories.dart';

class CategoryProvider with ChangeNotifier {
  List<Result> categories = <Result>[];
  CategoryProvider() {
    getAllCategories();
  }
  void getAllCategories() async {
    categories = await CategoryRepository().getAllCategories();
    notifyListeners();
  }
}
