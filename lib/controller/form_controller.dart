import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {

  // Google App Script Web URL.
  static String url = ("https://script.google.com/macros/library/d/1vpD7Wv32smmL_7onEV0gWUGKbx5MeO_HAbdKnXBzF7mpWz7DYI4fw9Az/1");

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  String? get body => '';

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      http.post(Uri.http(url,body.toString()),body: feedbackForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          http.get(Uri.http(url!,body.toString())).then((response) {
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