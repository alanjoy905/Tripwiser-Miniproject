import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerifiedOwnersDetailsRecord extends FirestoreRecord {
  VerifiedOwnersDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "HotelServiceName" field.
  String? _hotelServiceName;
  String get hotelServiceName => _hotelServiceName ?? '';
  bool hasHotelServiceName() => _hotelServiceName != null;

  // "RoomImages" field.
  String? _roomImages;
  String get roomImages => _roomImages ?? '';
  bool hasRoomImages() => _roomImages != null;

  // "IsVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "Rateperday" field.
  int? _rateperday;
  int get rateperday => _rateperday ?? 0;
  bool hasRateperday() => _rateperday != null;

  // "HotelRoomsAvailableNumber" field.
  int? _hotelRoomsAvailableNumber;
  int get hotelRoomsAvailableNumber => _hotelRoomsAvailableNumber ?? 0;
  bool hasHotelRoomsAvailableNumber() => _hotelRoomsAvailableNumber != null;

  // "HotelAddress" field.
  String? _hotelAddress;
  String get hotelAddress => _hotelAddress ?? '';
  bool hasHotelAddress() => _hotelAddress != null;

  // "SelectedRoomCount" field.
  int? _selectedRoomCount;
  int get selectedRoomCount => _selectedRoomCount ?? 0;
  bool hasSelectedRoomCount() => _selectedRoomCount != null;

  // "OwnerPhoneNumberr" field.
  int? _ownerPhoneNumberr;
  int get ownerPhoneNumberr => _ownerPhoneNumberr ?? 0;
  bool hasOwnerPhoneNumberr() => _ownerPhoneNumberr != null;

  void _initializeFields() {
    _hotelServiceName = snapshotData['HotelServiceName'] as String?;
    _roomImages = snapshotData['RoomImages'] as String?;
    _isVerified = snapshotData['IsVerified'] as bool?;
    _rateperday = castToType<int>(snapshotData['Rateperday']);
    _hotelRoomsAvailableNumber =
        castToType<int>(snapshotData['HotelRoomsAvailableNumber']);
    _hotelAddress = snapshotData['HotelAddress'] as String?;
    _selectedRoomCount = castToType<int>(snapshotData['SelectedRoomCount']);
    _ownerPhoneNumberr = castToType<int>(snapshotData['OwnerPhoneNumberr']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('VerifiedOwnersDetails');

  static Stream<VerifiedOwnersDetailsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => VerifiedOwnersDetailsRecord.fromSnapshot(s));

  static Future<VerifiedOwnersDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VerifiedOwnersDetailsRecord.fromSnapshot(s));

  static VerifiedOwnersDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VerifiedOwnersDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerifiedOwnersDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerifiedOwnersDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VerifiedOwnersDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VerifiedOwnersDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVerifiedOwnersDetailsRecordData({
  String? hotelServiceName,
  String? roomImages,
  bool? isVerified,
  int? rateperday,
  int? hotelRoomsAvailableNumber,
  String? hotelAddress,
  int? selectedRoomCount,
  int? ownerPhoneNumberr,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'HotelServiceName': hotelServiceName,
      'RoomImages': roomImages,
      'IsVerified': isVerified,
      'Rateperday': rateperday,
      'HotelRoomsAvailableNumber': hotelRoomsAvailableNumber,
      'HotelAddress': hotelAddress,
      'SelectedRoomCount': selectedRoomCount,
      'OwnerPhoneNumberr': ownerPhoneNumberr,
    }.withoutNulls,
  );

  return firestoreData;
}

class VerifiedOwnersDetailsRecordDocumentEquality
    implements Equality<VerifiedOwnersDetailsRecord> {
  const VerifiedOwnersDetailsRecordDocumentEquality();

  @override
  bool equals(
      VerifiedOwnersDetailsRecord? e1, VerifiedOwnersDetailsRecord? e2) {
    return e1?.hotelServiceName == e2?.hotelServiceName &&
        e1?.roomImages == e2?.roomImages &&
        e1?.isVerified == e2?.isVerified &&
        e1?.rateperday == e2?.rateperday &&
        e1?.hotelRoomsAvailableNumber == e2?.hotelRoomsAvailableNumber &&
        e1?.hotelAddress == e2?.hotelAddress &&
        e1?.selectedRoomCount == e2?.selectedRoomCount &&
        e1?.ownerPhoneNumberr == e2?.ownerPhoneNumberr;
  }

  @override
  int hash(VerifiedOwnersDetailsRecord? e) => const ListEquality().hash([
        e?.hotelServiceName,
        e?.roomImages,
        e?.isVerified,
        e?.rateperday,
        e?.hotelRoomsAvailableNumber,
        e?.hotelAddress,
        e?.selectedRoomCount,
        e?.ownerPhoneNumberr
      ]);

  @override
  bool isValidKey(Object? o) => o is VerifiedOwnersDetailsRecord;
}
