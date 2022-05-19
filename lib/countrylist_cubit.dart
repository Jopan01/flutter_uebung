import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test1/countrylist.dart';
import 'country.dart';
import 'countrylist.dart';

part 'countrylist_state.dart';

class CountrylistCubit extends Cubit<List<Country>> {
  CountrylistCubit()
      : super([
          Country("Moskau", "assets/moskau.jpg"),
          Country("London", "assets/bigben.jpg"),
          Country("Paris", "assets/Paris.jpg")
        ]);

  void removeCountry(String name) {
    var countrys = [...state];
    countrys.removeWhere((country) => country.name == name);
    emit(countrys);
  }

  void addCubitCountry() {
    var countrys = [...state];
    countrys.add(CountryList().addCountry());
    emit(countrys);
  }
}
