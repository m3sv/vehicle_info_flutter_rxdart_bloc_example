import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_search/common/navigation_utils.dart';
import 'package:vehicle_search/network/vehicle_response.dart';
import 'package:vehicle_search/presentation/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, @required this.apiManager})
      : super(key: key);

  final apiManager;
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final padding = const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0);

  StreamSubscription<Screen> navigation;

  HomeBloc bloc;

  @override
  void initState() {
    print('Init home state');
    super.initState();
    bloc = HomeBloc(widget.apiManager);
    navigation = bloc.navigation
        .listen((screen) => NavigationUtils.navigateTo(context, screen));
  }

  @override
  void dispose() {
    print('Disposing');
    navigation?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<VehicleManufacturer>>(
          stream: bloc.vehicleManufacturers,
          initialData: UnmodifiableListView<VehicleManufacturer>([]),
          builder: (context, snapshot) => ListView(
                children: snapshot.data.map(_buildItem).toList(),
              )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _getPlaceHolder() {

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
                  padding: padding,
                  child: Text('Manufacturer id: ${manufacturer.id}')),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                  child: Padding(
                      padding: padding,
                      child: Text(
                          'Manufacturer full name: ${manufacturer.fullName}')))
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: padding,
                  child: Text('Manufacturer country: ${manufacturer.country}')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('additional info'),
                onPressed: () {
                  bloc.navigateTo(Screen.DETAILS);
                },
                textColor: Theme.of(context).primaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
