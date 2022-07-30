part of 'home_bloc.dart';

class HomeState {
  final List<TodoModel> todos;
  HomeStatus homeStatus;
  HomeState({required this.todos, required this.homeStatus});

  HomeState copyWith({
    List<TodoModel>? todos,
    HomeStatus? homeStatus,
  }) {
    return HomeState(
      todos: todos ?? this.todos,
      homeStatus: homeStatus ?? this.homeStatus,
    );
  }
}

enum HomeStatus { none, loading, loaded, failed }

class TodoModel {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  TodoModel({this.id, this.todo, this.completed, this.userId});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    return data;
  }
}
