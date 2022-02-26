import 'package:swapi_repository/src/swapi_repository_base.dart';

Future<void> main() async {
  final repository = SwapiRepository();
  final snapshot = await repository.fetchPeople(1);
  snapshot.people.forEach(print);
  final filmUrls = snapshot.people.first.films;
  final films = await repository.fetchFilms(filmUrls);
  films.forEach(print);
}
