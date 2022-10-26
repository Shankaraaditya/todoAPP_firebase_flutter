import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/auth/authFunctions.dart';

class AuthForm extends StatefulWidget {
  AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>(); // used for validating the form
  var _email = "";
  var _password = "";
  var _username = "";
  bool isLogin = false;
  String img = "images/todo.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(padding: EdgeInsets.only(left: 10 , right: 10)),
          // Padding(padding: EdgeInsets.all(15)),
          
          //  AssetImage(img),
         Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          // not working with "Decoration()"

          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              // color: Colors.black,
              spreadRadius: 4.0,
            )
            // shadow is given to box decoration and not to decoration image
          ],

          image: const DecorationImage(
            // image: Image.network(
            image: NetworkImage( 
              'https://www.onmsft.com/wp-content/uploads/2020/03/microsofttododarkmode.jpg',
              scale: 10,

              // fit: BoxFit.cover,
            ),
            fit: BoxFit.cover,
          ),
          // color: Colors.red,

          borderRadius: BorderRadius.circular(20),
          // this border radius is not applying at image so we have to change something here...
        ),
        // color: Colors.red,
        // child: Image.network(
        //   'https://m.media-amazon.com/images/M/MV5BMTY4NTU1NTEwNV5BMl5BanBnXkFtZTcwMzE1NzAwNg@@._V1_.jpg',
        //   fit: BoxFit.cover,
        // ),
        ),

            const SizedBox(height: 11,),
          
          Form(
            key: _formkey, // to validate the form
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // Padding(padding: EdgeInsets.all(15)),

              children: [
                const Padding(padding: EdgeInsets.all(15)),
                !isLogin
                    ? TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: const ValueKey("username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Incorrect Username";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          // _username = value!;
                          setState(() {
                            _username = value!;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            // borderSide: BorderSide(),
                          ),
                          labelText: "Enter Username",
                          labelStyle: GoogleFonts.roboto(),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  key: const ValueKey("email"),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return "Incorrect Email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    // _email = value!;
                    setState(() {
                      _email = value!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      // borderSide: BorderSide(),
                    ),
                    labelText: "Enter Email",
                    labelStyle: GoogleFonts.roboto(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  key: const ValueKey("password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Incorrect Password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    // _password = value!;
                    setState(() {
                      _password = value!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      // borderSide: BorderSide(  ),
                    ),
                    labelText: "Enter Password",
                    labelStyle: GoogleFonts.roboto(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  height: 50,
                  width: double.infinity,
                  // decoration:  BoxDecoration(
                  //   shape: BoxShape(
                  //     BorderRadius.circular(10),
                  //   ),
                  // ),

                  child: ElevatedButton(
                      onPressed: () {
                        // isLogin = !isLogin;
                        // setState(() {
                        //   isLogin = !isLogin;
                        // });

                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          isLogin
                              ? signin(_email, _password)
                              : signup(_email, _password);
                        }
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: isLogin
                          ? Text(
                              "Login",
                              style: GoogleFonts.roboto(fontSize: 16),
                            )
                          : Text(
                              "Signup",
                              style: GoogleFonts.roboto(fontSize: 16),
                            )),
                ),
                TextButton(
                  onPressed: () {
                    // isLogin = !isLogin;

                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? Text(
                          "Not A member?",
                          style: GoogleFonts.roboto(),
                        )
                      : Text("Already a member! "),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
