import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/restraurantData.dart';
import '../repository/restraurant_repo.dart';

class RestraurantController extends ControllerMVC{
  List<Restraurant> orders = <Restraurant>[];

  Future getData() async{
    Stream<Restraurant> stream = await get_res_data();
    stream.listen((Restraurant _order) {
      setState((){
        orders.add(_order);
      });
    });
  }
}