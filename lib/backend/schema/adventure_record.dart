import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdventureRecord extends FirestoreRecord {
  AdventureRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "AdvName" field.
  String? _advName;
  String get advName => _advName ?? '';
  bool hasAdvName() => _advName != null;

  // "AdvImg" field.
  String? _advImg;
  String get advImg => _advImg ?? '';
  bool hasAdvImg() => _advImg != null;

  void _initializeFields() {
    _advName = snapshotData['AdvName'] as String?;
    _advImg = snapshotData['AdvImg'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('adventure');

  static Stream<AdventureRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdventureRecord.fromSnapshot(s));

  static Future<AdventureRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdventureRecord.fromSnapshot(s));

  static AdventureRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdventureRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdventureRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdventureRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdventureRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdventureRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdventureRecordData({
  String? advName,
  String? advImg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AdvName': advName,
      'AdvImg': advImg,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdventureRecordDocumentEquality implements Equality<AdventureRecord> {
  const AdventureRecordDocumentEquality();

  @override
  bool equals(AdventureRecord? e1, AdventureRecord? e2) {
    return e1?.advName == e2?.advName && e1?.advImg == e2?.advImg;
  }

  @override
  int hash(AdventureRecord? e) =>
      const ListEquality().hash([e?.advName, e?.advImg]);

  @override
  bool isValidKey(Object? o) => o is AdventureRecord;
}
