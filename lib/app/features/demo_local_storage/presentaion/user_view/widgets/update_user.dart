import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/user_data.dart';
import '../getx_controller/user_controller.dart';

class UpdatePersonForm extends StatefulWidget {
  final int index;
  final UserEntity person;

  const UpdatePersonForm({
    required this.index,
    required this.person,
  });

  @override
  _UpdatePersonFormState createState() => _UpdatePersonFormState();
}

class _UpdatePersonFormState extends State<UpdatePersonForm> {
  final UserController controller = Get.find<UserController>();

  final _personFormKey = GlobalKey<FormState>();

  late final _nameController;
  late final _age;
  late final _id;
  late final Box box;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

 // Update info of people box
 //  _updateInfo() {
 //    UserEntity newPerson = UserEntity(
 //      name: _nameController.text,
 //      age: _countryController.text, id: null,
 //    );
 //
 //   // box.putAt(widget.index, new0Person);
 //
 //    print('Info updated in box!');
 //  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box

    _nameController = TextEditingController(text: widget.person.name);
    _age =TextEditingController(text: widget.person.age.toString());
    _id=widget.person.id;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Name'),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),
          const SizedBox(height: 24.0),
          const Text('age'),
          TextFormField(
            controller: _age,
            validator: _fieldValidator,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_personFormKey.currentState!.validate()) {
                    UserEntity user=UserEntity(id: _id, name: _nameController.text.toString(), age:int.parse(_age.text.toString()));
                    controller.updateUser(widget.index, user);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}