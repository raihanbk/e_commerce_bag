import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/textStyles.dart';
import '../../register/ui/registerPage.dart';
import '../../routes/route.dart';
import '../bloc/login_page_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginPageBloc loginBloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    loginBloc = LoginPageBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginPageBloc, LoginPageState>(
      bloc: loginBloc,
      listener: (context, state) {
          if (state is LoginPageLoadedState) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Routes()),
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.all(30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Text(
                        "Login Active eCommerce",
                        style: MyTextStyles.PmainTitle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Email",
                    style: MyTextStyles.PmainTitle.copyWith(fontSize: 15),
                  ),
                  textFormField(
                    "sreejithhkm@gmail.com",
                    emailController,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forgot password",
                      style: MyTextStyles.PmainTitle.copyWith(
                        fontSize: 15,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  Text(
                    "Password",
                    style: MyTextStyles.PmainTitle.copyWith(fontSize: 15),
                  ),
                  textFormField(
                    "******* ",
                    passController,
                  ),
                  const SizedBox(height: 20),
                  button("Login", Colors.yellow.shade800, () {
                    if (formKey.currentState!.validate()) {
                      loginBloc.add(
                        ValidateEvent(
                          email: emailController.text,
                          password: passController.text,
                        ),
                      );
                    }
                  }),
                  Center(child: text("or create a new account")),
                  button("Sign up", Colors.red.shade500, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  }),
                  Center(child: text("Login with")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:
          const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Field can't be empty";
          }
          return null;
        },
      ),
    );
  }

  Widget button(String name, Color color, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Center(
            child: Text(
              name,
              style: MyTextStyles.PmainTitle.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget text(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
      ),
    );
  }
}
