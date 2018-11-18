import 'package:flutter/material.dart';

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

class _DetailsState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Text("empty"),
      ),
    );
  }
}
