
import 'package:equatable/equatable.dart';

class NumberTriviaTest extends Equatable{
  final String text;
  final int number;

  const NumberTriviaTest({required this.text, required this.number});

  @override
  // TODO: implement props
  List<Object?> get props => [text,number];

}