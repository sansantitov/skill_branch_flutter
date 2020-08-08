//import 'package:galleryapp/models/user.dart';

//import 'package:galleryapp/models/user.dart';

import 'models/user.dart';
import 'string_util.dart';

class UserHolder {
  Map<String, User> users = {};
  User u;

  User registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);
    print(user.toString());

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
      return user;
    } else {
      throw Exception('A user with this name already exists');
    }
  }

  User registerUserByEmail(String fullname, String email) {
    email = User.checkEmail(email);
    if (getUserByLogin(email) != null)
      throw Exception('A user with this email already exists');
    return registerUser(fullname, null, email);
  }

  User registerUserByPhone(String fullname, String phone) {
    phone = User.checkPhone(phone);
    if (getUserByLogin(phone) != null)
      throw Exception('A user with this phone already exists');
    return registerUser(fullname, phone, null);
  }

  User findUserInFriends(String fullName, User user) {
    User u = getUserByLogin(fullName);
    List<User> _friends = u?.friends;

    for (var u in _friends) if (u == user) return u;
    throw Exception('Exception(${user.login} is not a friend of the login)');
  }

  void setFriends(String login, List<User> friends) {
    u = getUserByLogin(login);
    u.addFriend(friends);
  }

  User getUserByLogin(String login) {
    return users[login];
  }

  List<User> importUsers(List<String> s) {
    RegExp exp = RegExp(r"[;]"); //;
    List<User> users = [];
    s.forEach((u) {
      List<String> ss = u.split('\n');
      users.add(registerUser(ss[0].replaceAll(exp, "").trim(),
          ss[2].replaceAll(exp, "").trim(), ss[1].replaceAll(exp, "").trim()));
    });
    return users;
  }
}

class UserUtils {
  String capitalize(String s) {
    return s.capitalize(s);
  }
}
