class Todo {
  final String id;
  final String content;
  final bool? isDone;
  Todo({
    required this.id,
    required this.content,
    this.isDone,
  });

  Todo copyWith({
    String? id,
    String? content,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone,
    );
  }
}
