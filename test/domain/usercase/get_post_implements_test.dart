import 'package:clean_arc_tests/domain/entities/post.dart';
import 'package:clean_arc_tests/domain/repository/post_repository.dart';
import 'package:clean_arc_tests/domain/usercase/get_post_implements.dart';
import 'package:clean_arc_tests/domain/usercase/post_param_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class PostPepositotoryMock implements PostRepository {
  @override
  FuturePostCallRes fetthPosts(PostParamDTO params) async{
    return Right(<Post>[]);
  }
}

void main() {
  final repository = PostPepositotoryMock();
  final usercase = GetPostImplements(repository);
  testWidgets('Deve retornar lista de Post...?', (tester) async {
    //arrage
    final params = PostParamDTO(page: 1);
    //act
    final result = await usercase.call(params: params);
    //assert
    expect(result.isRight(), true);
  });
}
