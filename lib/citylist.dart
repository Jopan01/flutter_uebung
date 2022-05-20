import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'city.dart';
import 'country.dart';

class CityList extends StatefulWidget {
  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  List<City> _citys = [
    City("Moskau", "assets/moskau.jpg"),
    City("London", "assets/bigben.jpg"),
    City("Paris", "assets/Paris.jpg")
  ];

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Container(
              alignment: Alignment.center,
              child: ListView(children: _buildItems()))),
      Container(
          height: 50,
          child: TextField(
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
              suffixIcon: IconButton(
                onPressed: addCity,
                icon: Icon(Icons.add),
              ),
            ),
            obscureText: false,
          ))
    ]);
  }

  List<Widget> _buildItems() {
    return [
      for (City city in _citys)
        ListTile(
          title: Text(city.name),
          leading: CircleAvatar(backgroundImage: AssetImage(city.image)),
          onLongPress: () => removeCity(city.name),
        )
    ];
  }

  removeCity(String name) {
    setState(() {
      _citys.removeWhere((city) => city.name == name);
    });
  }

  addCity() {
    setState(() {
      _citys.add(City(myController.text, "assets/placeholder.png"));
    });
    myController.clear();
  }
}
