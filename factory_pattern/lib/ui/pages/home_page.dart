import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/config/i_password_panel_config.dart';
import '../../app/services/service_locator.dart';
import '../password_panels/number_panel/bloc/number_access_bloc/number_panel_bloc.dart';
import '../password_panels/number_panel/bloc/number_access_bloc/number_panel_state.dart';
import '../password_panels/number_panel/ui/number_panel.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final passwordLength =
        ServiceLocator.instance.get<IPasswordPanelConfig>().passwordLength;
    return Scaffold(
      body: BlocBuilder<NumberPanelBloc, NumberPanelState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextInfo(text: 'Введите ключ доступа'),
                const SizedBox(height: 22),
                PageIndicator(
                  indicatorLength: passwordLength,
                  activeIndicatorLength: state.currentPassword.length,
                ),
                const SizedBox(height: 52),
                const NumberPanel(),
                const SizedBox(height: 36),
                TextButton(
                  onPressed: () {
                    UnimplementedError('dsafa');
                  },
                  child: const Text(
                    'Войти по логину и паролю',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
