import 'package:flutter/material.dart';
import 'package:flutter_dio/app/modules/home/home_bloc.dart';
import 'package:flutter_dio/app/modules/home/home_module.dart';
import 'package:flutter_dio/shared/models/pokemodel.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    // TODO: implement initState
    bloc.getPokemos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<PokeModel>>(
          stream: bloc.resposeOut,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.toString()));
            }
            if (snapshot.hasData) {
              return Column(
                  children: snapshot.data
                      .map((e) => ListTile(title: Text(e.name)))
                      .toList());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
