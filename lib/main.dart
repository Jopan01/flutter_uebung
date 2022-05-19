import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/citylist.dart';
import 'package:test1/countrylist_cubit.dart';
import 'countrylist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PageViewC());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Städtetrip'),
          centerTitle: true,
        ),
        body: CityList());
  }
}

class CountryHome extends StatelessWidget {
  const CountryHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ländertrip'),
          centerTitle: true,
        ),
        body: BlocProvider(
            create: (context) => CountrylistCubit(), child: CountryList()));
  }
}

class PageViewC extends StatefulWidget {
  const PageViewC({Key? key}) : super(key: key);

  @override
  State<PageViewC> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewC> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(controller: _controller, children: const [
      Home(),
      CountryHome(),
    ]);
  }
}
