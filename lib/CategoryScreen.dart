import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/CategoryItem.dart';
import "./dummy/dummy.dart";

class CateogriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES
          .map((categoryData) => CategoryItem(
              categoryData.id, categoryData.title, categoryData.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
    );
  }
}
