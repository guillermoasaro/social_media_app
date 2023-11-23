import '/models/user.dart';

class Publication {
  String id;
  String text;
  DateTime? createdAt;
  User user;

  Publication(
      {required this.id,
      required this.text,
      this.createdAt,
      required this.user});

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
        id: json['_id'],
        text: json['text'],
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        user: User.fromJson(json['user']));
  }
}
