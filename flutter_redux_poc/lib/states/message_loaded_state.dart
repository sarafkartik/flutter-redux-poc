import 'package:flutter_redux_poc/domain/models/model/random_message_model.dart';
import 'package:flutter_redux_poc/states/message_state.dart';

class MessageLoadedState extends MessageState {
  final RandomMessageModel data;

  MessageLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}
