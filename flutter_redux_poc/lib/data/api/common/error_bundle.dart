class ErrorBundle implements Exception {
  String errorCode;
  String errorMessage;

  ErrorBundle(this.errorCode, this.errorMessage);
}
