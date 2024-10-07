import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:password_manager/service/local_auth.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/icon_button.dart';
import 'package:password_manager/widgets/textfield.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final AuthService _authService = AuthService();
  _SupportState _supportState = _SupportState.unknown;
  final TextEditingController _mobileNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeSupportState();
  }

  Future<void> _initializeSupportState() async {
    bool isSupported = await _authService.isDeviceSupported();
    setState(() {
      _supportState =
          isSupported ? _SupportState.supported : _SupportState.unsupported;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1c1c1c),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 130),
            _buildTabContentSection(context, _mobileNumberController),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContentSection(
      BuildContext context, TextEditingController mobileController) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              indicatorColor: Color(0xff00c600),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 1,
              labelColor: Color(0xff00c600),
              unselectedLabelColor: Color(0xff808080),
              tabs: [
                Tab(text: 'Mobile Number'),
                Tab(text: 'Email Address'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 270,
              width: MediaQuery.of(context).size.width - 40,
              child: TabBarView(
                children: [
                  _buildMobileNumberTab(mobileController),
                  const Center(child: Text('Tab 2 Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileNumberTab(TextEditingController mobileController) {
    return Column(
      children: [
        const SizedBox(height: 35),
        MyTextField(
          controller: mobileController,
          hintText: 'Mobile Number',
          isObscure: false,
          type: const TextInputType.numberWithOptions(),
          labelText: 'User ID',
        ),
        const SizedBox(height: 20),
        MyTextField(
          controller: mobileController,
          hintText: 'Your MPIN/Password',
          isObscure: true,
          type: const TextInputType.numberWithOptions(),
          labelText: 'MPIN/Password',
        ),
        const SizedBox(height: 40),
        _buildRememberAndForgotRow(),
        const SizedBox(height: 40),
        _buildLoginButtons(),
        const SizedBox(height: 30),
        _buildHelpAndSupportBox(),
        const SizedBox(height: 80),
        _buildRegisterText(),
      ],
    );
  }

  Widget _buildRememberAndForgotRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Remember me',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color.fromARGB(255, 150, 150, 150),
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Forgot Password?',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xff00c600),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyButton(
          text: 'LOGIN',
          background: const Color.fromARGB(255, 0, 110, 0),
          foreground: const Color(0xffffffff),
          onTap: () {
            // Implement login functionality here
          },
        ),
        MyIconButton(
          onTap: () async {
            bool isAuthenticated =
                await _authService.authenticateWithBiometrics(context);

            if (isAuthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Biometric Authentication Success')),
              );
            } else {
              // Show error message if authentication fails
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Biometric Authentication Failed')),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildHelpAndSupportBox() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              IconlyLight.call,
              color: Color.fromARGB(255, 0, 110, 0),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '24x7 Help & Support',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Get quick solutions for queries.',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        'Register',
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color(0xff00c600),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
