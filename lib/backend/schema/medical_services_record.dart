import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicalServicesRecord extends FirestoreRecord {
  MedicalServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "HospitalName" field.
  String? _hospitalName;
  String get hospitalName => _hospitalName ?? '';
  bool hasHospitalName() => _hospitalName != null;

  // "PhoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "HospitalImage" field.
  String? _hospitalImage;
  String get hospitalImage => _hospitalImage ?? '';
  bool hasHospitalImage() => _hospitalImage != null;

  // "Direction" field.
  String? _direction;
  String get direction => _direction ?? '';
  bool hasDirection() => _direction != null;

  // "Place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  void _initializeFields() {
    _hospitalName = snapshotData['HospitalName'] as String?;
    _phoneNumber = snapshotData['PhoneNumber'] as String?;
    _hospitalImage = snapshotData['HospitalImage'] as String?;
    _direction = snapshotData['Direction'] as String?;
    _place = snapshotData['Place'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MedicalServices');

  static Stream<MedicalServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicalServicesRecord.fromSnapshot(s));

  static Future<MedicalServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicalServicesRecord.fromSnapshot(s));

  static MedicalServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicalServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicalServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicalServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicalServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicalServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicalServicesRecordData({
  String? hospitalName,
  String? phoneNumber,
  String? hospitalImage,
  String? direction,
  String? place,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'HospitalName': hospitalName,
      'PhoneNumber': phoneNumber,
      'HospitalImage': hospitalImage,
      'Direction': direction,
      'Place': place,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicalServicesRecordDocumentEquality
    implements Equality<MedicalServicesRecord> {
  const MedicalServicesRecordDocumentEquality();

  @override
  bool equals(MedicalServicesRecord? e1, MedicalServicesRecord? e2) {
    return e1?.hospitalName == e2?.hospitalName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.hospitalImage == e2?.hospitalImage &&
        e1?.direction == e2?.direction &&
        e1?.place == e2?.place;
  }

  @override
  int hash(MedicalServicesRecord? e) => const ListEquality().hash([
        e?.hospitalName,
        e?.phoneNumber,
        e?.hospitalImage,
        e?.direction,
        e?.place
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicalServicesRecord;
}
