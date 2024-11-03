// ignore: file_names
import 'package:flutter/material.dart';
import 'package:noteapp/features/HomePage/HomeUi.dart';
import '../../core/Shared/textfiledwidget.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

// ignore: camel_case_types
class _loginScreenState extends State<loginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: _decorationcontainer(),
        child: Center(
          child: Form(
            key: key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 140),
                  child: RichText(
                    text: const TextSpan(
                        text: 'Log in to HabitHUB\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffC67ED2),
                          fontSize: 20,
                          height: 1.9,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Welcome back! Sign in using your social \n",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                              text: "account or email to continue us",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                height: 1.2,
                              ))
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                contentText(
                  hint: 'Email',
                  controller: emailController,
                  cond: r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  returnCond: "please enter Email",
                ),
                const SizedBox(
                  height: 25,
                ),
                contentText(
                  hint: 'password',
                  controller: passwordController,
                  cond:
                      r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
                  returnCond: "please enter Password",
                ),
                const SizedBox(
                  height: 70,
                ),
                _getbuttom(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _decorationcontainer() {
    return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover));
  }

  Widget _getbuttom() {
    return Center(
      child: SizedBox(
          height: 55,
          width: 200,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 18,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              onPressed: () {
                if (key.currentState!.validate()) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                }
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ))),
    );
  }
}
