import 'package:flutter/material.dart';
import 'package:flutter_telugu/screens/auth/registration_screen.dart';
import 'package:flutter_telugu/screens/home_screen.dart';
import 'package:flutter_telugu/utils/styles.dart';
import 'package:flutter_telugu/utils/utils.dart';
import 'package:flutter_telugu/utils/validator.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();
  XFile? pickedXFile;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 200,
                  validator: (email) => Validator().validEmail(email ?? ""),
                  decoration: const InputDecoration(
                      hintText: "Enter email",
                      labelText: "Email",
                      counterText: "",
                      border: OutlineInputBorder()),
                ),
                formFeildPadding,
                TextFormField(
                  maxLength: 200,
                  obscureText: showPassword,
                  onChanged: (value) {},
                  validator: (str) {
                    // null str != null
                    // "" str.isEmpty
                    if (str != null && str.isEmpty) {
                      return "Enter password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                      counterText: "",
                      suffixIcon: InkWell(
                          onTap: () {
                            showPassword = !showPassword;
                            updateState();
                          },
                          child: Icon(showPassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      border: const OutlineInputBorder()),
                ),
                formFeildPadding,
                ElevatedButton(
                    onPressed: () {
                      formValidation()();
                    },
                    child: const Text("Sign In")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => const RegistrationScreen()));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (builder) =>
                      //             const RegistrationScreen()));
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (builder) =>
                      //             const RegistrationScreen()));
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (builder) => const RegistrationScreen()),
                      //     (route) => false);
                    },
                    child: const Text("Don't have account?"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  formValidation() {
    if (_formKey.currentState!.validate()) {
      Utils.showSnackbar(context, "Logged in successfully.");
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (builder) => HomeScreen(
      //               email: emailTextEditingController.text,
      //             )),
      //     (route) => false);
      //  Navigator.pushNamedAndRemoveUntil(
      //     context, HomeScreen.routeName, (route) => false,
      //     arguments: emailTextEditingController.text);
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false,
          arguments: [emailTextEditingController.text]);
    } else {}
  }

  updateState() {
    setState(() {});
  }
}
