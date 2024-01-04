import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_poc/reducer/message_reducer.dart';
import 'package:flutter_redux_poc/reducer/middleware/data_fetch_middleware.dart';
import 'package:flutter_redux_poc/states/message_loading_state.dart';
import 'package:flutter_redux_poc/states/message_state.dart';
import 'package:flutter_redux_poc/ui/home_screen.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<MessageState>(
    messageReducer,
    initialState: MessageLoadingState(),
    middleware: [dataFetchMiddleware],
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<MessageState> store;

  const MyApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<MessageState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
