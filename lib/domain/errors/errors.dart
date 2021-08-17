abstract class PostExcepition implements Exception {
  final String message;
  final StackTrace? stackTrace;

  PostExcepition(this.message, [this.stackTrace]);
}

class InvalidPostParams extends PostExcepition {
  InvalidPostParams(String message) : super(message);
}

class PostRepositoryException extends PostExcepition {
  PostRepositoryException(String message) : super(message);
}
