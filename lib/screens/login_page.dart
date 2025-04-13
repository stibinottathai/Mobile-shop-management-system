import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mobile_shop_management_system/controllers/controllers.dart';
import 'package:provider/provider.dart';

import '../core/colors.dart';
import '../global_widgets/custome_button.dart';
import '../global_widgets/custome_textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<LoginNotifier>(context, listen: false);
      provider.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<LoginNotifier>().isLoading;

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),

                ),
                const SizedBox(height: 20),
                CustomTextField(
                  prefixIconColor: AppColors.black.withOpacity(0.5),
                  borderRadius: 8,
                  borderColor: AppColors.black.withOpacity(0.5),
                  controller: _emailController,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => (value == null || !value.contains('@'))
                      ? 'Please enter a valid email'
                      : null,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  prefixIconColor: AppColors.black.withOpacity(0.5),
                  obscureText: _obscurePassword,
                  borderRadius: 8,
                  borderColor: AppColors.black.withOpacity(0.5),
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon:  InkWell(
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    child: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,

                      color: AppColors.black.withOpacity(0.5),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => (value == null || !value.contains('@'))
                      ? 'Please enter a valid email'
                      : null,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  width: double.infinity,
                  text: 'Login',
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      _login(context);
                    }
                  },
                  backgroundColor: AppColors.black,
                  textStyle: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  elevation: 0.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
