import 'dart:convert';

import 'package:lesson1/models/api_response.dart';
import 'package:lesson1/models/note_for_listing.dart';
import 'package:http/http.dart' as http;
import 'package:lesson1/models/note_manipulation.dart';

import '../models/note.dart';
import '../models/note_insert.dart';

class NoteService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {
    'apiKey': 'e51d646c-81a6-4098-8025-8ae4c33433e4',
    'Content-Type': 'application/json'
  };
  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(Uri.parse(API + '/notes'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(
          data: notes,
        );
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An Error occured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An Error occured'));
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http
        .get(Uri.parse(API + '/notes/${noteID}'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: 'An Error occured');
    }).catchError((_) =>
            APIResponse<Note>(error: true, errorMessage: 'An Error occured'));
  }

  Future<APIResponse<bool>> createNote(NoteInsert item) {
    return http
        .post(Uri.parse(API + '/notes'),
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An Error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An Error occured'));
  }

  Future<APIResponse<bool>> updateNote(String noteID, NoteManipulation item) {
    return http
        .put(Uri.parse(API + '/notes/$noteID'),
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An Error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An Error occured'));
  }

  Future<APIResponse<bool>> deleteNote(String noteID) {
    return http
        .delete(Uri.parse(API + '/notes/$noteID'), headers: headers)
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An Error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An Error occured'));
  }
}
