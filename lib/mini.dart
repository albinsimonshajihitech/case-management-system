import 'package:flutter/material.dart';
import 'package:case_management_system/configs/secrets.dart';
import 'package:case_management_system/providers/sheets/google_sheets_provider.dart';
import 'package:case_management_system/ui/app.dart';

 mini()
{
  final provider = GoogleSheetsProvider(credentials);
  final providing = GoogleSheetsProvider(credentials);

  /// Initialize provider
  provider.initializeForWorksheet(sheetId, worksheetOne);
  providing.initializeForWorksheet(sheetId, worksheetTwe);

  runApp(SheetsApp(
    provider: provider, providing: providing,
  ));
}
///
// Villa Mascarada	Rua de Luís de Camões, nº 22, Alcabideche
// Mansão Verde	Avenida de Tóquio, nº 7, Porto
// Casa de Repouso	Rua do Descanso, nº 99, Santiago do Cacém
