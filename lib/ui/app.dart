import 'package:case_management_system/ui/screens/add/crpc_form.dart';
import 'package:flutter/material.dart';
import 'package:case_management_system/providers/sheets/google_sheets_provider.dart';
import 'package:case_management_system/ui/screens/add/add_page.dart';
import 'package:case_management_system/ui/screens/home/home_page.dart';
import 'package:case_management_system/ui/screens/add/crpc_form.dart';

const String routeAdd = '/add';
const String routeHome = '/';
const String routeaddDetail ='/';

class SheetsApp extends StatelessWidget {
  final GoogleSheetsProvider provider;

  const SheetsApp({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: routeHome,
      routes: {
        routeHome: (_) => HomePage(provider: provider),
        routeAdd: (_) => AddPage(provider: provider),
        routeaddDetail:(_) => Formone(provider: provider),
      },
    );
  }
}
