class MedicineModel {
  late String name;
  late String contraindications;
  late String info;
  late String effects;
  late String age;
  late String uses;

  MedicineModel(Map<String, dynamic> map) {
    contraindications =
        map['Contraindications to the use of medicine'].toString();
    info = map['Medicine information'].toString();
    effects = map['Side effects'].toString();
    age = map['The age group'].toString();
    uses = map['Uses of medicine'].toString();
  }

  setName(String value) {
    name = value;
  }

  String getName() {
    return name;
  }

  Map<String, String> toMap() {
    return {
      'Contraindications to the use of medicine': contraindications,
      'Medicine information': info,
      'Side effects': effects,
      'The age group': age,
      'Uses of medicine': uses,
    };
  }

  Map<String, String> toViewMap() {
    return {
      'Name': name,
      'Contraindications': contraindications,
      'Information': info,
      'Side effects': effects,
      'Age': age,
      'Uses': uses,
    };
  }
}
