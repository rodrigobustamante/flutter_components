import 'package:flutter/material.dart';

import 'package:flutterio_components/src/providers/menu_provider.dart';
import 'package:flutterio_components/src/utils/icon_from_string_util.dart';

List<Widget> _createListItems(List<dynamic> data, BuildContext context) {
  final List<Widget> listItems = [];

  data.forEach((element) {
    final widget = ListTile(
      title: Text(element['text']),
      leading: getIcon(element['icon']),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.cyan,),
      onTap: () {
        Navigator.pushNamed(context, element['route']);
      },
    );

    listItems..add(widget)
             ..add(Divider());
  });

  return listItems;
}

Widget _createListView(context) {
  return FutureBuilder(
    future: menuProvider.loadData(),
    initialData: [],
    builder: ( BuildContext context, AsyncSnapshot snapshot) {

      return ListView(
        children: _createListItems(snapshot.data, context),
      );
    },
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.cyan,
      ),
      body: _createListView(context),
    );
  }
}