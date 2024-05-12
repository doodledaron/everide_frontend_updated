import 'package:everide_frontend/src/constants/app_contants.dart';
import 'package:everide_frontend/src/constants/colors.dart';
import 'package:everide_frontend/src/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//test your widgets here
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //fetch user data in initState, so it only fetches one day when app initialized
    //You can only write above code with listen: false if you are writing it inside initState(). By setting listen: false you tell not to rebuild the widget upon data changes happen inside the provider.
    Provider.of<UserProvider>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        //loading == true? loading, else show your widget
        child: user.loading
            ? CircularProgressIndicator()
            : //test your widgets here
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: secondaryColor,
                            width: 13,
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'CO2',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
