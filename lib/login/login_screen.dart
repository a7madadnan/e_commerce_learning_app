import 'package:e_commerce_learning_app/core/local_storage_service.dart';
import 'package:e_commerce_learning_app/core/network/dio.dart';
import 'package:e_commerce_learning_app/core/repo/auth_repo.dart';
import 'package:e_commerce_learning_app/home/view/home_screen.dart';
import 'package:e_commerce_learning_app/login/login_model.dart';
import 'package:e_commerce_learning_app/sign_up/sign_up_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // هذا المتغير لا يمكن اعاده تعيينه بعد انشائه
  // يستخدم للتحكم في textfield
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>(); //مهم للفورم
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formkey, //ربط الفورم
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              Text(
                ' ! مرحبا بعودتك ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 5.0),

              SvgPicture.asset('assets/icons/lock.svg', width: 24, height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'اسمك',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: userNameController,
                    textAlign: TextAlign.right,

                    decoration: InputDecoration(
                      hintText: 'ادخل اسمك',
                      hintStyle: TextStyle(fontSize: 12),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/icons.svg',
                          width: 24,
                          height: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordController,
                    obscureText: true, //كلمه المرور مخفيه
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: ' ادحل كلمة المرور لحسابك',
                      hintStyle: TextStyle(fontSize: 14),
                    ),

                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'ادخل كلمه الممرور',
                      ),
                      FormBuilderValidators.minLength(
                        8,
                        errorText: 'اقل عدد مسموح 8',
                      ),
                    ]),
                  ),
                ],
              ),

              FilledButton(
                onPressed: () async {
                  if (!formkey.currentState!.validate()) {
                    return;
                  }
                  final AuthRepo authRepo = AuthRepo(
                    dio: dio,
                    localStorageService: ref.read(localstorageServiceProvider),
                  );

                  final user = await authRepo.login(
                    LoginModel(
                      userNameController.text,
                      passwordController.text,
                    ),
                  );
                  if (context.mounted) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },

                // Navigate to home screen after successful login
                child: Text('تسجيل الدخول'),
              ),

              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
                child: Text('إنشاء حساب'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
