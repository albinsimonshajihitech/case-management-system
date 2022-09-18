import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {

  // Google App Script Web URL.
  static String url = ('https://script.google.com/macros/s/AKfycbydQomCMstV6fNDhL5-NjJdxdCJrzefnEI39IPbyS3LiotBNNTHGT0AGcmH3ST8XQr9/exec');

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  String? get body => null;

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      http.post(Uri.https(url,body!),body: feedbackForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          http.get(Uri.https(url!,body!)).then((response) {
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
}