class Note{
  String text;
  String id;

  Note({required this.text, required this.id});

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
  };
}