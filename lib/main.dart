import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Логін"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Виберіть тип користувача:"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userType = "Клієнт";
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserLoginScreen(userType: userType),
                  ),
                );
              },
              child: Text("Клієнт"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userType = "Робітник";
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserLoginScreen(userType: userType),
                  ),
                );
              },
              child: Text("Робітник"),
            ),
          ],
        ),
      ),
    );
  }
}

class UserLoginScreen extends StatelessWidget {
  final String userType;

  UserLoginScreen({required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Авторизація на $userType"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Gmail або номер тел.",
                contentPadding: EdgeInsets.all(12), // Відступи від країв
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Пароль",
                contentPadding: EdgeInsets.all(12), // Відступи від країв
              ),
            ),
            if (userType == "Робітник")
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Код автентифікації",
                  contentPadding: EdgeInsets.all(12), // Відступи від країв
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Керувати логіном для користувача
              },
              child: Text("Логін"),
            ),
            if (userType == "Клієнт") ...[
              TextButton(
                onPressed: () {
                  _showRegistrationDialog(context);
                },
                child: Text("Реєстрація"),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showRegistrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Реєстрація"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Ім'я",
                    contentPadding: EdgeInsets.all(12), // Відступи від країв
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Прізвище",
                    contentPadding: EdgeInsets.all(12), // Відступи від країв
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Gmail або номер тел.",
                    contentPadding: EdgeInsets.all(12), // Відступи від країв
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Пароль",
                    contentPadding: EdgeInsets.all(12), // Відступи від країв
                  ),
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Повторіть пароль",
                    contentPadding: EdgeInsets.all(12), // Відступи від країв
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Скасувати
              },
              child: Text("Скасувати"),
            ),
            ElevatedButton(
              onPressed: () {
                // Виконати реєстрацію
                Navigator.of(context).pop(); // Закрити діалогове вікно
              },
              child: Text("Підтвердити"),
            ),
          ],
        );
      },
    );
  }
}
