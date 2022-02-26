import 'package:swapi_repository/src/models/people.dart';

class PeopleSnapshot {
  PeopleSnapshot({
    required this.count,
    required this.next,
    required this.previous,
    required this.people,
  });

  factory PeopleSnapshot.fromJson(Map<String, dynamic> json) {
    return PeopleSnapshot(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      people: List<Map<String, dynamic>>.from(json['results'] as List)
          .map(People.fromJson)
          .toList(),
    );
  }

  final int count;
  final String? next;
  final String? previous;
  final List<People> people;
}
