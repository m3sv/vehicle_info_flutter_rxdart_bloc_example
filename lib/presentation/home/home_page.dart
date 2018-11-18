import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_search/network/vehicle_manufacter.dart';
import 'package:vehicle_search/presentation/home/home_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, @required this.bloc}) : super(key: key);

  final HomeBloc bloc;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<VehicleManufacturer>>(
          stream: widget.bloc.vehicleManufacturers,
          initialData: UnmodifiableListView<VehicleManufacturer>([]),
          builder: (context, snapshot) => ListView(
                children: snapshot.data.map(_buildItem).toList(),
              )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildItem(VehicleManufacturer manufacturer) {
    return Padding(
      key: PageStorageKey(manufacturer.id),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
            manufacturer.commonName ?? manufacturer.fullName ?? '[no name]',
            style: TextStyle(fontSize: 24.0)),
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  child: Text('Manufacturer id: ${manufacturer.id}')),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      child:
                      Text('Manufacturer full name: ${manufacturer.fullName}'))
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  child: Text('Manufacturer country: ${manufacturer.country}')),
            ],
          ),
        ],
      ),
    );
  }
}
