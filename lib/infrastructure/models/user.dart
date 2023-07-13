import 'dart:convert';

import 'package:isar/isar.dart';

part 'user.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@Collection()
class User {
  User({
    this.companyId,
    this.userId,
    this.loginId,
    this.firstName,
    this.lastName,
    this.userDepartmentId,
    this.userDepartmentName,
    this.mobileNo,
    this.emailId,
    this.userPassword,
    this.passwordHash,
    this.otpCode,
    this.otpValidUntil,
    this.imagePath,
    this.genderId,
    this.genderName,
    this.userRoleId,
    this.userRoleName,
    this.userStatusId,
    this.userStatusName,
    this.lastLoginTime,
    this.lastLoginIp,
    this.isActive,
    this.isDeleted,
    this.entryBy,
    this.entryDate,
    this.modifiedBy,
    this.modifiedAt,
    this.isPassCreationAllowed,
    this.fcmToken,
  });

  Id id = Isar.autoIncrement;
  int? companyId;
  int? userId;
  String? loginId;
  String? firstName;
  String? lastName;
  int? userDepartmentId;
  String? userDepartmentName;
  String? mobileNo;
  String? emailId;
  String? userPassword;
  String? passwordHash;
  String? otpCode;
  String? otpValidUntil;
  String? imagePath;
  int? genderId;
  String? genderName;
  int? userRoleId;
  String? userRoleName;
  int? userStatusId;
  String? userStatusName;
  String? lastLoginTime;
  @ignore
  dynamic lastLoginIp;
  bool? isActive;
  bool? isDeleted;
  int? entryBy;
  String? entryDate;
  int? modifiedBy;
  String? modifiedAt;
  bool? isPassCreationAllowed;
  String? fcmToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        companyId: json["CompanyID"],
        userId: json["UserID"],
        loginId: json["LoginID"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        userDepartmentId: json["UserDepartmentID"],
        userDepartmentName: json["UserDepartmentName"],
        mobileNo: json["mobileNo"],
        emailId: json["emailID"],
        userPassword: json["userPassword"],
        passwordHash: json["passwordHash"],
        otpCode: json["otpCode"],
        otpValidUntil: json["otpValidUntil"],
        imagePath: json["imagePath"],
        genderId: json["GenderID"],
        genderName: json["GenderName"],
        userRoleId: json["UserRoleID"],
        userRoleName: json["UserRoleName"],
        userStatusId: json["UserStatusID"],
        userStatusName: json["UserStatusName"],
        lastLoginTime: json["lastLoginTime"],
        lastLoginIp: json["lastLoginIP"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        entryBy: json["EntryBy"],
        entryDate: json["EntryDate"],
        modifiedBy: json["ModifiedBy"],
        modifiedAt: json["ModifiedAt"],
        isPassCreationAllowed: json["IsPassCreationAllowed"],
        fcmToken: json["fcmToken"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyID": companyId,
        "UserID": userId,
        "LoginID": loginId,
        "firstName": firstName,
        "lastName": lastName,
        "UserDepartmentID": userDepartmentId,
        "UserDepartmentName": userDepartmentName,
        "mobileNo": mobileNo,
        "emailID": emailId,
        "userPassword": userPassword,
        "passwordHash": passwordHash,
        "otpCode": otpCode,
        "otpValidUntil": otpValidUntil,
        "imagePath": imagePath,
        "GenderID": genderId,
        "GenderName": genderName,
        "UserRoleID": userRoleId,
        "UserRoleName": userRoleName,
        "UserStatusID": userStatusId,
        "UserStatusName": userStatusName,
        "lastLoginTime": lastLoginTime,
        "lastLoginIP": lastLoginIp,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "EntryBy": entryBy,
        "EntryDate": entryDate,
        "ModifiedBy": modifiedBy,
        "ModifiedAt": modifiedAt,
        "IsPassCreationAllowed": isPassCreationAllowed,
        "fcmToken": fcmToken,
      };

  User copyWith({
    required Id id,
    int? companyId,
    int? userId,
    String? loginId,
    String? firstName,
    String? lastName,
    int? userDepartmentId,
    String? userDepartmentName,
    String? mobileNo,
    String? emailId,
    String? userPassword,
    String? passwordHash,
    String? otpCode,
    String? otpValidUntil,
    String? imagePath,
    int? genderId,
    String? genderName,
    int? userRoleId,
    String? userRoleName,
    int? userStatusId,
    String? userStatusName,
    String? lastLoginTime,
    dynamic lastLoginIp,
    bool? isActive,
    bool? isDeleted,
    int? entryBy,
    String? entryDate,
    int? modifiedBy,
    String? modifiedAt,
    bool? isPassCreationAllowed,
    String? fcmToken,
  }) {
    return User(
      companyId: companyId ?? this.companyId,
      userId: userId ?? this.userId,
      loginId: loginId ?? this.loginId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userDepartmentId: userDepartmentId ?? this.userDepartmentId,
      userDepartmentName: userDepartmentName ?? this.userDepartmentName,
      mobileNo: mobileNo ?? this.mobileNo,
      emailId: emailId ?? this.emailId,
      userPassword: userPassword ?? this.userPassword,
      passwordHash: passwordHash ?? this.passwordHash,
      otpCode: otpCode ?? this.otpCode,
      otpValidUntil: otpValidUntil ?? this.otpValidUntil,
      imagePath: imagePath ?? this.imagePath,
      genderId: genderId ?? this.genderId,
      userRoleId: userRoleId ?? this.userRoleId,
      userRoleName: userRoleName ?? this.userRoleName,
      userStatusId: userStatusId ?? this.userStatusId,
      userStatusName: userStatusName ?? this.userStatusName,
      lastLoginTime: lastLoginTime ?? this.lastLoginTime,
      lastLoginIp: lastLoginIp ?? this.lastLoginIp,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
      entryBy: entryBy ?? this.entryBy,
      entryDate: entryDate ?? this.entryDate,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      isPassCreationAllowed: isPassCreationAllowed ?? this.isPassCreationAllowed,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}
