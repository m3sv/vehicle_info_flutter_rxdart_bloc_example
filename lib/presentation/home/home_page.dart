import 'package:flutter/material.dart';
import 'package:vehicle_search/common/navigation_utils.dart';
import 'package:vehicle_search/network/vehicle_response.dart';
import 'package:vehicle_search/presentation/base/navigation_state.dart';
import 'package:vehicle_search/presentation/home/home_bloc.dart';
import 'package:vehicle_search/presentation/home/home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, @required this.apiManager, this.data})
      : super(key: key) {
    if (data != null) print(data);
  }

  final apiManager;
  final String title;
  final Object data;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends NavigationState<HomePage, HomeBloc> {
  final padding = const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0);

  @override
  void initState() {
    bloc = HomeBloc(widget.apiManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<HomeState>(
          stream: bloc.state,
          initialData: HomeEmpty(),
          builder: (context, snapshot) {
            if (snapshot.data is HomePopulated)
              return ListView(
                children: (snapshot.data as HomePopulated)
                    .result
                    .map(_buildItem)
                    .toList(),
              );

            if (snapshot.data is HomeEmpty) {
              return GestureDetector(
                child: Center(child: Text("Empty")),
                onTap: bloc.reload,
              );
            }

            return Center(child: CircularProgressIndicator());
          }), // This trailing comma makes auto-formatting nicer for build methods.
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
                  bloc.navigateTo(Details(
                      data: manufacturer.commonName ?? manufacturer.fullName));
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
