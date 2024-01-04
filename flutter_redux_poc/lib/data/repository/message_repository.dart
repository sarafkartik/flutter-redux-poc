import 'package:flutter_redux_poc/domain/models/model/random_message_model.dart';

abstract class MessageRepository {
  Future<RandomMessageModel> getRandomMessage();
}
