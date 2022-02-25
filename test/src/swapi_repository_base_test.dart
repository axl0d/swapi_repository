import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swapi_repository/src/dio_client.dart';
import 'package:swapi_repository/src/swapi_repository_base.dart';
import 'package:test/test.dart';

class MockDioClient extends Mock implements DioClient {}

class MockDioResponse extends Mock implements Response<Map<String, dynamic>?> {}

class MockDioError extends Mock implements DioError {}

class FakeUri extends Fake implements Uri {}

void main() {
  group(
    'Swapi repository test',
    () {
      late DioClient mockClient;
      late SwapiRepository repository;

      setUpAll(() {
        registerFallbackValue(FakeUri());
      });

      setUp(
        () {
          mockClient = MockDioClient();
          repository = SwapiRepository(dioClient: mockClient);
        },
      );

      test(
        'does not require an client instance',
        () {
          expect(SwapiRepository(), isNotNull);
        },
      );

      group(
        'Get method',
        () {
          const peopleApi = 'people/';

          test(
            'Get method success test',
            () async {
              try {
                await repository.fetchPeople(1);
              } catch (_) {}

              verify(
                () => mockClient.fetch(
                  peopleApi,
                  queryParameters: <String, dynamic>{'page': 1},
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
