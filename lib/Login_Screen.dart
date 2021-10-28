import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isButtonActive = false;

  List gender = ["Male", "Female", "Others", "Prefer not to say"];
  String selectGender = "Male";

  @override
  void initState() {
    super.initState();

    nameController.addListener(signUp);
    emailController.addListener(signUp);
    passwordController.addListener(signUp);
  }

  void signUp() {
    setState(() {
      if (nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        isButtonActive = true;
      } else {
        isButtonActive = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Sign up for a free account!',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Image.network(
                    'https://dummyimage.com/600x400/0009ff/fff&text=Flutter',
                    width: 200,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.all(10),
                //   child:DropdownButton<String>(
                //     hint: Text('Choose your gender'),
                //     items: <String>['Male', 'Female', 'Others', 'Prefer not to say'].map((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(value),
                //       );
                //     }).toList(),
                //     onChanged: (newValue) {
                //       setState(() {
                //         var value = newValue;
                //       });
                //     },
                //   )
                //   ,
                // ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: DropdownButtonFormField(
                    value: selectGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectGender = newValue ?? "";
                      });
                    },
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    items: gender.map<DropdownMenuItem<String>>((newValue) {
                      return DropdownMenuItem(
                        child: Text(newValue),
                        value: newValue,
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: FlatButton(
                    height: 50,
                    child: Text('Sign Up'),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: !isButtonActive
                        ? null:() {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('You have successfully signed up!'),
                      ));
                    },
                  ),
                ),
              ],
            )));
  }
}
