import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _emailValidationError = '';
  String _passwordValidationError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.lightBlueAccent],
            ),
          ),
          child: Center(
            child: Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: _emailValidationError,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: _passwordValidationError,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _performLogin,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextButton(
                      onPressed: _navigateToForgetPassword,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: _navigateToSignUp,
                      child: Text(
                        "Don't have  account? Sign Up..!",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email);
  }

  void _performLogin() {
    setState(() {
      _emailValidationError = '';
      _passwordValidationError = '';
    });

    String userEmail = _emailController.text;
    if (!isValidEmail(userEmail)) {
      setState(() {
        _emailValidationError = 'Invalid email format';
      });
      return;
    }

    String userPassword = _passwordController.text;

    if (userPassword != '123') {
      setState(() {
        _passwordValidationError = 'Incorrect password. Enter 123';
      });
      return;
    }

    _loginSuccess();
  }

  void _loginSuccess() {
    Navigator.pushReplacementNamed(context, '/dashboard');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bynyry',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forget_password': (context) => ForgetPasswordScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
