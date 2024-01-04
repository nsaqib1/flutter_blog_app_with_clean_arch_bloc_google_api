class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final Map<String, dynamic> response;
  final String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    required this.response,
    this.errorMessage,
  }) : assert(isSuccess == true && errorMessage == null, 'If isSuccess is false, "errorMessage" must have a value.');
}
