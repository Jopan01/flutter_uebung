import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/countrylist_cubit.dart';
import 'addfield.dart';
import 'country.dart';

class CountryList extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: BlocBuilder<CountrylistCubit, List<Country>>(
          builder: (context, state) {
        return Container(
            alignment: Alignment.center,
            child: ListView(children: [
              for (Country country in state)
                ListTile(
                    title: Text(country.name),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(country.image)),
                    onLongPress: () =>
                        BlocProvider.of<CountrylistCubit>(context)
                            .removeCountry(country.name))
            ]));
      })),
      AddField()
    ]);
  }
}
