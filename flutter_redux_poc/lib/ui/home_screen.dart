import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_poc/actions/initial_message_action.dart';
import 'package:flutter_redux_poc/actions/load_message_action.dart';
import 'package:flutter_redux_poc/domain/models/model/random_message_model.dart';
import 'package:flutter_redux_poc/states/message_error_state.dart';
import 'package:flutter_redux_poc/states/message_loaded_state.dart';
import 'package:flutter_redux_poc/states/message_loading_state.dart';
import 'package:flutter_redux_poc/states/message_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux'),
      ),
      body: _buildMessageComponent(),
    );
  }

  _buildMessageComponent() {
    return StoreConnector<MessageState, MessageState>(
      onInit: (store) {
        store.dispatch(InitialMessageAction());
      },
      converter: (store) => store.state,
      builder: (context, state) {
        if (state is MessageLoadingState) {
          return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ));
        } else if (state is MessageLoadedState) {
          return Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  tileColor: Colors.black,
                  textColor: Colors.white,
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(state.data.author ?? ''),
                  subtitle: Text(state.data.message ?? ''),
                ),
              ));
        } else if (state is MessageErrorState) {
          return Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  tileColor: Colors.black,
                  textColor: Colors.white,
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(state.bundle.errorCode),
                  subtitle: Text(state.bundle.errorMessage),
                ),
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
