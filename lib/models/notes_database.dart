import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  // INITIALIZE DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = Isar.openSync([NoteSchema], directory: dir.path);

  }

  // list of Notes
  final List<Note> currentNotes = [];

  // CREATE 
  Future<void> addNote (String textFromUser) async {

    // create a new note object
    final newNote = Note()..text = textFromUser;

    // save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    // re read from db
    fetchNotes();
  }

  // READ
  Future<void> fetchNotes() async {
    List<Note> fetchNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchNotes);
    notifyListeners();
  }

  // UPDATE
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote!= null){
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    } 
  }

  // DELETE
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }

}