import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/allData.dart';
import 'package:flutter_firebase/controllers/res_controller.dart';
import 'package:flutter_firebase/main.dart';
import 'package:flutter_firebase/models/restraurantData.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../repository/restraurant_repo.dart';

class res_view extends StatefulWidget {
  const res_view({Key? key}) : super(key: key);

  @override
  _res_viewState createState() => _res_viewState();
}

class _res_viewState extends StateMVC<res_view> {

  RestraurantController? _con;

  _res_viewState() : super(RestraurantController()){
    _con = controller as RestraurantController;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              SizedBox(height: 10),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: _con!.orders.length,
                itemBuilder: (context, index) {
                  return Theme(data: theme,
                    child: ExpansionTile(initiallyExpanded: true,
                            title: Row(children: <Widget>[
                                Text('Answer: ${_con?.orders.elementAt(index).name}',
                                style: TextStyle(color: Colors.cyanAccent),)
                              ],
                            ),
                          ),
                        );
                    }
                  ),
                ]
              ),
            ),
          );
  }
}


