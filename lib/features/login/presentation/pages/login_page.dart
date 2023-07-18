import 'package:diyo_pos/features/home/presentation/pages/home_page.dart';
import 'package:diyo_pos/features/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIYO APP'),
      ),
      body: const FractionallySizedBox(widthFactor: 1, child: PinputExample()),
    );
  }
}

class Formatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length <= 3) {
      return oldValue;
    }
    return newValue;
  }
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  late final TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController(text: '1234');
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pinController,
      length: 10,
      toolbarEnabled: false,
      inputFormatters: [Formatter()],
    );
  }
}

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class PinputExample extends StatefulWidget {
  const PinputExample({Key? key}) : super(key: key);

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 8.0,
            behavior: SnackBarBehavior.floating,
            content: Text(state.message),
            backgroundColor: Colors.red,
          ));
        }

        if (state is LoginLoggedIn) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            elevation: 8.0,
            behavior: SnackBarBehavior.floating,
            content: Text('Login success!'),
            backgroundColor: Colors.blue,
          ));
          context.go(HomePage.routeName);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Enter PIN'),
              const SizedBox(height: 30),
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: pinController,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  obscureText: true, // Set obscureText menjadi true
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  onSubmitted: (value) {
                    context
                        .read<LoginBloc>()
                        .add(LoginWithPin(pin: pinController.text));
                  },
                  validator: (value) {
                    return null;
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                    context
                        .read<LoginBloc>()
                        .add(LoginWithPin(pin: pinController.text));
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // TextButton(
              //   onPressed: () {
              //     focusNode.unfocus();
              //     formKey.currentState!.validate();
              //     if (pinController.text == '1234') {
              //       context.go('/home');
              //     }
              //   },
              //   child: const Text('Validate'),
              // ),
            ],
          ),
        );
      },
    );
  }
}
