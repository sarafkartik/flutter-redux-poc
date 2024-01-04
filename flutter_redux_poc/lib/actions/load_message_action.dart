import 'package:flutter_redux_poc/domain/models/model/random_message_model.dart';

class LoadMessageAction {
  final RandomMessageModel model;

  LoadMessageAction(this.model);
}
