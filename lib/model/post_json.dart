import 'package:json_annotation/json_annotation.dart';

part 'post_json.g.dart';

@JsonSerializable()
class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  get userId => null;
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
