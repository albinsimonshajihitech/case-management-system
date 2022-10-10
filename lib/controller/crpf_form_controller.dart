// ignore_for_file: unused_local_variable

import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/crpc_form.dart';


/// FormController is a class which does work of saving UserdetailForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class CrpcFormController {
  // Google App Script Web URL.
  static const String URL = "https://script.google.com/macros/s/AKfycbyAaNh-1JK5pSrUnJ34Scp3889mTMuFI86DkDp42EkWiSOOycE/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves userdetail, parses [crpcForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      CrpcForm crpcForm, void Function(String) callback) async {
    try {
      await http.post(Uri.parse(URL), body: crpcForm.toJson()).then((response) async {
        if (response.statusCode == 200) {
          var url = response.headers['location'];
          await http.get(Uri.parse(URL)).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  /// Async function which loads userdetail from endpoint URL and returns List.
  Future<List<CrpcForm>> getCrpcFormList() async {
    return await http.get(Uri.parse(URL)).then((response) {
      var jsonCrpcform = convert.jsonDecode(response.body).toList();
      return jsonCrpcform.map((json) => CrpcForm.fromJson(json)).toList();
    });
  }
}
