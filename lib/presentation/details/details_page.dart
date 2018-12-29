import 'package:flutter/material.dart';
import 'package:vehicle_search/common/injector.dart';
import 'package:vehicle_search/network/manufacturer_details_response.dart';
import 'package:vehicle_search/presentation/base/navigation_state.dart';
import 'package:vehicle_search/presentation/details/details_bloc.dart';
import 'package:vehicle_search/presentation/details/details_state.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.title, this.data}) : super(key: key) {
    if (data != null) print(data);
  }

  final String title;
  final Object data;

  @override
  State createState() => _DetailsState();
}

class _DetailsState extends NavigationState<DetailsPage, DetailsBloc> {
  final padding = const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0);

  @override
  void initState() {
    bloc = DetailsBloc(Injector.getApiManager(), widget.data);
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

  Row _createRow(String text) => Row(
        children: <Widget>[
          Padding(padding: padding, child: Text(text)),
        ],
      );

  Widget _buildItem(ManufacturerDetails manufacturer) {
    return Padding(
      key: PageStorageKey(manufacturer.mfrID),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(manufacturer.country ?? 'Unknown country',
            style: TextStyle(fontSize: 24.0)),
        children: <Widget>[
          _createRow('Manufacturer city: ${manufacturer.city}'),
          _createRow('Manufacturer address: ${manufacturer.address ?? "-"} '),
          _createRow('Manufacturer email: ${manufacturer.contactEmail ?? "-"}'),
          _createRow(
              'Manufacturer phone: ${manufacturer.contactPhone ?? "-"} '),
        ],
      ),
    );
  }
}
