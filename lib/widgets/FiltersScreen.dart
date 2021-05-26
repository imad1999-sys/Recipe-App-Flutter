import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/DrawerSection.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  Function saveFilters;
  Map<String, bool> currentFilters;

  FilterScreen(Map<String, bool> currentFilters, Function saveFilters) {
    this.currentFilters = currentFilters;
    this.saveFilters = saveFilters;
  }

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

Widget _buildSwitchTile(
    String title, String subTitle, bool currValue, Function handler) {
  return SwitchListTile(
    value: currValue,
    onChanged: handler,
    title: Text(title),
    subtitle: Text(subTitle),
  );
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;
  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isVegan = widget.currentFilters['lactose'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _isLactoseFree = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filters'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ]),
        drawer: DrawerSection(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchTile(
                    'GlutenFree', "Meals not include gluten", _isGlutenFree,
                    (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                _buildSwitchTile('Vegan', "Meals include vegan", _isVegan,
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Vegetarian', "Meals include vegetables", _isVegetarian,
                    (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
                _buildSwitchTile(
                    'LactoseFree', "Meals not include lactose", _isLactoseFree,
                    (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
