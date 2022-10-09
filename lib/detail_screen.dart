// ignore_for_file: unused_local_variable
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'controller/form_controller.dart';
import 'userdetail_list.dart';
import 'model/user_form.dart';

class DetailScreenPage extends StatelessWidget {
  const DetailScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Detail',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DetailScreen(title: "User Detail", key: UniqueKey(),));
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DetailScreen> {
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
  TextEditingController userdetailController = TextEditingController();

  // Method to Submit Userdetail and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState?.validate() ?? true) {
      // If the form is valid, proceed.
      UserdetailForm userdetailForm = UserdetailForm(
          nameController.text,
          emailController.text,
          mobileNoController.text,
          userdetailController.text);

      FormController formController = FormController();

      _showSnackbar("Submitting Userdetail");

      // Submit 'userdetailForm' and save it in Google Sheets.
      formController.submitForm(userdetailForm, (String response) {
        if (kDebugMode) {
          print("Response: $response");
        }
        if (response == FormController.STATUS_SUCCESS) {
          // Userdetail is saved successfully in Google Sheets.
          _showSnackbar("Userdetail Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content: Text(snackBar.toString())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter Valid Name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          bool isPhoneNoValid(String? value) {
                            if (value == null) return false;
                            final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                            return regExp.hasMatch(value);
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                      TextFormField(
                        controller: mobileNoController,
                        validator: (value) {
                          if (value?.trim().length != 10) {
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
                        controller: userdetailController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter Valid Userdetail';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(labelText: 'Userdetail'),
                      ),
                    ],
                  ),
                )),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit Userdetail'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserdetailListScreen(),
                    ));
              },
              child: const Text('View Userdetail'),
            ),
          ],
        ),
      ),
    );
  }
}
