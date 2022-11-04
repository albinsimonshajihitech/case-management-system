import 'package:flutter/material.dart';
import 'package:case_management_system/providers/sheets/google_sheets_provider.dart';

class AddPage extends StatefulWidget {
  final GoogleSheetsProvider provider;
  const AddPage({required this.provider, Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail"),
      ),
      body: Center(
        child: SizedBox(
          width: size > 300 ? 300 : size,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// House name
              TextFormField(
                controller: _nameController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "User Name"),
              ),

              const SizedBox(
                height: 12.0,
              ),

              /// House name
              TextFormField(
                controller: _ageController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "Age"),
              ),

              const SizedBox(
                height: 12.0,
              ),
              /// House name
              TextFormField(
                controller: _phoneController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "Phone Number"),
              ),

              const SizedBox(
                height: 12.0,
              ),

              /// House name
              TextFormField(
                controller: _emailController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "Email"),
              ),

              const SizedBox(
                height: 12.0,
              ),

              MaterialButton(
                  child: const Text(
                    'Add User Details',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    await widget.provider.addUser(
                        _nameController.text, _ageController.text,_phoneController.text,_emailController.text);
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
