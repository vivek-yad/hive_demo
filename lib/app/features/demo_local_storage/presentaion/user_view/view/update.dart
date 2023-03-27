import 'package:flutter/material.dart';

import '../../../domain/entities/user_data.dart';
import '../widgets/update_user.dart';



class UpdateScreen extends StatefulWidget {
  final int index;
  final UserEntity person;

  const UpdateScreen({
    required this.index,
    required this.person,
  });

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Update Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UpdatePersonForm(
          index: widget.index,
          person: widget.person,
        ),
      ),
    );
  }
}