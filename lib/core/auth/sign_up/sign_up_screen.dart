import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_learning_app/component.dart';
import 'package:e_commerce_learning_app/core/auth/controller/auth_controller.dart';
import 'package:e_commerce_learning_app/core/auth/sign_up/sign_up_model.dart';
import 'package:e_commerce_learning_app/core/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../translator/strings.g.dart';

@RoutePage()
class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final TextEditingController confirmPasswordController =TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>(); //مهم للفورم

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.signup.title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // spacing: 16.0,
            children: [
              Text(
                t.signup.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                t.signup.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20.0),
              Inputfield(
                label: t.signup.username,
                hint: t.signup.usernameHint,
                controller: usernameController,
              ),
              SizedBox(height: 10.0),
              Inputfield(
                label: t.signup.name,
                hint: t.signup.nameHint,
                controller: nameController,
              ),
              SizedBox(height: 10.0),

              Inputfield(
                label: t.signup.email,
                hint: t.signup.emailHint,
                controller: emailController,
              ),
              SizedBox(height: 10.0),

              Inputfield(
                label: t.signup.phone,
                hint: t.signup.phoneHint,
                controller: phoneController,
              ),
              SizedBox(height: 10.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.signup.password,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    // textAlign: TextAlign.end,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: t.signup.passwordHint,
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ادخل كلمه المرور ';
                      }
                      if (value.length < 8) {
                        return "كلمه المرور اقل شي 8";
                      }
                      return null;
                    },
                  ),
                ],
              ),

              SizedBox(height: 20.0),
              FilledButton(
                onPressed: () async {
                  if (!formkey.currentState!.validate()) {
                    return;
                  }
                  await ref
                      .read(authControllerProvider.notifier)
                      .signUp(
                        SignUpModel(
                          username: usernameController.text,
                          password: passwordController.text,
                          name: nameController.text, // الاسم قبل الايميل
                          email: emailController.text,
                          phone: phoneController.text,
                          avatar: null,
                        ),
                      );
                  if (context.mounted) {
                    context.router.replace(const HomeRoute());
                  }
                },
                child: const Text('المواصله'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
