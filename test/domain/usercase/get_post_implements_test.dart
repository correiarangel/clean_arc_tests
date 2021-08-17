import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:clean_arc_tests/domain/entities/post.dart';
import 'package:clean_arc_tests/domain/errors/errors.dart';
import 'package:clean_arc_tests/domain/repository/post_repository.dart';
import 'package:clean_arc_tests/domain/usercase/get_post_implements.dart';
import 'package:clean_arc_tests/domain/usercase/post_param_dto.dart';

class PostPepositotoryMock extends Mock implements PostRepository {}

void main() {
  final repository = PostPepositotoryMock();
  final usercase = GetPostImplements(repository);

  test('Deve retornar lista de Post ;]', () async {
    //arrage
    final params = PostParamDTO(page: 1);
    when(() => repository.fetthPosts(params))
        .thenAnswer((invocation) async => Right(<Post>[]));
    //act
    final result = await usercase.call(params: params);
    //assert
    expect(result.isRight(), true);
  });

  test('Deve retornar uma PostException quando o repository falhar', () async {
    //arrage
    final params = PostParamDTO(page: 1);
    when(() => repository.fetthPosts(params)).thenAnswer(
        (_) async => Left(PostRepositoryException('Repository ERROR :[')));
    //act
    final result = await usercase.call(params: params);
    //assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<PostRepositoryException>());
  });

  test('Deve dar erro se ofset for menor que 1 ...', () async {
    //arrage
    final params = PostParamDTO(page: 1, offSet: 0);
    //act
    final result = await usercase.call(params: params);
    //assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPostParams>());
  });

  test('Deve dar erro se page for menor que 1 ...', () async {
    //arrage
    final params = PostParamDTO(page: 0);
    //act
    final result = await usercase.call(params: params);
    //assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPostParams>());
  });
}
