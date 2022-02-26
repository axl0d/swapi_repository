class Film {
  const Film({
    required this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    this.created,
    this.edited,
    this.url,
  });

  factory Film.fromJson(Map<String, dynamic> json) => Film(
        title: json['title'] as String? ?? '',
        episodeId: json['episode_id'] as int?,
        openingCrawl: json['opening_crawl'] as String?,
        director: json['director'] as String?,
        producer: json['producer'] as String?,
        releaseDate: json['release_date'] as String?,
        characters: (json['characters'] as List).cast<String>(),
        planets: (json['planets'] as List).cast<String>(),
        starships: (json['starships'] as List).cast<String>(),
        vehicles: (json['vehicles'] as List).cast<String>(),
        species: (json['species'] as List).cast<String>(),
        created: json['created'] as String?,
        edited: json['edited'] as String?,
        url: json['url'] as String?,
      );

  final String title;
  final int? episodeId;
  final String? openingCrawl;
  final String? director;
  final String? producer;
  final String? releaseDate;
  final List<String> characters;
  final List<String> planets;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> species;
  final String? created;
  final String? edited;
  final String? url;

  @override
  String toString() => 'Film -> title: $title';
}
