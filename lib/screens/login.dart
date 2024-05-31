import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/ui_input.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login Qerjaa',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32.0),
            const UiInput(
              labelText: 'Email',
              hintText: 'Masukan Email',
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            const SizedBox(height: 20.0),
            const UiInput(
              labelText: 'Password',
              hintText: 'Masukan Password',
              isPassword: true,
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                textStyle: const TextStyle(fontSize: 15),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                    child: Text(
                  'LOGIN',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 65, 176)),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    'Buat akun',
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 1, 65, 176),
                        color: Color.fromARGB(255, 1, 65, 176)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    'Lupa kata sandi?',
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 1, 65, 176),
                        color: Color.fromARGB(255, 1, 65, 176)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
