import 'package:flutter/material.dart';
import 'package:hodom_task/models/CategoriesModel.dart';
import 'package:hodom_task/provider/providers.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchBarBuilder(),
              ContainerBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget SearchBarBuilder() {
  return Container(
    margin: EdgeInsets.all(20),
    height: 55,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 300,
            child: TextField(
              textAlign: TextAlign.end,
              style: TextStyle(fontFamily: 'lalezar'),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'ما الذى تبحث عنه',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

class ContainerBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (_, CategoryProvider myProvider, child) {
      return Expanded(
        child: Column(
          children: <Widget>[
            Expanded(
              child: buildCategoriesListView(
                  Provider.of<CategoryProvider>(context, listen: false)
                      .categories,
                  context),
            ),
          ],
        ),
      );
    });
  }

  Widget buildCategoriesListView(
      List<Result> categories, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        primary: true,
        children: List.generate(
          categories.length,
          (index) {
            return getStructuredGridCell(categories[index], context);
          },
        ),
      ),
    );
  }
}

Card getStructuredGridCell(Result category, BuildContext context) {
  return Card(
    elevation: 1.5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(
                    '${category.image}',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              category.name,
              style: TextStyle(fontFamily: 'lalezar', fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
