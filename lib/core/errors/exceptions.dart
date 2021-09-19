import 'package:equatable/equatable.dart';

class CustomException implements Exception {
  final String message;

  CustomException({required this.message});
}

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class CustomFailure extends Failure {
  final String message;

  CustomFailure({required this.message});

  @override
  List<Object> get props => [message];
}
