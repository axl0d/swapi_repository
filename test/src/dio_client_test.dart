import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:swapi_repository/src/dio_client.dart';
import 'package:test/test.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late DioClient client;

  Response<Map<String, dynamic>?> response;

  group(
    'Dio client test',
    () {
      const baseUrl = 'https://swapi.dev/api/';

      setUp(
        () {
          dio = Dio(BaseOptions(baseUrl: baseUrl));
          dioAdapter = DioAdapter(dio: dio);
        },
      );

      group(
        'Get method',
        () {
          const peopleApi = 'people/';

          test(
            'Get method success test',
            () async {
              dioAdapter.onGet(
                peopleApi,
                (server) => server.reply(200, null),
              );

              client = DioClient(dio: dio);
              response = await client.fetch(peopleApi);

              expect(response.statusCode, 200);
            },
          );

          test(
            'Get method client failure test',
            () async {
              dioAdapter.onGet(
                peopleApi,
                (server) => server.reply(404, null),
              );

              client = DioClient(dio: dio);

              expect(
                () async => client.fetch(peopleApi),
                throwsA(isA<ClientFailure>()),
              );
            },
          );

          test(
            'Get method server failure test',
            () async {
              dioAdapter.onGet(
                peopleApi,
                (server) => server.reply(500, null),
              );

              client = DioClient(dio: dio);

              expect(
                () async => client.fetch(peopleApi),
                throwsA(isA<ServerFailure>()),
              );
            },
          );
        },
      );
    },
  );
}
