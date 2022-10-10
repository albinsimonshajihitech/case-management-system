import 'package:flutter/material.dart';
import 'package:case_management_system/providers/sheets/google_sheets_provider.dart';

class Formone extends StatefulWidget {
  final GoogleSheetsProvider provider;
  const Formone({required this.provider, Key? key}) : super(key: key);

  @override
  _FormoneState createState() => _FormoneState();

  class _FormoneState extends State<Formone> {
  final TextEditingController _courtnameController = TextEditingController();
  final TextEditingController _casetypeController = TextEditingController();
  final TextEditingController _casenumberController = TextEditingController();
  final TextEditingController _caseyearController = TextEditingController();
  final TextEditingController _petitionernameController = TextEditingController();
  final TextEditingController _petitionerpaternaltitleController = TextEditingController();
  final TextEditingController _petitionerpaternalnameController = TextEditingController();
  final TextEditingController _paternaladdressController = TextEditingController();
  final TextEditingController _respondentnameController = TextEditingController();
  final TextEditingController _respondentaddressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRPC Form"),
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
                controller: _courtnameController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "Court Name"),
              ),

              const SizedBox(
                height: 12.0,
              ),

              /// House name
              TextFormField(
                controller: _casetypeController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "Case Type"),
              ),

              const SizedBox(
                height: 12.0,
              ),
              /// House name
              TextFormField(
                controller: _casenumberController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "Case Number"),
              ),

              const SizedBox(
                height: 12.0,
              ),

              /// House name
              TextFormField(
                controller: _caseyearController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(hintText: "Case Year"),
              ),

              const SizedBox(
                height: 12.0,
              ),
              /// House name
              TextFormField(
              controller: _petitionernameController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: "Petitioner Name"),
              ),

              const SizedBox(
              height: 12.0,
              ),
              /// House name
              TextFormField(
              controller: _petitionerpaternaltitleController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: "Petitioner Paternal Title"),
              ),

              const SizedBox(
              height: 12.0,
              ),

              /// House name
              TextFormField(
              controller: _petitionerpaternalnameController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: "Petitioner Paternal Name"),
              ),

              const SizedBox(
              height: 12.0,
              ),

              /// House name
              TextFormField(
              controller: _paternaladdressController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: "Petitioner Address"),
              ),

              const SizedBox(
              height: 12.0,
              ),

              /// House name
              TextFormField(
              controller: _respondentnameController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: "Respondent Name"),
              ),

              const SizedBox(
              height: 12.0,
              ),

              /// House name
              TextFormField(
              controller: _respondentaddressController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: "Respondent Address"),
              ),

              const SizedBox(
              height: 12.0,
              ),

              /// House name
              TextFormField(
              controller: _dateController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: "Date"),
              ),

              const SizedBox(
              height: 12.0,
              ),



  MaterialButton(
                  child: const Text(
                    'Add Case Details',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    await widget.provider.addDetail(
                        _courtnameController.text, _casetypeController.text,_casenumberController.text,_caseyearController.text,_petitionernameController.text,_petitionerpaternaltitleController.text,_petitionerpaternalnameController.text,_paternaladdressController.text,_respondentnameController.text,_respondentaddressController.text,_dateController.text);
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
}