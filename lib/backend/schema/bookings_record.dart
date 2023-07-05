import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  DocumentReference? _name;
  DocumentReference? get name => _name;
  bool hasName() => _name != null;

  // "startdate" field.
  DateTime? _startdate;
  DateTime? get startdate => _startdate;
  bool hasStartdate() => _startdate != null;

  // "enddate" field.
  DateTime? _enddate;
  DateTime? get enddate => _enddate;
  bool hasEnddate() => _enddate != null;

  // "SelectedRoomsCount" field.
  int? _selectedRoomsCount;
  int get selectedRoomsCount => _selectedRoomsCount ?? 0;
  bool hasSelectedRoomsCount() => _selectedRoomsCount != null;

  // "HotelRoomsAvailableNumber" field.
  DocumentReference? _hotelRoomsAvailableNumber;
  DocumentReference? get hotelRoomsAvailableNumber =>
      _hotelRoomsAvailableNumber;
  bool hasHotelRoomsAvailableNumber() => _hotelRoomsAvailableNumber != null;

  // "HotelName" field.
  DocumentReference? _hotelName;
  DocumentReference? get hotelName => _hotelName;
  bool hasHotelName() => _hotelName != null;

  // "HotelRating" field.
  DocumentReference? _hotelRating;
  DocumentReference? get hotelRating => _hotelRating;
  bool hasHotelRating() => _hotelRating != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['Name'] as DocumentReference?;
    _startdate = snapshotData['startdate'] as DateTime?;
    _enddate = snapshotData['enddate'] as DateTime?;
    _selectedRoomsCount = castToType<int>(snapshotData['SelectedRoomsCount']);
    _hotelRoomsAvailableNumber =
        snapshotData['HotelRoomsAvailableNumber'] as DocumentReference?;
    _hotelName = snapshotData['HotelName'] as DocumentReference?;
    _hotelRating = snapshotData['HotelRating'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Bookings')
          : FirebaseFirestore.instance.collectionGroup('Bookings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Bookings').doc();

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  DocumentReference? name,
  DateTime? startdate,
  DateTime? enddate,
  int? selectedRoomsCount,
  DocumentReference? hotelRoomsAvailableNumber,
  DocumentReference? hotelName,
  DocumentReference? hotelRating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'startdate': startdate,
      'enddate': enddate,
      'SelectedRoomsCount': selectedRoomsCount,
      'HotelRoomsAvailableNumber': hotelRoomsAvailableNumber,
      'HotelName': hotelName,
      'HotelRating': hotelRating,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.startdate == e2?.startdate &&
        e1?.enddate == e2?.enddate &&
        e1?.selectedRoomsCount == e2?.selectedRoomsCount &&
        e1?.hotelRoomsAvailableNumber == e2?.hotelRoomsAvailableNumber &&
        e1?.hotelName == e2?.hotelName &&
        e1?.hotelRating == e2?.hotelRating;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.startdate,
        e?.enddate,
        e?.selectedRoomsCount,
        e?.hotelRoomsAvailableNumber,
        e?.hotelName,
        e?.hotelRating
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
