import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:hodom_task/models/CategoriesModel.dart';
import 'package:hodom_task/provider/providers.dart';
import 'package:provider/provider.dart';

import '../WidgetsBuilder.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // prevent pop while swipe in iOS
      child: Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        body: SafeArea(
          child: ChangeNotifierProvider<CategoryProvider>(
            create: (_) => CategoryProvider(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                searchBarBuilder(),
                mainImageBuilder(),
                ContainerBuilder(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BuildBottomNavigationBar(),
      ),
    );
  }

  Widget searchBarBuilder() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          makeBoxShadow(),
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

  Widget mainImageBuilder() {
    return Container(
      height: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          makeBoxShadow(),
        ],
        image: DecorationImage(
          image: AssetImage('images/category_woman.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(0, 0, 0, 0.4),
        ),
        child: Container(
          margin: EdgeInsets.only(right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildText(23, 'تشكيلة جديدة من \n الملابس الصيفية', Colors.white,
                  textAlign: TextAlign.end),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildText(35, '25%', Colors.white, textAlign: TextAlign.end),
                  buildText(23, 'بخصم ', Colors.white,
                      textAlign: TextAlign.end),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
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
      margin: EdgeInsets.all(10),
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
              height: 110,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: category.image,
                  placeholder: (context, url) => CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ),
                  fit: BoxFit.fill,
                ),
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
}

class BuildBottomNavigationBar extends StatefulWidget {
  @override
  _BuildBottomNavigationBarState createState() =>
      _BuildBottomNavigationBarState();
}

class _BuildBottomNavigationBarState extends State<BuildBottomNavigationBar> {
  var selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBorderColor: Colors.transparent,
        selectedItemBackgroundColor: Colors.black,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.black,
        unselectedItemIconColor: Colors.black,
        unselectedItemLabelColor: Colors.black,
        showSelectedItemShadow: false,
      ),
      selectedIndex: selectedIndex,
      onSelectTab: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        FFNavigationBarItem(
          iconData: Icons.more_horiz,
          label: 'المزيد',
        ),
        FFNavigationBarItem(
          iconData: Icons.local_shipping,
          label: 'الطلبات',
        ),
        FFNavigationBarItem(
          iconData: Icons.shopping_basket,
          label: 'السلة',
        ),
        FFNavigationBarItem(
          iconData: Icons.home,
          label: 'الرئيسية',
        ),
      ],
    );
  }
}
