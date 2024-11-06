import 'package:flutter/material.dart';
import 'add_movie_page.dart';
import 'movie_model.dart';
import 'firestore_service.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Movie> movies = [];
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  // Load movies from Firestore
  Future<void> _loadMovies() async {
    movies = await _firestoreService.getMovies();
    setState(() {});
  }

  // Add a movie and save it to Firestore
  void _addMovie(Movie movie) {
    setState(() {
      movies.add(movie); // Update local state
    });
    _firestoreService.addMovie(movie); // Save to Firestore
  }

  // Remove a movie from the list and Firestore
  void _removeMovie(String id) {
    setState(() {
      movies.removeWhere((movie) => movie.id == id); // Update local state
    });
    _firestoreService.deleteMovie(id); // Remove from Firestore
  }

  // Toggle the watched state of a movie
  void _toggleWatched(String id) {
    final movie = movies.firstWhere((movie) => movie.id == id);
    final updatedMovie = Movie(
      id: movie.id,
      title: movie.title,
      comments: movie.comments,
      watched: !movie.watched, // Toggle watched state
    );

    setState(() {
      movie.watched = !movie.watched; // Update local state
    });
    _firestoreService.updateMovie(updatedMovie); // Update in Firestore
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmes'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddMoviePage(onAddMovie: _addMovie),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            child: ListTile(
              leading: Checkbox(
                value: movie.watched,
                onChanged: (bool? value) {
                  _toggleWatched(movie.id); // Toggle watched state
                },
              ),
              title: Text(movie.title),
              subtitle: Text(movie.comments),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _removeMovie(movie.id); // Delete movie
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
