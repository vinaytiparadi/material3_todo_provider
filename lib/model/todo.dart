class TodoField{
  static const createdTime = 'createdTime';
}

class Todo{
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({required this.createdTime, required this.title, required this.id, this.description='', this.isDone = false});
}