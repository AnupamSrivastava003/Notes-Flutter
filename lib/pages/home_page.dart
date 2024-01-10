import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/components/drawer.dart';
import 'package:notes/components/note_tile.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notes_database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  // create a note
  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: const Text("Create Note"),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    // add to db
                    context.read<NoteDatabase>().addNote(textController.text);

                    // clear controller
                    textController.clear();

                    // pop dialog box
                    Navigator.pop(context);
                  },
                  child: const Text("Create"),
                )
              ],
            ));
  }

  // read a note
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update note
  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: const Text("Update Note"),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    // update note to db
                    context
                        .read<NoteDatabase>()
                        .updateNote(note.id, textController.text);

                    // clear controller
                    textController.clear();

                    // pop dialog box
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                )
              ],
            ));
  }

  // delete note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADING
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                  fontSize: 45,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),

          // LIST OF NOTES
          Expanded(
            child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (context, index) {
                  // get individual note
                  final note = currentNotes[index];
                  return NoteTile(
                    text: note.text,
                    onEditPressed: () => updateNote(note),
                    onDeletePressed: () => deleteNote(note.id),
                  );
                }),
          ),

          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
