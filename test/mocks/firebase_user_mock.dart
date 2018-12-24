import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class FireBaseUserMock extends Mock implements FirebaseUser {
  @override
  final String displayName = 'Sam';
}