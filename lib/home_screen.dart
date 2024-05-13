import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_role_application/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '', age = '', password = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    password = sp.getString('password') ?? '';
    age = sp.getString('age') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Connect Me',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Color(0xff000221),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Input Data',
                  style: GoogleFonts.satisfy(
                      fontSize: 24, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/logof.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  height: 20,
                  color: Color(0xff000221),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.satisfy(fontSize: 18,color: Colors.white),
                      ),
                      Text(
                        email.toString(),
                        style: GoogleFonts.satisfy(fontSize: 18,color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 20,
                  color: Color(0xff000221),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Age',
                        style: GoogleFonts.satisfy(fontSize: 18
                        ,color: Colors.white),
                      ),
                      Text(
                        age.toString(),
                        style: GoogleFonts.satisfy(fontSize: 18,color: Colors.white)
                        ,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 20,
                  color: Color(0xff000221),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Password',
                        style: GoogleFonts.satisfy(
                            fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        password.toString(),
                        style: GoogleFonts.satisfy(
                            fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.clear();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.cyan,
                    child: Center(
                      child: Text('Logout'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
