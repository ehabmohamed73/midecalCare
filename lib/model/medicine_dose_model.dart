class MedicineDoseModel {
  String generatedID = "";
  String userID = "";
  String medicineName = "";
  int doseCount = 0;
  int takenDoses = 0;
  String doseTime = "";
  String notificationDate;

  MedicineDoseModel(
    this.generatedID,
    this.userID,
    this.medicineName,
    this.doseCount,
    this.doseTime,
    this.takenDoses,
    this.notificationDate,
  );

  // set setID(String value) => generatedID = value;

  // get getID => generatedID;

  Map<String, dynamic> toMap() {
    return {
      "user_id": userID,
      "medicine_name": medicineName,
      "dose_count": doseCount,
      "taken_dose": takenDoses,
      'dose_time': doseTime,
      'notification_date': notificationDate,
    };
  }

  fromMap(Map<String, dynamic> map) {
    userID = map['user_id'].toString();
    medicineName = map['medicine_name'].toString();
    doseCount = map['dose_count'];
    doseTime = map['dose_time'].toString();
    takenDoses = map['taken_dose'];
    notificationDate = map['notification_date'];
  }
}
