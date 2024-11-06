import 'package:flutter/material.dart';
import 'movie_model.dart';

class AddMoviePage extends StatelessWidget {
  final Function(Movie) onAddMovie; // Function type for onAddMovie

  AddMoviePage({required this.onAddMovie});

  final _titleController = TextEditingController();
  final _commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Filme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _commentsController,
              decoration: InputDecoration(labelText: 'Comentários'),
            ),
            ElevatedButton(
              onPressed: () {
                final movie = Movie(
                  id: '', // Firestore will generate this
                  title: _titleController.text,
                  comments: _commentsController.text,
                );
                onAddMovie(movie); // Call the callback
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
