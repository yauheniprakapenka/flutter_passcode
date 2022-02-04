import 'package:flutter/material.dart';

import '../../../../app/localization/i_localization.dart';
import '../../../../app/services/ui_service_locator.dart';
import 'builders/passcode_page_builder.dart';

class CreatePasscodePage extends StatelessWidget {
  const CreatePasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final localization = UIServiceLocator.instance.get<ILocalization>();
    return PasscodePageBuilder(
      taskText: localization.createPasscode,
      passcodeAdapterWithAnimation: false,
    );
  }
}
