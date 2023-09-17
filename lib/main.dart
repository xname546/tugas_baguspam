import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(), // Rute untuk halaman login
        '/home': (context) => HomePage(), // Rute untuk halaman home
        '/calculator': (context) => Calculator(), // Rute untuk halaman kalkulator
        '/dataKelompok': (context) => DataKelompok(),
      },
    );

  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = "tian"; // Ganti dengan username yang benar
  String password = "tian"; // Ganti dengan password yang benar

  bool isLoggedIn = false;

  void _login() {
    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    if (enteredUsername == username && enteredPassword == password) {
      setState(() {
        isLoggedIn = true;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Username atau Password salah.'),
            actions: <Widget>[
              TextButton(
                child: Text('Tutup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(

        child: isLoggedIn
            ? Text('Selamat datang di halaman Home!')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: 400, // Atur lebar Container sesuai keinginan Anda
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Atur padding di sini
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Atur radius melengkung sesuai keinginan Anda
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), // Menambahkan jarak vertikal 30 piksel
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: 400, // Atur lebar Container sesuai keinginan Anda
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Atur padding di sini
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Atur radius melengkung sesuai keinginan Anda
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30), // Menambahkan jarak vertikal 30 piksel
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 175, vertical: 20), // Atur padding tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Atur radius melengkung sesuai keinginan Anda
                ),
              ),
              child: Text('Login',  style: TextStyle(fontSize: 20.0)),
            ),
          ],
        ),
      ),
    );
  }

}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selamat datang di halaman Home!'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/dataKelompok');
                  },


                  child: Text('Data Kelompok', style: TextStyle(
                    fontSize: 16,
                  ),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Atur radius melengkung sesuai keinginan Anda
                    ),// Atur padding pada tombol
                  ),
                ),
                SizedBox(width: 20), // Menambahkan jarak horizontal
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/calculator');
                  },
                  child: Text('Buka Kalkulator', style: TextStyle(
                    fontSize: 16,
                  ),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Atur radius melengkung sesuai keinginan Anda
                    ),// Atur padding pada tombol
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


class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double result = 0;
  double num1 = 0;
  double num2 = 0;

  void calculateResult(String operation) {
    setState(() {
      switch (operation) {
        case 'Tambah':
          result = num1 + num2;
          break;
        case 'Kurang':
          result = num1 - num2;
          break;
        case 'Kali':
          result = num1 * num2;
          break;
        case 'Bagi':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            result = double.infinity;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Sederhana'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hasil: $result',
              style: TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        num1 = double.tryParse(value) ?? 0;
                      },
                      decoration: InputDecoration(
                        labelText: 'Masukkan Angka Pertama',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        num2 = double.tryParse(value) ?? 0;
                      },
                      decoration: InputDecoration(
                        labelText: 'Masukkan Angka Kedua',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  buttonMinWidth: 0,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => calculateResult('Tambah'),
                      child: Text(
                        'Tambah',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        padding: EdgeInsets.all(10.0), // Atur padding pada tombol
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => calculateResult('Kurang'),
                      child: Text(
                        'Kurang',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        padding: EdgeInsets.all(10.0), // Atur padding pada tombol
                      ),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => calculateResult('Kali'),
                      child: Text(
                        'Kali',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        padding: EdgeInsets.all(10.0), // Atur padding pada tombol
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => calculateResult('Bagi'),
                      child: Text(
                        'Bagi',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        padding: EdgeInsets.all(10.0), // Atur padding pada tombol
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class DataKelompok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelompok'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Anggota kelompok :', style: TextStyle(fontSize: 30),),
            SizedBox(height: 20),
            DataTable(
              columns: [
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('NIM')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Christantya Wibowo')),
                  DataCell(Text('124210005')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Carissa Salsalina Br Sembiring')),
                  DataCell(Text('124210015')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Bryan Bisma Zefanya')),
                  DataCell(Text('124210039')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
