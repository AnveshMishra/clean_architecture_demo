//
// import 'package:clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
// import 'package:clean_architecture/features/number_trivia/domain/repo/number_trivia_repo.dart';
// import 'package:clean_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// class MockNumberTriviaRepository extends Mock implements NumberTriviaRepo{}
//
//   void main(){
//     GetConcreteNumberTrivia useCase;
//     MockNumberTriviaRepository mockNumberTriviaRepository;
//     setUp((){
//       mockNumberTriviaRepository = MockNumberTriviaRepository();
//       useCase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
//     });
//
//     final tNumber = 1;
//     final tNumberTrivia = const NumberTrivia(text: "test", number: 1);
//
//     test('should get trivia for the number from repo', () async{
//       when(mockNumberTriviaRepository.getConcreteNumberTrivia(any)).thenAnswer((_) => null)
//     });
//   }