import 'package:flutter_redux_poc/actions/load_message_action.dart';
import 'package:flutter_redux_poc/actions/message_error_action.dart';
import 'package:flutter_redux_poc/states/message_error_state.dart';
import 'package:flutter_redux_poc/states/message_loaded_state.dart';
import 'package:flutter_redux_poc/states/message_state.dart';

MessageState messageReducer(MessageState state, dynamic action) {
  if (action is LoadMessageAction) {
    return MessageLoadedState(action.model);
  } else if (action is MessageErrorAction) {
    return MessageErrorState(action.error);
  }
  return state;
}
