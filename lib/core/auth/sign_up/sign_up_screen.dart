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
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>(); //مهم للفورم
  @override
  Widget build(BuildContext context) {
   
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
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Text(
              //       'اسم المستخدم',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     SizedBox(height: 8.0),
              //     TextFormField(
              //       controller: emailController,
              //       textAlign: TextAlign.right,
              //       decoration: InputDecoration(
              //         hintText: 'على سبيل المثال احمد محمد',
              //         hintStyle: TextStyle(fontSize: 12),
              //       ),
              //     ),
              //   ],
              // ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'تكرار كلمه المرور',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true, //كلمه المرور مخفيه
                    // textAlign: TextAlign.right,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: ' كرر كلمه المرور',
                      hintStyle: TextStyle(fontSize: 14),
                    ),

                    validator: (value) {
                      if(value != passwordController.text){
                        return 'كلمه المرور غير متطابقه';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              FilledButton(
                onPressed: () async {
                  if(!formkey.currentState!.validate()){
                     return;
                  }
                  await ref
                     .read(signUpControllerProvider.notifier)
                     .signUp(
                      SignUpModel(usernameController.text, passwordController.text)
                     );
                     if(context.mounted){
                       context.router.replace(const HomeRoute());
                     }
                },
                child: const Text('المواصله') ,
                // onPressed: signUpState.isLoading
                // ? null
                // :() {
                //   if (formkey.currentState!.validate()){
                //     ref.read(signUpControllerProvider.notifier).signUp(
                //       SignUpModel(
                //       usernameController.text,
                //       passwordController.text
                //       )
                //     );
                 

                  // final signUpModel = SignUpModel(
                  //   usernameController.text,
                  //   passwordController.text,
                  // );
             
              //  const Text('المواصله'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
