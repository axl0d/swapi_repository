A dart package that implement a repository and a client for requests to SWAPI service

## Features

This project uses `dio` a powerful http client that allow to preform request easily, `mocktail` and `http_mock_adapter` to do tests.
## Usage

It's simple to use, only create a new instance to access the methods

People list

```dart
final repository = SwapiRepository();
final snapshot = await repository.fetchPeople(1);
snapshot.people.forEach(print);
```

