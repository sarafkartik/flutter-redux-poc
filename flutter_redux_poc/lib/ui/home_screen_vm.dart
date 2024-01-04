
import 'package:flutter_redux_poc/states/message_state.dart';
import 'package:redux/redux.dart';

class HomeScreenVM {
  final Store<MessageState> store;
  final MessageState state;

  HomeScreenVM(this.store, this.state);
}
