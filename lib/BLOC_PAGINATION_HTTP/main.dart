import 'package:bloc/bloc.dart';
import 'package:examples/BLOC_PAGINATION_HTTP/simple_bloc_observer.dart';
import 'package:flutter/widgets.dart';
import 'app.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
