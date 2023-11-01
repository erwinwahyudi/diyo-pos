// ignore_for_file: public_member_api_docs, sort_constructors_first
class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() {
    return "Failure: $message";
  }
}
