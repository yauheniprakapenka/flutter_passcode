
import '../../entities/passcode.dart';
import '../../entities/passcode_flow.dart';
import '../../entities/passcode_result.dart';
import '../../entities/passcode_use_case.dart';

class PasscodeState {
  final PasscodeFlow passcodeFlow;
  final PasscodeUseCase passcodeUseCase;
  final PasscodeResult passcodeResult;
  final Passcode passcode;

  const PasscodeState({
    required this.passcodeFlow,
    this.passcodeResult = PasscodeResult.passcodeEntring,
    required this.passcodeUseCase,
    this.passcode = const Passcode(),
  });

  PasscodeState copyWith({
    PasscodeFlow? passcodeFlow,
    PasscodeUseCase? passcodeUseCase,
    PasscodeResult? passcodeResult,
    Passcode? passcode,
  }) {
    return PasscodeState(
      passcodeFlow: passcodeFlow ?? this.passcodeFlow,
      passcodeUseCase: passcodeUseCase ?? this.passcodeUseCase,
      passcodeResult: passcodeResult ?? this.passcodeResult,
      passcode: passcode ?? this.passcode,
    );
  }
}