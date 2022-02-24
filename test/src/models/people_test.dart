import 'package:swapi_repository/src/models/people.dart';
import 'package:test/test.dart';

void main() {
  group(
    'People',
    () {
      People createCharacter({
        String? name = 'Luke Skywalker',
        String? height = '172',
        String? mass = '77',
        String? hairColor = 'blond',
        String? skinColor = 'fair',
        String? eyeColor = 'blue',
        String? birthYear = '19BBY',
        String? gender = 'male',
        String? homeworld = 'https://swapi.dev/api/planets/1/',
        List<String>? films = const [
          'https://swapi.dev/api/films/2/',
          'https://swapi.dev/api/films/6/',
          'https://swapi.dev/api/films/3/',
          'https://swapi.dev/api/films/1/',
          'https://swapi.dev/api/films/7/'
        ],
        List<String>? species = const ['https://swapi.dev/api/species/1/'],
        List<String>? vehicles = const [
          'https://swapi.dev/api/vehicles/14/',
          'https://swapi.dev/api/vehicles/30/'
        ],
        List<String>? starships = const [
          'https://swapi.dev/api/starships/12/',
          'https://swapi.dev/api/starships/22/'
        ],
        String? created = '2014-12-09T13:50:51.644000Z',
        String? edited = '2014-12-20T21:17:56.891000Z',
        String? url = 'https://swapi.dev/api/people/1/',
      }) {
        return People(
          name: name,
          height: height,
          mass: mass,
          hairColor: hairColor,
          skinColor: skinColor,
          eyeColor: eyeColor,
          birthYear: birthYear,
          gender: gender,
          homeworld: homeworld,
          films: films,
          species: species,
          vehicles: vehicles,
          starships: starships,
          created: created,
          edited: edited,
          url: url,
        );
      }

      final characterJson = <String, dynamic>{
        'name': 'Luke Skywalker',
        'height': '172',
        'mass': '77',
        'hair_color': 'blond',
        'skin_color': 'fair',
        'eye_color': 'blue',
        'birth_year': '19BBY',
        'gender': 'male',
        'homeworld': 'https://swapi.dev/api/planets/1/',
        'films': [
          'https://swapi.dev/api/films/2/',
          'https://swapi.dev/api/films/6/',
          'https://swapi.dev/api/films/3/',
          'https://swapi.dev/api/films/1/',
          'https://swapi.dev/api/films/7/'
        ],
        'species': ['https://swapi.dev/api/species/1/'],
        'vehicles': [
          'https://swapi.dev/api/vehicles/14/',
          'https://swapi.dev/api/vehicles/30/'
        ],
        'starships': [
          'https://swapi.dev/api/starships/12/',
          'https://swapi.dev/api/starships/22/'
        ],
        'created': '2014-12-09T13:50:51.644000Z',
        'edited': '2014-12-20T21:17:56.891000Z',
        'url': 'https://swapi.dev/api/people/1/'
      };

      group(
        'constructor',
        () {
          test(
            'works correctly',
            () {
              expect(
                createCharacter,
                returnsNormally,
              );
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'works correctly',
            () {
              expect(
                People.fromJson(characterJson),
                isA<People>(),
              );
            },
          );
        },
      );
    },
  );
}
