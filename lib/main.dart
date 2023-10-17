import 'package:flutter/material.dart';

void main() {
  runApp(Aplikasi_Saya());
}

class Aplikasi_Saya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Inputan Wigdet',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inputan Text Widget'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Text Field',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Masukan(),
                ),
                Container(
                  child: IniDia(),
                ),
                Container(
                  child: Text("""
        TextField merupakan sebuah widget yang digunakan untuk menerima input berupa teks yang berasal dari keyboard. Terdapat beberapa cara yang bisa Anda gunakan untuk mendapatkan nilai dari TextField. Salah satunya adalah melalui parameter onChanged.
        Parameter onChanged berisi sebuah fungsi yang akan dipanggil setiap terjadi perubahan inputan pada TextField. Pada fungsi ini, kita dapat mengubah nilai variabel state dengan memanggil fungsi setState().
        
        Jika Anda tidak ingin mengambil nilai setiap perubahan, tetapi hanya ketika seluruh input sudah selesai di-submit, Anda dapat menggunakan parameter onSubmitted
        Cara lain yang bisa kita gunakan adalah dengan TextEditingController. Dengan controller, kita cukup membuat variabel TextEditingController lalu menambahkannya ke widget TextField
        Ketika menggunakan controller, pastikan untuk menghapus controller ketika halaman atau widget sudah tidak digunakan. Ini bertujuan supaya tidak menimbulkan kebocoran memori (memory leak).
        """),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'SWITCH',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                  child: Hello(),
                ),
                Container(
                  child: Text("""
Pada contoh tersebut value dari Switch berupa boolean di mana ketika boolean tersebut false maka Switch akan berada pada posisi nonaktif. Switch umumnya digunakan sebagai konfigurasi on/off pada halaman setting.
"""),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'RADIO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ),
                Container(
                  child: Mina(),
                ),
                Container(
                  child: Text("""
Radio merupakan inputan yang digunakan untuk memilih salah satu dari beberapa pilihan dalam suatu kelompok.Pada contoh tersebut terdapat variable language yang digunakan pada groupValue tiap Radio. Language inilah yang menyimpan nilai Radio yang dipilih. Nilainya akan berubah ketika fungsi onChanged terpanggil 
"""),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'CHECKBOX',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Container(
                  child: Nana(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Masukan extends StatefulWidget {
  @override
  State<Masukan> createState() => _MasukanState();
}

class _MasukanState extends State<Masukan> {
  String _nama = ' ';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Tulis nama kamu disini',
            labelText: 'Nama Kamu',
          ),
          onChanged: (String value) {
            setState(() {
              _nama = value;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Anu Gemoy nyaeta $_nama'),
                    );
                  });
            },
            child: Text('Sumbit'))
      ],
    );
  }
}

class IniDia extends StatefulWidget {
  @override
  State<IniDia> createState() => _IniDiaState();
}

class _IniDiaState extends State<IniDia> {
  TextEditingController _uhuy = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _uhuy,
          decoration: const InputDecoration(
              hintText: 'Tulis disini', labelText: 'Kabogoh kamu'),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Kabogoh abi nyaeta ${_uhuy.text}'),
                    );
                  });
            },
            child: Text('tekan'))
      ],
    );
  }

  void dispose() {
    _uhuy.dispose();
    super.dispose();
  }
}

class Hello extends StatefulWidget {
  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  bool lighton = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: lighton,
        onChanged: (bool value) {
          setState(() {
            lighton = value;
          });

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(lighton ? 'Light On' : 'Light Off'),
              duration: Duration(seconds: 1)));
        });
  }
}

class Mina extends StatefulWidget {
  @override
  State<Mina> createState() => _Mina();
}

class _Mina extends State<Mina> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Radio<String>(
              value: 'Dart',
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                  showSnackbar();
                });
              },
            ),
            title: Text('Dart'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Kotlin',
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                  showSnackbar();
                });
              },
            ),
            title: Text('Kotlin'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Swift',
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                  showSnackbar();
                });
              },
            ),
            title: Text('Swift'),
          ),
        ],
      ),
    );
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}

class Nana extends StatefulWidget {
  @override
  State<Nana> createState() => _NanaState();
}

class _NanaState extends State<Nana> {
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: agree,
        onChanged: (bool? value) {
          setState(() {
            agree = value!;
          });
        },
      ),
      title: Text('Agree / Disagree'),
    );
  }
}
