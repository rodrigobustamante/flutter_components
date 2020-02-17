import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    this.options = options;
  }

  Future<List<dynamic>> loadData() async{
    final data = await rootBundle.loadString('assets/data/menu_opts.json');
    Map dataToMap = json.decode(data);

    options = dataToMap['routes'];

    return options;
  }
}

final menuProvider = new _MenuProvider();