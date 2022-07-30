import 'package:bloc_examples/todo_online/features/home/bloc/home_bloc.dart';

class GetTodosResponseModel {
  List<TodoModel>? todos;
  int? total;
  int? skip;
  int? limit;

  GetTodosResponseModel({this.todos, this.total, this.skip, this.limit});

  GetTodosResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = <TodoModel>[];
      json['todos'].forEach((v) {
        todos!.add(TodoModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (todos != null) {
      data['todos'] = todos!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}
