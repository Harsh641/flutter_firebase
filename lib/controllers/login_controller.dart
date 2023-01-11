import 'package:mvc_pattern/mvc_pattern.dart';
import '../models/userData.dart';
import '../repository/repository.dart';

class LoginController extends ControllerMVC{

    Future<users> login(String email, String password,) async{
      return await login_user(email, password, context);
    }
}