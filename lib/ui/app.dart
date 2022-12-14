import 'package:case_management_system/ui/screens/add/crpc_form.dart';
import 'package:case_management_system/ui/screens/home/crpc_page.dart';
import 'package:flutter/material.dart';
import 'package:case_management_system/providers/sheets/google_sheets_provider.dart';
import 'package:case_management_system/ui/screens/add/user_add_page.dart';
import 'package:case_management_system/ui/screens/home/user_page.dart';

const String routeAdd = '/add';
const String routeHome = '/';
const String routeaddDetail ='/add';
const String routeCrpc ='/';

class SheetsApp extends StatelessWidget {
  final GoogleSheetsProvider provider;
  final GoogleSheetsProvider providing;

  const SheetsApp({
    required this.provider,required this.providing,
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
        //routeCrpc:(_) => CrpcPage(providing:providing),
        //routeaddDetail:(_) => Crpcform(providing: providing),
      },
    );
  }
}
