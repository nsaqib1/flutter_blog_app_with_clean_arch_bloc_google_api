abstract class AppExceptions {
  final String type;
  final String errorMessage;

  AppExceptions({required this.type, required this.errorMessage});
}

class JsonToModelConversionException extends AppExceptions {
  JsonToModelConversionException({
    required String errorMessage,
  }) : super(
          type: "Json To Model Conversion Exception",
          errorMessage: errorMessage,
        );
}

class NetworkRequestUnsuccessful extends AppExceptions {
  NetworkRequestUnsuccessful({
    required String errorMessage,
  }) : super(
          type: "Network Response Unsuccessful",
          errorMessage: errorMessage,
        );
}
