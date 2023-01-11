import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class allData extends StatefulWidget {
  const allData({Key? key}) : super(key: key);

  @override
  State<allData> createState() => _allDataState();
}

class _allDataState extends State<allData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Data'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Text("no value");
          }
          return ListView(
            children: snapshot.data!.documents.map((document){
              return Card(
                child: ListTile(
                  title: Text("Name: ${document['name']}"),
                  subtitle: Text("Email: ${document['email']}"),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
