import '../entities/post.dart';
import '../errors/errors.dart';
import '../usercase/post_param_dto.dart';
import 'package:fpdart/fpdart.dart' show Either;

typedef FuturePostCallRes = Future<Either<PostExcepition, List<Post>>>;
abstract class PostRepository {
  FuturePostCallRes fetthPosts(PostParamDTO params);
}
