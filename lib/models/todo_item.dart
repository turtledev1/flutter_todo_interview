class TodoItem {
  TodoItem({
    required this.title,
    this.isDone = false,
  }): id = DateTime.now().millisecondsSinceEpoch;

  final int id;
  final String title;
  bool isDone;
}
