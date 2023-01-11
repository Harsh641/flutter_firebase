import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/allData.dart';
import 'package:flutter_firebase/login_form.dart';
import 'package:flutter_firebase/models/restraurantData.dart';
import 'package:flutter_firebase/repository/restraurant_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'controllers/res_controller.dart';
import 'view/restraurantView.dart';
import 'firebase_options.dart';

void main() async {
  runApp(myApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetData(),
    );
  }
}


class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends StateMVC<GetData> {

  RestraurantController? _restraurantController;

  _GetDataState() : super(RestraurantController()){
    _restraurantController = controller as RestraurantController;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restraurant View'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _restraurantController?.getData();
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => res_view()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Get Data'),
                  )
                )
            ),
          ],
        ),
      ),
    );
  }
}

//
// class AddData extends StatelessWidget {
//   // const AddData({Key? key}) : super(key: key);
//
//   TextEditingController name = new TextEditingController();
//   TextEditingController email = new TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Data"),
//         backgroundColor: Colors.amber,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(40.0),
//         child: Center(
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: name,
//                 decoration: InputDecoration(
//                   hintText: "Enter name"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               TextFormField(
//                 controller: email,
//                 decoration: InputDecoration(
//                   hintText: "Enter email"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               ElevatedButton(
//                   onPressed: (){
//                     if(name.text.isEmpty && email.text.isEmpty){
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text("Please Enter the credentials!!!")));
//                     }
//                     else{
//                       Map<String, dynamic> data = {"name": name.text, "email":email.text};
//                       Firestore.instance.collection("data").add(data);
//                     }
//
//                   },
//                   child: Text("Submit"),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => allData()));
//                   },
//                   child: Text("get data")
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => login()));
//                   },
//                   child: Text("Login")
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
