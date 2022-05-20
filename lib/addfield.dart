import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/countrylist_cubit.dart';
import 'country.dart';

class AddField extends StatefulWidget {
  @override
  State<AddField> createState() => _AddFieldState();
}

Country country1 = new Country("Hallo", "assets/placeholder.png");

class _AddFieldState extends State<AddField> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    addCountry();
    return Container(
        height: 50,
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Name',
            suffixIcon: IconButton(
              onPressed: () {
                context.read<CountrylistCubit>().addCubitCountry();
                myController.clear();
              },
              icon: Icon(Icons.add),
            ),
          ),
          obscureText: false,
        ));
  }

  void addCountry() {
    myController.addListener(() {
      country1.name = myController.text;
    });
  }
}
