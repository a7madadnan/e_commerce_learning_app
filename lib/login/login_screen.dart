import 'package:e_commerce_learning_app/core/local_storage_service.dart';
import 'package:e_commerce_learning_app/core/network/dio.dart';
import 'package:e_commerce_learning_app/core/repo/auth_repo.dart';
import 'package:e_commerce_learning_app/home/view/home_screen.dart';
import 'package:e_commerce_learning_app/login/login_model.dart';
import 'package:e_commerce_learning_app/sign_up/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../translator/strings.g.dart';

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
  bool isPasswordHidden = true;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>(); //مهم للفورم
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.login.title), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: formkey, //ربط الفورم
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 10,
            children: [
              Text(
                t.login.welcomeBack,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                t.login.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),

              // SizedBox(height: 5.0),
              SvgPicture.asset('assets/icons/lock.svg', width: 24, height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.login.username,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: t.login.username,
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
              SizedBox(height: 1.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.login.password,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordController,
                    obscureText: isPasswordHidden, //كلمه المرور مخفيه
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: t.login.passwordHint,
                      hintStyle: TextStyle(fontSize: 14),

                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: t.login.errors.passwordRequired,
                      ),
                      FormBuilderValidators.minLength(
                        8,
                        errorText: t.login.errors.passwordMin,
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
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
                child: Text(t.login.title),
              ),
              SizedBox(height: 10.0),
             Center(child: 
               RichText(
                text: TextSpan(
                  text: t.login.noAccountText,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text:t.login.createAccountText,
                      style: TextStyle(color: Color(0xffFF6D38),
                      fontWeight: FontWeight.bold
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
             )
              // OutlinedButton(
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return SignUpScreen();
              //         },
              //       ),
              //     );
              //   },
              //   child: Text('إنشاء حساب'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
