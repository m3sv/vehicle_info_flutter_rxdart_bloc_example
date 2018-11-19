import 'package:flutter/material.dart';
import 'package:vehicle_search/network/manufacturer_details_response.dart';
import 'package:vehicle_search/presentation/base/navigation_state.dart';
import 'package:vehicle_search/presentation/details/details_bloc.dart';
import 'package:vehicle_search/presentation/details/details_state.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.title, @required this.apiManager, this.data})
      : super(key: key) {
    if (data != null) print(data);
  }

  final apiManager;
  final String title;
  final Object data;

  @override
  State createState() => _DetailsState();
}

class _DetailsState extends NavigationState<DetailsPage, DetailsBloc> {
  final padding = const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0);

  @override
  void initState() {
    bloc = DetailsBloc(widget.apiManager, widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
          stream: bloc.state,
          builder: (context, snapshot) {
            if (snapshot.data is DetailsPopulated)
              return ListView(
                children: (snapshot.data as DetailsPopulated)
                    .data
                    .map(_buildItem)
                    .toList(),
              );

            if (snapshot.data is DetailsEmpty) {
              return GestureDetector(
                child: Center(child: Text("Empty")),
                onTap: bloc.reload,
              );
            }

            if (snapshot.data is DetailsError) {
              return Center(
                child: Text("Error: ${(snapshot.data as DetailsError).e}"),
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _buildItem(ManufacturerDetails manufacturer) {
    return Padding(
      key: PageStorageKey(manufacturer.mfrID),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(manufacturer.country ?? 'Unknown country',
            style: TextStyle(fontSize: 24.0)),
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                  padding: padding,
                  child: Text('Manufacturer city: ${manufacturer.city}')),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                  child: Padding(
                      padding: padding,
                      child: Text(
                          'Manufacturer address: ${manufacturer.address ?? "-"} ')))
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: padding,
                  child: Text(
                      'Manufacturer email: ${manufacturer.contactEmail ?? "-"}')),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: padding,
                  child: Text(
                      'Manufacturer phone: ${manufacturer.contactPhone ?? "-"} ')),
            ],
          ),
        ],
      ),
    );
  }
}
