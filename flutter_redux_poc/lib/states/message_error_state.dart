import 'package:flutter_redux_poc/data/api/common/error_bundle.dart';
import 'package:flutter_redux_poc/states/message_state.dart';

class MessageErrorState extends MessageState {
  final ErrorBundle bundle;

  MessageErrorState(this.bundle);

  @override
  List<Object?> get props => [bundle];
}
