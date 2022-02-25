class People {
  const People({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory People.fromJson(Map<String, dynamic> json) => People(
        name: json['name'] as String?,
        height: json['height'] as String?,
        mass: json['mass'] as String?,
        hairColor: json['hair_color'] as String?,
        skinColor: json['skin_color'] as String?,
        eyeColor: json['eye_color'] as String?,
        birthYear: json['birth_year'] as String?,
        gender: json['gender'] as String?,
        homeworld: json['homeworld'] as String?,
        films: (json['films'] as List).cast<String>(),
        species: (json['species'] as List).cast<String>(),
        vehicles: (json['vehicles'] as List).cast<String>(),
        starships: (json['starships'] as List).cast<String>(),
        created: json['created'] as String?,
        edited: json['edited'] as String?,
        url: json['url'] as String?,
      );

  final String? name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;
  final String? eyeColor;
  final String? birthYear;
  final String? gender;
  final String? homeworld;
  final List<String> films;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;
  final String? created;
  final String? edited;
  final String? url;
}
