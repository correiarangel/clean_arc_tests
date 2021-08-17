import 'package:clean_arc_tests/domain/entities/post.dart';
import 'package:clean_arc_tests/domain/errors/errors.dart';
import 'package:clean_arc_tests/domain/usercase/post_param_dto.dart';
import 'package:fpdart/fpdart.dart';

typedef FuturePostCall = Future<Either<PostExcepition, List<Post>>>;

abstract class IGetPost {
  FuturePostCall call({required PostParamDTO params});
}
