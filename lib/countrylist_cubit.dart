import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test1/countrylist.dart';
import 'country.dart';
import 'countrylist.dart';
import 'addfield.dart';

part 'countrylist_state.dart';

class CountrylistCubit extends Cubit<List<Country>> {
  CountrylistCubit()
      : super([
          Country("Russland", "assets/Russland.jpg"),
          Country("England", "assets/union-jack.png"),
          Country("Frankreich", "assets/Frankreich.png")
        ]);

  void removeCountry(String name) {
    var countrys = [...state];
    countrys.removeWhere((country) => country.name == name);
    emit(countrys);
  }

  addCubitCountry() {
    var countrys = [...state];
    countrys.add(Country(country1.name, "assets/placeholder.png"));
    emit(countrys);
  }
}
