import 'package:json_annotation/json_annotation.dart';
part '../response//responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponses {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;
  CustomerResponses(this.id, this.name, this.numOfNotifications);

  // from Json
  factory CustomerResponses.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponsesFromJson(json);
  // to Json
  Map<String, dynamic> toJson() => _$CustomerResponsesToJson(this);
}

@JsonSerializable()
class ContactsResponses {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  ContactsResponses(this.phone, this.email, this.link);

  // from Json
  factory ContactsResponses.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponsesFromJson(json);
  // to Json
  Map<String, dynamic> toJson() => _$ContactsResponsesToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponses? customer;
  @JsonKey(name: "contacts")
  ContactsResponses? contacts;

  AuthenticationResponse(this.customer, this.contacts);

  // from Json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  // to Json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
