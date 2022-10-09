class CrpcForm{

   String court_name;
   String case_type;
   String case_no;
   String case_year;
   String petitioner_name;
   String petitioner_paternal_title;
   String petitioner_paternal_name;
   String petitioner_address;
   String respondent_name;
   String respondent_address;
   String date;

  CrpcForm(this.court_name, this.case_type, this.case_no, this.case_year, this.petitioner_name, this.petitioner_paternal_title, this.petitioner_paternal_name, this.petitioner_address, this.respondent_name, this.respondent_address, this.date);

  factory CrpcForm.fromJson(dynamic json){
  return CrpcForm("${json['court_name']}", "${json['case_type']}",
  "${json['case_no']}", "${json['case_year']}", "${json['petitioner_name']}", "${json['petitioner_paternal_title']}",
  "${json['petitioner_paternal_name']}", "${json['petitioner_address']}", "${json['respondent_name']}",
  "${json['respondent_address']}", "${json['date']}");
  }

  Map toJson() => {

    'court name': court_name,
    'case type': case_type,
    'case no': case_no,
    'case_year': case_year,
    'petitioner name': petitioner_name,
    'petitioner paternal title':petitioner_paternal_title,
    'petitioner paternal name':petitioner_paternal_name,
    'petitioner address':petitioner_address,
    'respondent name':respondent_name,
    'respondent address':respondent_address,
    'date':date


  };

}