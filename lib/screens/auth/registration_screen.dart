import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_telugu/utils/styles.dart';
import 'package:flutter_telugu/utils/utils.dart';
import 'package:flutter_telugu/utils/validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();
  XFile? pickedXFile;

  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  @override
  void initState() {
    userNameTextEditingController.text = "fragm_sai";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registation")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    pickedXFile = await imagePicker.pickImage(
                        source: ImageSource.gallery, imageQuality: 50);
                    if (pickedXFile != null) {
                      // ignore: use_build_context_synchronously
                      Utils.showSnackbar(context, "Picked image");
                    } else {
                      // ignore: use_build_context_synchronously
                      Utils.showSnackbar(context, "Image not picked");
                    }
                    setState(() {});
                  },
                  child: const Text("Pick Image"),
                ),
                if (pickedXFile != null)
                  Image.file(
                    File(pickedXFile!.path),
                    width: 100,
                    height: 100,
                  ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: userNameTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 200,
                  onChanged: (value) {},
                  validator: (value) =>
                      Validator().usernameValidator(value ?? ""),
                  // validator: (value) {
                  //   if (value!.isEmpty || value.length < 4) {
                  //     return "Enter valid username";
                  //   }else if (value.contains("@") || value.contains("!") || value.contains("!")) {
                  //     return "should not contain special characters.";
                  //   }
                  //   return null;
                  // },
                  decoration: const InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                      counterText: "",
                      border: OutlineInputBorder()),
                ),
                formFeildPadding,
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
                  controller: phoneTextEditingController,
                  keyboardType: TextInputType.phone,
                  maxLength: 15,
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter phone number";
                    }
                    if (value.length < 10) {
                      return "Phone number must be 10 chars";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter phone number",
                      labelText: "Phone Number",
                      counterText: "",
                      border: OutlineInputBorder()),
                ),
                formFeildPadding,
                // TextField(
                //   onChanged: (){},
                //   validation
                // ),
                TextFormField(
                  maxLength: 200,
                  obscureText: showPassword,
                  onChanged: (value) {
                    print("valuevalue  $value");
                  },
                  validator: (str) {
                    // if(str.cin)
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
                    onPressed: showPassword
                        ? null
                        : () {
                            normalValidation();
                          },
                    child: const Text("Sign Up")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  formValidation() {
    if (_formKey.currentState!.validate()) {
      Utils.showSnackbar(context, "All is good, form validated");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("All is good, form validated")));
    } else {
      Utils.showSnackbar(context, "Failed to validate form");
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text("Failed to validate form")));
    }
  }

  normalValidation() {
    
   //int price = int.parse(phoneTextEditingController.text);
    if (userNameTextEditingController.text.isEmpty ||
        userNameTextEditingController.text.length < 4) {
      Utils.showToast("Enter valid username");
    } else if (Validator().validEmail(emailTextEditingController.text) !=
        null) {
      Utils.showToast("Enter valid email");
    } else {
      // data successed
    }
  }

  updateState() {
    setState(() {});
  }
}
