import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'controller/form_controller.dart';
import 'model/form.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required Key key, required this.detail}) : super(key: key);

  final String detail;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DetailScreen> {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          emailController.text,
          mobileNoController.text,
          feedbackController.text);

      FormController formController = FormController();

      _showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        if (kDebugMode) {
          print("Response: $response");
        }
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved successfully in Google Sheets.
          _showSnackbar("Feedback Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  // Method to show snack-bar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter something here to display on snack-bar")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.detail),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
                key: _formKey,
                child:
                Padding(padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Valid Name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: 'Name'
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.contains("@")) {
                            return 'Enter Valid Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: 'Email'
                        ),
                      ),
                      TextFormField(
                        controller: mobileNoController,
                        validator: (value) {
                          if (value!.trim().length != 10) {
                            return 'Enter 10 Digit Mobile Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number',
                        ),
                      ),
                      TextFormField(
                        controller: feedbackController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Valid Feedback';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                            labelText: 'Feedback'
                        ),
                      ),
                    ],
                  ),
                )
            ),
            ElevatedButton(
              onPressed: () { _submitForm(); },
              child: const Text('Submit Feedback'),
              style: ElevatedButton.styleFrom(primary: const Color(0x00000000)),
            ),
          ],
        ),
      ),
    );
  }
}