import 'package:clean_architecture_with_mvvm/app/constants.dart';
import 'package:clean_architecture_with_mvvm/data/response/responses.dart';
import 'package:clean_architecture_with_mvvm/domain/model/models.dart';
import 'package:clean_architecture_with_mvvm/app/extensions.dart';

extension CustomerResponseMapper on CustomerResponses? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.empty,
        this?.name.orEmpty() ?? Constants.empty,
        this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactsResponseMapper on ContactsResponses? {
  Contacts toDomain() {
    return Contacts(
        this?.phone.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}
