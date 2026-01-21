import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_learning_app/component.dart';
import 'package:e_commerce_learning_app/core/auth/controller/sign_up_controller.dart';
import 'package:e_commerce_learning_app/core/auth/sign_up/sign_up_model.dart';
import 'package:e_commerce_learning_app/core/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    ref.listen(signUpControllerProvider, (previous, next) {
      if (next.isSuccess) {
        context.router.replace(const HomeRoute());
      }

      if (next.error != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(' إنشاء حساب جديد '), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // spacing: 16.0,
            children: [
              Text(
                'انشاء حساب جديد',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),

              Inputfield(
                label: 'اسم المستخدم',
                hint: 'على سبيل المثال احمد محمد ',
                controller: usernameController,
              ),
              Inputfield(
                label: 'الاسم ',
                hint: 'على سبيل المثال احمد محمد ',
                controller: nameController,
              ),
              Inputfield(
                label: 'الايميل ',
                hint: 'boone@raza.net ',
                controller: emailController,
              ),
              Inputfield(
                label: 'رقم الهاتف ',
                hint: '+44 0776527762 ',
                controller: phoneController,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'كلمه المرور',
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
                      hintText: ' ادحل كلمة المرور لحسابك',
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
                      .read(signUpControllerProvider.notifier)
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
