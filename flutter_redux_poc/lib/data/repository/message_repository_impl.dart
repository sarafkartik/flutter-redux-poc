import 'package:flutter_redux_poc/data/repository/message_repository.dart';
import 'package:flutter_redux_poc/data/repository/remote_client/message_remote_client.dart';
import 'package:flutter_redux_poc/domain/models/model/random_message_model.dart';

class MessageRepositoryImpl extends MessageRepository {
  final MessageRemoteClient _messageRemoteClient;

  MessageRepositoryImpl(this._messageRemoteClient);

  @override
  Future<RandomMessageModel> getRandomMessage() =>
      _messageRemoteClient.getRandomMessage();
}
