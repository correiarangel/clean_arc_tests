abstract class PostExcepition implements Exception {
  final String message;
  final StackTrace stackTrace;

  PostExcepition({required this.message, required this.stackTrace});
}
