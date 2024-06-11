import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:softapper_tasks/models/user_model.dart';
import 'package:softapper_tasks/utility/auth_util.dart';
import 'package:softapper_tasks/utility/log_util.dart';
import 'package:softapper_tasks/utility/snackbar_util.dart';
import 'package:softapper_tasks/views/auth/login_screen.dart';
import 'package:softapper_tasks/views/components/my_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/my_textform_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool showConfirmPassword = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _emergencyContactController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _cnicController.dispose();
    _emergencyContactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 120, left: 30, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'WE ARE HERE FOR YOU',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          buildTextFormField(
                            controller: _nameController,
                            hintText: 'User Name',
                            prefixIcon: Icons.person,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your username';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          buildTextFormField(
                            controller: _emailController,
                            hintText: 'Email',
                            prefixIcon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your email';
                              }
                              final emailRegExp =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegExp.hasMatch(value)) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          buildTextFormField(
                            controller: _passwordController,
                            hintText: 'Password',
                            prefixIcon: Icons.lock,
                            obscureText: !showPassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(
                                !showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black38,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          buildTextFormField(
                            controller: _confirmPasswordController,
                            hintText: 'Confirm Password',
                            prefixIcon: Icons.lock,
                            obscureText: !showConfirmPassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showConfirmPassword = !showConfirmPassword;
                                });
                              },
                              icon: Icon(
                                !showConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black38,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your confirm password';
                              }
                              if (_passwordController.text != value) {
                                return 'Password not matched';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          buildTextFormField(
                            controller: _phoneNumberController,
                            hintText: 'Phone Number',
                            prefixIcon: Icons.phone_android,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          buildTextFormField(
                            controller: _addressController,
                            hintText: 'Address',
                            prefixIcon: Icons.location_city,
                            keyboardType: TextInputType.multiline,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          buildTextFormField(
                            controller: _cnicController,
                            hintText: 'CNIC number',
                            prefixIcon: Icons.credit_card,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your CNIC number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          buildTextFormField(
                            controller: _emergencyContactController,
                            hintText: 'Emergency Contact',
                            prefixIcon: Icons.contact_emergency,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your emergency contact';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          MyButton(
                            title: "SIGNUP",
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                EasyLoading.show();
                                Map<String, dynamic> userData = User(
                                        name: _nameController.text,
                                        email: _emailController.text,
                                        phoneNumber: _phoneNumberController.text,
                                        password: _passwordController.text,
                                        address: _addressController.text,
                                        cnicNumber: _cnicController.text,
                                        emergencyContact: _emergencyContactController.text)
                                    .toJson();
                                AuthUtility()
                                    .registerUser(
                                        _emailController.text, userData)
                                    .then((value) {
                                  if (value) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  } else {
                                    SnackBarUtils.show(
                                        title: "Something went wrong!",
                                        isError: true);
                                  }
                                  EasyLoading.dismiss();
                                });
                              }
                            },
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "LOG IN",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
