import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login1/assets/dicons.dart';
// import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
  ..onTap = () {
    print('Hello');
  };
final TapGestureRecognizer _testureRecognizer = TapGestureRecognizer()
  ..onTap = () {
    print('Hello');
  };

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var _fformKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(right: 50, left: 50, top: 10),
                child: Column(
                  children: [
                    Image(height: 80, image: AssetImage('assets/devita.png')),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Address',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 15, top: 5),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'Please enter your email';
                                  else if (!RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                      .hasMatch(value))
                                    return 'Please enter your correct email';
                                },
                                autofocus: false,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 12, bottom: 12, left: 20, right: 20),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      fontSize: 15.0, color: Colors.grey),
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Password',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 5, top: 5),
                              child: TextFormField(
                                focusNode: focus,
                                validator: (value) {
                                  print(value);
                                  if (value!.isEmpty) {
                                    return 'Please enter password';
                                  } else {
                                    if (!RegExp(
                                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                        .hasMatch(value))
                                      return null;
                                    else
                                      return 'Enter valid password';
                                  }
                                },
                                controller: _passwordController,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 12, bottom: 12, left: 20, right: 20),
                                  hintText: "Password",
                                  // errorText: _passwordError,
                                  hintStyle: TextStyle(
                                      fontSize: 15.0, color: Colors.grey),
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _secureText
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.remove_rounded,
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      setState(() {
                                        _secureText = !_secureText;
                                      });
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                                obscureText: _secureText,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Forgot your password?',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                  recognizer: _testureRecognizer,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      //button
                      height: 35.0, width: 100,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (!_formKey.currentState!.validate()) {
                              return null;
                              // return null;
                            }
                            // else
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(content: Text('done')));
                            if (!_fformKey.currentState!.validate()) {
                              return null;
                              // return null;
                            }

                            FocusScope.of(context).requestFocus(focus);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff3a5fa9), Color(0xff47b787)],
                                begin: Alignment(-1, 1),
                                end: Alignment(1, -1),
                              ),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            constraints:
                                BoxConstraints(maxWidth: 120, minHeight: 25.0),
                            alignment: Alignment.center,
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(children: <Widget>[
                        Expanded(
                            child: Divider(
                          color: Colors.white,
                        )),
                        Text("Or Log In with",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            )),
                        Expanded(
                            child: Divider(
                          color: Colors.white,
                        )),
                      ]),
                    ),
                    Container(
                      height: 50.0,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff3a5fa9), Color(0xff47b787)],
                                begin: Alignment(-1, 1),
                                end: Alignment(1, -1),
                              ),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            constraints:
                                BoxConstraints(maxWidth: 120, minHeight: 25.0),
                            alignment: Alignment.center,
                            child: Text(
                              'ONE ID',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset('assets/google.png'),
                            iconSize: 40,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset('assets/facebook.png'),
                            iconSize: 40,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset('assets/talk.png'),
                            iconSize: 40,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset('assets/N.png'),
                            iconSize: 40,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: RichText(
                        text: TextSpan(
                          text: "Don't Have an account? ",
                          style: TextStyle(fontSize: 10),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Create one here",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff47b787),
                              ),
                              recognizer: _gestureRecognizer,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
