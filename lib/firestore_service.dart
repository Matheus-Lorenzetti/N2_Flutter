import 'package:cloud_firestore/cloud_firestore.dart';
import 'movie_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get all movies from Firestore
  Future<List<Movie>> getMovies() async {
    final snapshot = await _db.collection('Filmes').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Movie(
        id: doc.id, // Store the document ID
        title: data['Título'] ?? '',
        comments: data['Comentários'] ?? '',
        watched: data['watched'] ?? false,
      );
    }).toList();
  }

  // Add a movie to Firestore
  Future<void> addMovie(Movie movie) async {
    try {
      await _db.collection('Filmes').add({
        'Título': movie.title,
        'Comentários': movie.comments,
        'watched': movie.watched,
      });
    } catch (e) {
      print('Error adding movie: $e'); // Print error to console
    }
  }

  // Delete a movie from Firestore
  Future<void> deleteMovie(String id) async {
    await _db.collection('Filmes').doc(id).delete();
  }

  // Update a movie in Firestore
  Future<void> updateMovie(Movie movie) async {
    await _db.collection('Filmes').doc(movie.id).update({
      'Título': movie.title,
      'Comentários': movie.comments,
      'watched': movie.watched,
    });
  }
}
