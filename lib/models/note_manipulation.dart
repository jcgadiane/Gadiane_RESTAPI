import 'package:json_annotation/json_annotation.dart';
part 'note_manipulation.g.dart';

@JsonSerializable()
class NoteManipulation {
  String noteTitle;
  String noteContent;

  NoteManipulation({
    this.noteTitle,
    this.noteContent,
  });

  Map<String, dynamic> toJson() => _$NoteManipulationToJson(this);
}
