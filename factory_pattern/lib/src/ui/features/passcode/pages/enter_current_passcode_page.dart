import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../../passcode.dart';
import '../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../../../../app/localization/i_localization.dart';
import '../../../../app/theme/colors/number_panel_color_impl.dart';
import '../../../widgets/delete_icon.dart';
import '../widgets/task_text.dart';
import 'adapters/passcode_adapter_with_animation.dart';

class EnterCurrentPasscodePage extends StatelessWidget {
  const EnterCurrentPasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: _BackButton(),
          ),
          const SizedBox(height: 22),
          const _TaskTextView(),
          const SizedBox(height: 22),
          const PasscodeAdapterWithAnimation(),
          const SizedBox(height: 52),
          NumberPanel(
            passcodeLength: UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength,
            deleteIcon: const DeleteIcon(),
            colors: NumberPanelColorImpl(),
          ),
        ],
      ),
    );
  }
}

class _TaskTextView extends StatelessWidget {
  const _TaskTextView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<PasscodeBloc, PasscodeState>(builder: (context, passcodeState) {
      final localization = UIServiceLocator.instance.get<ILocalization>();
      return passcodeState.passcodeResult == PasscodeResult.passcodeNotMatches
          ? TaskText(text: localization.passcodeEnteredIncorrectly, hasErrorStyle: true)
          : TaskText(text: localization.enterCurrentPasscode);
    });
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return TextButton(
      child: const Text('Отмена'),
      onPressed: () {
        throw UnimplementedError();
      },
    );
  }
}