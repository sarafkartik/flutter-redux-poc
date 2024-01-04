import 'dart:async';

import 'package:flutter_redux_poc/actions/initial_message_action.dart';
import 'package:flutter_redux_poc/actions/load_message_action.dart';
import 'package:flutter_redux_poc/actions/message_error_action.dart';
import 'package:flutter_redux_poc/data/api/common/error_bundle.dart';
import 'package:flutter_redux_poc/data/repository/message_repository.dart';
import 'package:flutter_redux_poc/data/repository/message_repository_impl.dart';
import 'package:flutter_redux_poc/data/repository/remote_client/message_remote_client.dart';
import 'package:flutter_redux_poc/states/message_state.dart';
import 'package:redux/redux.dart';

void dataFetchMiddleware(
    Store<MessageState> store, dynamic action, NextDispatcher next) {
  final MessageRepository repository =
      MessageRepositoryImpl(MessageRemoteClientImpl());
  if (action is InitialMessageAction) {
    fetchAndUpdateData(store, repository);
    Timer.periodic(const Duration(seconds: 5), (timer) {
      fetchAndUpdateData(store, repository);
    });
  }
  next(action);
}

void fetchAndUpdateData(Store<MessageState> store, repository) async {
  try {
    final message = await repository.getRandomMessage();
    store.dispatch(LoadMessageAction(message));
    return;
  } catch (e) {
    if (e is ErrorBundle) {
      store.dispatch(MessageErrorAction(e));
      return;
    } else {
      store.dispatch(
          MessageErrorAction(ErrorBundle("1000", "Something went wrong!")));
      return;
    }
  }
}
