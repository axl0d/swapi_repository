import 'package:swapi_repository/src/models/people.dart';
import 'package:swapi_repository/src/models/people_snapshot.dart';
import 'package:test/test.dart';

void main() {
  group(
    'People Snapshot',
    () {
      final response = {
        'count': 82,
        'next': null,
        'previous': 'https://swapi.dev/api/people/?page=8',
        'results': [
          {
            'name': 'Sly Moore',
            'height': '178',
            'mass': '48',
            'hair_color': 'none',
            'skin_color': 'pale',
            'eye_color': 'white',
            'birth_year': 'unknown',
            'gender': 'female',
            'homeworld': 'https://swapi.dev/api/planets/60/',
            'films': [
              'https://swapi.dev/api/films/5/',
              'https://swapi.dev/api/films/6/'
            ],
            'species': <String>[],
            'vehicles': <String>[],
            'starships': <String>[],
            'created': '2014-12-20T20:18:37.619000Z',
            'edited': '2014-12-20T21:17:50.496000Z',
            'url': 'https://swapi.dev/api/people/82/'
          },
          {
            'name': 'Tion Medon',
            'height': '206',
            'mass': '80',
            'hair_color': 'none',
            'skin_color': 'grey',
            'eye_color': 'black',
            'birth_year': 'unknown',
            'gender': 'male',
            'homeworld': 'https://swapi.dev/api/planets/12/',
            'films': ['https://swapi.dev/api/films/6/'],
            'species': ['https://swapi.dev/api/species/37/'],
            'vehicles': <String>[],
            'starships': <String>[],
            'created': '2014-12-20T20:35:04.260000Z',
            'edited': '2014-12-20T21:17:50.498000Z',
            'url': 'https://swapi.dev/api/people/83/'
          }
        ]
      };
      group(
        'fromJson',
        () {
          test(
            'works correctly',
            () {
              expect(
                PeopleSnapshot.fromJson(response),
                isA<PeopleSnapshot>(),
              );
            },
          );

          test(
            'cast method works correctly',
            () {
              final snapshot = PeopleSnapshot.fromJson(response);
              final character = snapshot.people.first;
              expect(character, isA<People>());
            },
          );
        },
      );
    },
  );
}
