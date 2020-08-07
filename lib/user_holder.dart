import 'models/user.dart';
import 'string_util.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);
    print(user.toString());

    if (!user.containsKey(user.login)) {
      users[user.login] = user;
    }
    else {
      throw Exception('A user with this name already exists')
    }
  }
}
