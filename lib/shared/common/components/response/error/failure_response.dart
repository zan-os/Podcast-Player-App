import 'package:equatable/equatable.dart';

class FailureResponse extends Equatable {
  final String errorMessage;
  final num? statusCode;

  const FailureResponse({required this.errorMessage, this.statusCode});

  @override
  List<Object?> get props => [errorMessage, statusCode];
}
