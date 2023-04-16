import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../common/components/response/error/failure_response.dart';
abstract class BaseUseCase<Type, Params> {
  Future<Either<FailureResponse, Type>> build(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
