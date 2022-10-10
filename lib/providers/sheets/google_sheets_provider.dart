import 'package:case_management_system/configs/secrets.dart';
import 'package:case_management_system/models/crpc_form_entity.dart';
import 'package:gsheets/gsheets.dart';
import 'package:case_management_system/models/user_entity.dart';

class GoogleSheetsProvider {
  final GSheets _gsheets;

  late Worksheet _worksheetone;
  late Worksheet _worksheettwo;

  GoogleSheetsProvider(String credentials) : _gsheets = GSheets(credentials);

  Future<void> initializeForWorksheet(
      String spreadsheetId, String worksheetOne) async {
    final excel = await _gsheets.spreadsheet(spreadsheetId);


    _worksheetone = excel.worksheetByTitle(worksheetOne)!;
    _worksheettwo = excel.worksheetByTitle(worksheetTwe)!;
  }

  Future<List<UserEntity>> getUser() async {
    /// skips the first value which is the header
    final values = (await _worksheetone.values.allRows()).skip(1).toList();
    return values.map((value) => UserEntity.fromSheets(value)).toList();
  }

  Future<List<CrpcEntity>> getCrpcform() async {

    final crp = (await _worksheettwo.values.allRows()).skip(1).toList();
    return crp.map((crp) => CrpcEntity.fromSheets(crp)).toList();
  }

  Future<bool> deleteUser(int index) {
    /// We add one to the index so that we can:
    /// 1. Start at index 1
    /// 2. Skip the first row
    return _worksheetone.deleteRow(index + 2);
  }

  Future<bool> addUser(String name, String age, String phone, String email) {
    return _worksheetone.values.appendRow([name, age, phone, email]);
  }

  Future<bool> addCrpcform(String court_name, String case_type, String case_no, String case_year, String petitioner_name, String petitioner_paternal_title, String petitioner_paternal_name, String petitioner_address, String respondent_name, String respondent_address, String date) {
    return _worksheettwo.values.appendRow([court_name, case_type, case_no, case_year, petitioner_name, petitioner_paternal_title, petitioner_paternal_name, petitioner_address, respondent_name, respondent_address, date]);
  }


}

   