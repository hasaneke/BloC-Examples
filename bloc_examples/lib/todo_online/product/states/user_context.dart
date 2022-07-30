import 'package:bloc_examples/todo_online/features/login/data/models/user_model.dart';

class UserContext {
  User? currentUser;

  updateUser(User user) {
    currentUser = user;
  }
}
