import 'package:flutter/material.dart';
import 'package:flutter_quizer_app_master/Sqflite/sqlite.dart';
import '../models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final title = TextEditingController();
  final content = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff49796B),
        title: Center(child: const Text("Create note")),
        actions: [
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff49796B).withOpacity(0.5),
        onPressed: () {
          //Add Note button
          //We should not allow empty data to the database
          if (formKey.currentState!.validate()) {
            db
                .createNote(NoteModel(
                noteTitle: title.text,
                noteContent: content.text,
                createdAt: DateTime.now().toIso8601String()))
                .whenComplete(() {
              //When this value is true
              Navigator.of(context).pop(true);
            });
          }
        },
      child: Icon(Icons.check),
      ),

      body: Form(
          //I forgot to specify key
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Title is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text("Title"),
                    ),
                  ),
                  TextFormField(
                    controller: content,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Content is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text("Content"),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
