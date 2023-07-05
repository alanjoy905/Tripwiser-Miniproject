import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantsRecord extends FirestoreRecord {
  RestaurantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "HName" field.
  String? _hName;
  String get hName => _hName ?? '';
  bool hasHName() => _hName != null;

  // "HImage" field.
  String? _hImage;
  String get hImage => _hImage ?? '';
  bool hasHImage() => _hImage != null;

  // "HDir" field.
  String? _hDir;
  String get hDir => _hDir ?? '';
  bool hasHDir() => _hDir != null;

  // "Place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  // "VegOrNon_veg" field.
  String? _vegOrNonVeg;
  String get vegOrNonVeg => _vegOrNonVeg ?? '';
  bool hasVegOrNonVeg() => _vegOrNonVeg != null;

  void _initializeFields() {
    _hName = snapshotData['HName'] as String?;
    _hImage = snapshotData['HImage'] as String?;
    _hDir = snapshotData['HDir'] as String?;
    _place = snapshotData['Place'] as String?;
    _vegOrNonVeg = snapshotData['VegOrNon_veg'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantsRecord.fromSnapshot(s));

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantsRecord.fromSnapshot(s));

  static RestaurantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantsRecordData({
  String? hName,
  String? hImage,
  String? hDir,
  String? place,
  String? vegOrNonVeg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'HName': hName,
      'HImage': hImage,
      'HDir': hDir,
      'Place': place,
      'VegOrNon_veg': vegOrNonVeg,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantsRecordDocumentEquality implements Equality<RestaurantsRecord> {
  const RestaurantsRecordDocumentEquality();

  @override
  bool equals(RestaurantsRecord? e1, RestaurantsRecord? e2) {
    return e1?.hName == e2?.hName &&
        e1?.hImage == e2?.hImage &&
        e1?.hDir == e2?.hDir &&
        e1?.place == e2?.place &&
        e1?.vegOrNonVeg == e2?.vegOrNonVeg;
  }

  @override
  int hash(RestaurantsRecord? e) => const ListEquality()
      .hash([e?.hName, e?.hImage, e?.hDir, e?.place, e?.vegOrNonVeg]);

  @override
  bool isValidKey(Object? o) => o is RestaurantsRecord;
}
