import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:list_of_users/model/user_data.dart';
import 'package:list_of_users/repository/user_repository.dart';
import 'package:list_of_users/utilities/constants.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  group('UserRepository testing', () {
    test(
        'given UserRepository class when getUser function is called and status code is 200 then a usermodel should be returned',
        () async {
      // arrange

      when(() => mockHTTPClient.get(Uri.parse(kUsersURL)))
          .thenAnswer((invocation) async {
        return Response(
          '''
{
"page": 2,
"per_page": 6,
"total": 12,
"total_pages": 2,
"data": [
{
"id": 7,
"email": "michael.lawson@reqres.in",
"first_name": "Michael",
"last_name": "Lawson",
"avatar": "https://reqres.in/img/faces/7-image.jpg"
},
{
"id": 8,
"email": "lindsay.ferguson@reqres.in",
"first_name": "Lindsay",
"last_name": "Ferguson",
"avatar": "https://reqres.in/img/faces/8-image.jpg"
},
{
"id": 9,
"email": "tobias.funke@reqres.in",
"first_name": "Tobias",
"last_name": "Funke",
"avatar": "https://reqres.in/img/faces/9-image.jpg"
},
{
"id": 10,
"email": "byron.fields@reqres.in",
"first_name": "Byron",
"last_name": "Fields",
"avatar": "https://reqres.in/img/faces/10-image.jpg"
},
{
"id": 11,
"email": "george.edwards@reqres.in",
"first_name": "George",
"last_name": "Edwards",
"avatar": "https://reqres.in/img/faces/11-image.jpg"
},
{
"id": 12,
"email": "rachel.howell@reqres.in",
"first_name": "Rachel",
"last_name": "Howell",
"avatar": "https://reqres.in/img/faces/12-image.jpg"
}
],
"support": {
"url": "https://reqres.in/#support-heading",
"text": "To keep ReqRes free, contributions towards server costs are appreciated!"
}
}
''',
          200,
        );
      });

      // act
      final user = await userRepository.getUsers();

      // assert
      expect(user, isA<List<UserData>>());
      expect(user.length, 6);
    });

    test(
      'given UserRepository class when getUser function is called and status code is not 200 then an exception should be thrown',
      () async {
        // arrange
        when(
          () => mockHTTPClient.get(
            Uri.parse(kUsersURL),
          ),
        ).thenAnswer((invocation) async => Response('{}', 500));
        // act
        final user = userRepository.getUsers();
        // assert
        expect(user, throwsException);
      },
    );
  });
}
