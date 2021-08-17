import 'package:clean_arc_tests/domain/errors/errors.dart';
import 'package:clean_arc_tests/domain/repository/post_repository.dart';
import 'package:clean_arc_tests/domain/usercase/get_posts_interface.dart';
import 'package:clean_arc_tests/domain/usercase/post_param_dto.dart';
import 'package:fpdart/fpdart.dart';

class GetPostImplements implements IGetPost {
  final PostRepository repository;

  GetPostImplements(this.repository);

  @override
  FuturePostCall call({required PostParamDTO params}) async {
    if (params.page <= 0) 
      return Left(InvalidPostParams('Pagina não pode ser menor que 1 :['));
    

    if (params.offSet <= 0) 
      return Left(InvalidPostParams('Offset  não pode ser menor que 1 :['));
    
    return repository.fetthPosts(params);
  }
}
