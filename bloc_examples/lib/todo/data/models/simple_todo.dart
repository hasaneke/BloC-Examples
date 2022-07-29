class SimpleTodo {
  final String id;
  final String content;
  final bool? isDone;
  SimpleTodo({
    required this.id,
    required this.content,
    this.isDone,
  });

  SimpleTodo copyWith({
    String? id,
    String? content,
    bool? isDone,
  }) {
    return SimpleTodo(
      id: id ?? this.id,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone,
    );
  }
}
