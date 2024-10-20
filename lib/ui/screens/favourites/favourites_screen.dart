import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:book_flix/utils/widgets/movie_card.dart'; // Importamos el widget personalizado MovieCard

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  // Estado para almacenar la lista de películas
  List<dynamic> favouriteMovies = [];
  int selectedIndex =
      0; // Índice de la sección seleccionada (0: Películas, 1: Libros)

  @override
  void initState() {
    super.initState();
    fetchFavouriteMovies(); // Llamada a la API al iniciar
  }

  // Función para obtener los datos de la API
  Future<void> fetchFavouriteMovies() async {
    final response = await http
        .get(Uri.parse('https://api.example.com/movies')); // URL de la API

    if (response.statusCode == 200) {
      // Si la solicitud fue exitosa, actualiza el estado con los datos
      setState(() {
        favouriteMovies = jsonDecode(response.body);
      });
    } else {
      // Si hubo un error, maneja el estado de error
      throw Exception('Error al cargar las películas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Barra superior con botones
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200], // Color de fondo
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0; // Cambia a sección de películas
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? const Color.fromARGB(255, 245, 55, 55)
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.horizontal(left: Radius.circular(8)),
                        ),
                        child: Center(
                          child: Text(
                            'Películas',
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1; // Cambia a sección de libros
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selectedIndex == 1
                              ? const Color.fromARGB(255, 245, 55, 55)
                              : Colors.transparent,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(8)),
                        ),
                        child: Center(
                          child: Text(
                            'Libros',
                            style: TextStyle(
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // Espacio entre la barra y la lista
            Expanded(
              child: ListView.builder(
                itemCount: favouriteMovies.isEmpty
                    ? 3
                    : favouriteMovies
                        .length, // Muestra 3 espacios si no hay datos
                itemBuilder: (context, index) {
                  if (favouriteMovies.isEmpty) {
                    // Espacio reservado cuando no hay películas
                    return Container(
                      height: 150, // Altura del espacio reservado
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                          child: Text('Espacio reservado para la película')),
                    );
                  } else {
                    final movie = favouriteMovies[index];
                    return MovieCard(
                      title: movie['title'],
                      description: movie['description'],
                      rating: movie['rating'].toDouble(),
                      genres: List<String>.from(movie['genres']),
                      imageUrl: movie['imageUrl'],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie), // Ícono de películas
            label: 'Películas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Ícono de libros
            label: 'Libros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Ícono de favoritos
            label: 'Favoritos',
          ),
        ],
        currentIndex: 2, // Establecer el índice actual en Favoritos
        selectedItemColor: const Color.fromARGB(255, 245, 64, 58),
        unselectedItemColor: Colors.grey, // Color para íconos no seleccionados
        onTap: (index) {
          // Manejar la navegación aquí
          // Puedes usar GoRouter o Navigator.push para cambiar de pantalla
        },
      ),
    );
  }
}
