//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   Define the following method to handle REST call about the User data
//    to the REST service.
//       a. getUserByLoginAndPassword: to get a user data, given his/her login and password.
//          If no match, this method returns null.
//          This method will be used for constructing the logic of the authentication process in the LoginScreen
//-----------------------------------------------------------------------------------------------------------------------------

import 'rest.dart';
import '../models/user.dart';

class UserService {
  static Future<User> getUserByLoginAndPassword(
      {String login, String password}) async {
    final List<dynamic> usersJson = await Rest.get('users');
    // json is not dynamic. the api data is- it's a list of dynamic data.
    List<User> users = usersJson.map((json) => User.fromJson(json)).toList();
    return users.firstWhere(
        (elem) => elem.login == login && elem.password == password,
        orElse: () => null);
  }
}
