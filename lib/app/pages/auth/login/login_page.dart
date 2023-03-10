import 'package:delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:delivery_app/app/pages/auth/login/login_controller.dart';
import 'package:delivery_app/app/pages/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          inital: () => hideLoader(),
          login: () => showLoader(),
          success: () {
            hideLoader();
            Navigator.pop(context, true);
          },
          any: () {
            hideLoader();
            showError(state.errorMessage ?? '');
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textStyles.textTitle,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        controller: emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Email obrigat??rio'),
                          Validatorless.email('Email inv??lido'),
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                        controller: passwordEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Senha obrigat??rio'),
                        ]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: DeliveryButton(
                          width: double.infinity,
                          label: 'ENTRAR',
                          onPressed: () {
                            final isValid =
                                formKey.currentState?.validate() ?? false;
                            if (isValid) {
                              controller.login(emailEC.text, passwordEC.text);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('N??o possui uma conta'),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/auth/register');
                          },
                          child: Text(
                            'Cadastre-se',
                            style: context.textStyles.textBold
                                .copyWith(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
