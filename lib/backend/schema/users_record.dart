import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "Age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "Image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "Role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "IsAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "OwnerName" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  bool hasOwnerName() => _ownerName != null;

  // "OwnerPhoneNumber" field.
  int? _ownerPhoneNumber;
  int get ownerPhoneNumber => _ownerPhoneNumber ?? 0;
  bool hasOwnerPhoneNumber() => _ownerPhoneNumber != null;

  // "OEmail" field.
  String? _oEmail;
  String get oEmail => _oEmail ?? '';
  bool hasOEmail() => _oEmail != null;

  // "OAddress" field.
  String? _oAddress;
  String get oAddress => _oAddress ?? '';
  bool hasOAddress() => _oAddress != null;

  // "HotelServiceName" field.
  String? _hotelServiceName;
  String get hotelServiceName => _hotelServiceName ?? '';
  bool hasHotelServiceName() => _hotelServiceName != null;

  // "HotelLicenseNumber" field.
  String? _hotelLicenseNumber;
  String get hotelLicenseNumber => _hotelLicenseNumber ?? '';
  bool hasHotelLicenseNumber() => _hotelLicenseNumber != null;

  // "HotelCertificate" field.
  String? _hotelCertificate;
  String get hotelCertificate => _hotelCertificate ?? '';
  bool hasHotelCertificate() => _hotelCertificate != null;

  // "RoomImages" field.
  String? _roomImages;
  String get roomImages => _roomImages ?? '';
  bool hasRoomImages() => _roomImages != null;

  // "RoomsAvailable" field.
  int? _roomsAvailable;
  int get roomsAvailable => _roomsAvailable ?? 0;
  bool hasRoomsAvailable() => _roomsAvailable != null;

  // "SelectedRoomsNumber" field.
  int? _selectedRoomsNumber;
  int get selectedRoomsNumber => _selectedRoomsNumber ?? 0;
  bool hasSelectedRoomsNumber() => _selectedRoomsNumber != null;

  // "Rooms" field.
  DocumentReference? _rooms;
  DocumentReference? get rooms => _rooms;
  bool hasRooms() => _rooms != null;

  // "SelectedRooms" field.
  DocumentReference? _selectedRooms;
  DocumentReference? get selectedRooms => _selectedRooms;
  bool hasSelectedRooms() => _selectedRooms != null;

  // "Rateperday" field.
  int? _rateperday;
  int get rateperday => _rateperday ?? 0;
  bool hasRateperday() => _rateperday != null;

  // "AvailableRooms" field.
  DocumentReference? _availableRooms;
  DocumentReference? get availableRooms => _availableRooms;
  bool hasAvailableRooms() => _availableRooms != null;

  // "District" field.
  String? _district;
  String get district => _district ?? '';
  bool hasDistrict() => _district != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _bio = snapshotData['Bio'] as String?;
    _age = castToType<int>(snapshotData['Age']);
    _image = getDataList(snapshotData['Image']);
    _city = snapshotData['City'] as String?;
    _role = snapshotData['Role'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _isAdmin = snapshotData['IsAdmin'] as bool?;
    _ownerName = snapshotData['OwnerName'] as String?;
    _ownerPhoneNumber = castToType<int>(snapshotData['OwnerPhoneNumber']);
    _oEmail = snapshotData['OEmail'] as String?;
    _oAddress = snapshotData['OAddress'] as String?;
    _hotelServiceName = snapshotData['HotelServiceName'] as String?;
    _hotelLicenseNumber = snapshotData['HotelLicenseNumber'] as String?;
    _hotelCertificate = snapshotData['HotelCertificate'] as String?;
    _roomImages = snapshotData['RoomImages'] as String?;
    _roomsAvailable = castToType<int>(snapshotData['RoomsAvailable']);
    _selectedRoomsNumber = castToType<int>(snapshotData['SelectedRoomsNumber']);
    _rooms = snapshotData['Rooms'] as DocumentReference?;
    _selectedRooms = snapshotData['SelectedRooms'] as DocumentReference?;
    _rateperday = castToType<int>(snapshotData['Rateperday']);
    _availableRooms = snapshotData['AvailableRooms'] as DocumentReference?;
    _district = snapshotData['District'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? bio,
  int? age,
  String? city,
  String? role,
  String? photoUrl,
  bool? isAdmin,
  String? ownerName,
  int? ownerPhoneNumber,
  String? oEmail,
  String? oAddress,
  String? hotelServiceName,
  String? hotelLicenseNumber,
  String? hotelCertificate,
  String? roomImages,
  int? roomsAvailable,
  int? selectedRoomsNumber,
  DocumentReference? rooms,
  DocumentReference? selectedRooms,
  int? rateperday,
  DocumentReference? availableRooms,
  String? district,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Bio': bio,
      'Age': age,
      'City': city,
      'Role': role,
      'photo_url': photoUrl,
      'IsAdmin': isAdmin,
      'OwnerName': ownerName,
      'OwnerPhoneNumber': ownerPhoneNumber,
      'OEmail': oEmail,
      'OAddress': oAddress,
      'HotelServiceName': hotelServiceName,
      'HotelLicenseNumber': hotelLicenseNumber,
      'HotelCertificate': hotelCertificate,
      'RoomImages': roomImages,
      'RoomsAvailable': roomsAvailable,
      'SelectedRoomsNumber': selectedRoomsNumber,
      'Rooms': rooms,
      'SelectedRooms': selectedRooms,
      'Rateperday': rateperday,
      'AvailableRooms': availableRooms,
      'District': district,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.bio == e2?.bio &&
        e1?.age == e2?.age &&
        listEquality.equals(e1?.image, e2?.image) &&
        e1?.city == e2?.city &&
        e1?.role == e2?.role &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.ownerName == e2?.ownerName &&
        e1?.ownerPhoneNumber == e2?.ownerPhoneNumber &&
        e1?.oEmail == e2?.oEmail &&
        e1?.oAddress == e2?.oAddress &&
        e1?.hotelServiceName == e2?.hotelServiceName &&
        e1?.hotelLicenseNumber == e2?.hotelLicenseNumber &&
        e1?.hotelCertificate == e2?.hotelCertificate &&
        e1?.roomImages == e2?.roomImages &&
        e1?.roomsAvailable == e2?.roomsAvailable &&
        e1?.selectedRoomsNumber == e2?.selectedRoomsNumber &&
        e1?.rooms == e2?.rooms &&
        e1?.selectedRooms == e2?.selectedRooms &&
        e1?.rateperday == e2?.rateperday &&
        e1?.availableRooms == e2?.availableRooms &&
        e1?.district == e2?.district;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.bio,
        e?.age,
        e?.image,
        e?.city,
        e?.role,
        e?.photoUrl,
        e?.isAdmin,
        e?.ownerName,
        e?.ownerPhoneNumber,
        e?.oEmail,
        e?.oAddress,
        e?.hotelServiceName,
        e?.hotelLicenseNumber,
        e?.hotelCertificate,
        e?.roomImages,
        e?.roomsAvailable,
        e?.selectedRoomsNumber,
        e?.rooms,
        e?.selectedRooms,
        e?.rateperday,
        e?.availableRooms,
        e?.district
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
