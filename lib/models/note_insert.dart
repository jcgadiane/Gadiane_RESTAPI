import 'package:json_annotation/json_annotation.dart';
part 'note_insert.g.dart';

@JsonSerializable()
class NoteInsert {
  String noteTitle;
  String noteContent;

  NoteInsert({
    this.noteTitle,
    this.noteContent,
  });

  Map<String, dynamic> toJson() => _$NoteInsertToJson(this);
}
