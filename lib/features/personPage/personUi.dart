import 'package:flutter/material.dart';
import 'package:noteapp/core/Shared/ColorsName.dart';

import '../../core/Shared/personRow.dart';

// ignore: camel_case_types
class personPage extends StatelessWidget {
  const personPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManger.purple,
      body: Column(
        children: [
          SizedBox(height: 60,),
          Text("Person",style: TextStyle(
            fontWeight:  FontWeight.bold
          ),),
          PersonRow(
            name: "Account",
            nameIcon: Icons.arrow_back_ios,
          ),
          PersonRow(
            name: "Notifications",
            nameIcon: Icons.arrow_back_ios,
          ),
          PersonRow(
            name: "Help",
            nameIcon: Icons.arrow_back_ios,
          ),
          PersonRow(
            name: "Storage and Data",
            nameIcon: Icons.arrow_back_ios,
          ),
          PersonRow(
            name: "Invite a friend",
            nameIcon: Icons.arrow_back_ios,
          ),
          PersonRow(
            name: "Logout",
            nameIcon: Icons.arrow_back_ios,
          ),
        ],
      ),
    );
  }
  
}
