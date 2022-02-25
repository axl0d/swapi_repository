import 'package:swapi_repository/src/dio_client.dart';
import 'package:swapi_repository/src/models/people_snapshot.dart';

const peopleApi = 'people/';

class ResponseDataFailure implements Exception {}

class SwapiRepository {
  SwapiRepository({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  final DioClient _dioClient;

  Future<PeopleSnapshot> fetchPeople(int page) async {
    final response = await _dioClient.fetch(
      peopleApi,
      queryParameters: <String, dynamic>{'page': page},
    );

    final data = response.data;

    if (data == null) throw ResponseDataFailure();

    final snapshot = PeopleSnapshot.fromJson(data);
    return snapshot;
  }
}
