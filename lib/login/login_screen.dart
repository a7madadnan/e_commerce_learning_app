import 'package:e_commerce_learning_app/login/login_model.dart';
import 'package:e_commerce_learning_app/sign_up/sign_up_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // هذا المتغير لا يمكن اعاده تعيينه بعد انشائه
  // يستخدم للتحكم في textfield
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formkey =GlobalKey<FormState>(); //مهم للفورم 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child:Form(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'البريد الالكتروني',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress, //aprove just email
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'ادخل بريدك الالكتروني',
                    hintStyle: TextStyle(fontSize: 12),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/icons.svg',
                        width: 24,
                        height: 24 ,
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
                  controller: passwordController,
                  obscureText: true, //كلمه المرور مخفيه
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: ' ادحل كلمة المرور لحسابك',
                    hintStyle: TextStyle(fontSize: 14),
                  ),

                  validator :(value){
                  if(value ==null || value.isEmpty){
                    return 'ادخل كلمه المرور ';
                  }
                   if(value.length < 8){
                    return "كلمه المرور اقل شي 8";
                   }
                   return null;
                }
                ),
                
              ],
            ),
             
            FilledButton(
              onPressed: () {
                final loginModel = LoginModel(
                  emailController.text,
                  passwordController.text,
                );

                print(loginModel.toJson());
              },
              child: Text('تسجيل الدخول'),
            ),

            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return signUpscreen();
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
