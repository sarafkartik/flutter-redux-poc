import 'dart:async';
import 'package:flutter_redux_poc/data/mapper/random_message_mapper.dart';
import 'package:flutter_redux_poc/data/repository/remote_client/base_remote_client.dart';
import 'package:flutter_redux_poc/domain/models/model/random_message_model.dart';

abstract class MessageRemoteClient {
  Future<RandomMessageModel> getRandomMessage();
}

class MessageRemoteClientImpl extends BaseRemoteClient
    implements MessageRemoteClient {
  @override
  Future<RandomMessageModel> getRandomMessage() {
    return apiClient
        .getRandomMessage()
        .then((value) => RandomMessageMapper().map(value))
        .catchError(handleError<RandomMessageModel>);
  }
}
