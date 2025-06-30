import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seekhelperpro/models/userModel.dart';
import 'package:seekhelperpro/view_model/userViewModel.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '', email = '', phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add User')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (val) => val!.isEmpty ? 'Enter name' : null,
                onSaved: (val) => name = val!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter email' : null,
                onSaved: (val) => email = val!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (val) => val!.isEmpty ? 'Enter phone' : null,
                onSaved: (val) => phone = val!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState!;
                  if (form.validate()) {
                    form.save();
                    final newUser = UserModel(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: name,
                        email: email,
                        phone: phone,
                        username: name);
                    Provider.of<UserViewModel>(context, listen: false)
                        .addUser(newUser);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add User'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
