import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'cubit/detail_cubit/detail_cubit.dart';
import 'cubit/home_cubit/home_cubit.dart';
import 'pages/detail.dart';
import 'pages/home_page.dart';
import 'service/sql_service.dart';

final sql = SQLService();
final homeCubit = HomeCubit();
final detailCubit = DetailCubit();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final databasePath = await getDatabasesPath();
  final path = join(databasePath,"TodoApp");
  await sql.open(path);
  runApp(const MyTodoApp());
}
class MyTodoApp extends StatelessWidget {
  const MyTodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/detail": (context) => DetailPage(),
      },
    );
  }
}
