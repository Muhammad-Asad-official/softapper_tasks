import 'package:flutter/material.dart';
import 'package:softapper_tasks/utility/auth_util.dart';
import 'package:softapper_tasks/views/auth/register_screen.dart';
import 'package:softapper_tasks/views/components/my_button.dart';
import 'package:softapper_tasks/views/dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool rememberMe = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/login.jpg",
                ),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 120, left: 30, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left),
                  Text('WE ARE HERE FOR YOU',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left),
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
                        topLeft: Radius.circular(50))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Colors.white70,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.black38,
                              ),
                            ),
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
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: "User Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Colors.white70,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black38,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your username';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !showPassword,
                            decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Colors.white70,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black38,
                                ),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    child: Icon(
                                      !showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black38,
                                      size: 25,
                                    ))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //       const ForgotPasswordScreen(),
                                  //     ));
                                },
                                child: const Text(
                                  "Forgot your Password?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Remember me",
                                style: TextStyle(color: Colors.white),
                              ),
                              Checkbox(
                                value: rememberMe,
                                activeColor: Colors.orangeAccent,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = !rememberMe;
                                  });
                                },
                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.orangeAccent; // color when selected
                                  }
                                  return Colors.white; // color when not selected
                                }),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          MyButton(
                              title: "LOGIN",
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  AuthUtility().loginUser(_emailController.text, _nameController.text, _passwordController.text,rememberMe, context);
                                }
                              }),
                          SizedBox(height: 100,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have account?",style: TextStyle(color: Colors.white),),
                              TextButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                              }, child: Text("SIGN UP",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold, fontSize: 16),)),
                            ],
                          )
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
