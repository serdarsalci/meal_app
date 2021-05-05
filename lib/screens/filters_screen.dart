import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  svFilters() {
    widget.saveFilters({
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian
    });
  }

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget _buildSwitchListTile(
    String titleText,
    String subTitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(titleText),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                print(selectedFilters);
                widget.saveFilters(selectedFilters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                'Gluten Free',
                'Show only Gluten-free',
                _glutenFree,
                (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                  svFilters();
                },
              ),
              _buildSwitchListTile(
                'Lactose Free',
                'Show only Lactose-free',
                _lactoseFree,
                (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                  svFilters();
                },
              ),
              _buildSwitchListTile(
                'Vegeterian Food',
                'Show only vegeterian',
                _vegetarian,
                (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                  svFilters();
                },
              ),
              _buildSwitchListTile(
                'Vegan Food',
                'Show only Vegan',
                _vegan,
                (value) {
                  setState(() {
                    _vegan = value;
                  });
                  svFilters();
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
