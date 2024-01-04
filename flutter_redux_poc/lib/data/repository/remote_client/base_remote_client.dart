import 'dart:async';

import 'package:flutter_redux_poc/data/api/api_client.dart';
import 'package:flutter_redux_poc/data/api/common/error_bundle.dart';
import 'package:flutter_redux_poc/util/logger.dart';

class BaseRemoteClient {
  final ApiClient apiClient = ApiClient.getInstance;
  final _genericErrorCode = "1000";
  final _genericErrorMessage = "Something went wrong! Please try again.";

  FutureOr<T> handleError<T>(dynamic error) {
    Log.e("Error", '$error For Type $T');
    ErrorBundle errorBundle =
        ErrorBundle(_genericErrorCode, _genericErrorMessage);
    throw errorBundle;
  }
}
