import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seekhelperpro/view_model/userViewModel.dart';

class UserDetailScreen extends StatelessWidget {
  final int userId;
  const UserDetailScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context)
        .users
        .firstWhere((u) => u.id == userId);
    return Scaffold(
      appBar: AppBar(
          title: Hero(tag: 'user-avatar-${user.id}', child: Text(user.name))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.blueAccent),
                  title: Text(user.name,
                      style: Theme.of(context).textTheme.titleLarge),
                  subtitle: const Text("Full Name"),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.alternate_email,
                      color: Colors.deepPurple),
                  title: Text(user.username ?? "N/A"),
                  subtitle: const Text("Username"),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.redAccent),
                  title: Text(user.email),
                  subtitle: const Text("Email Address"),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.phone_android, color: Colors.green),
                  title: Text(user.phone),
                  subtitle: const Text("Phone Number"),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.language, color: Colors.teal),
                  title: Text(user.website ?? "N/A"),
                  subtitle: const Text("Website"),
                ),
                const Divider(),
                if (user.address != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Address",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.home, color: Colors.orange),
                        title: Text(
                          "${user.address?.street ?? ''}, ${user.address?.suite ?? ''},\n${user.address?.city ?? ''} - ${user.address?.zipcode ?? ''}",
                        ),
                        subtitle: const Text("Street, Suite, City, Zip"),
                      ),
                      if (user.address?.geo != null)
                        ListTile(
                          leading: const Icon(Icons.map, color: Colors.brown),
                          title: Text(
                              "Lat: ${user.address?.geo?.lat ?? '-'}, Lng: ${user.address?.geo?.lng ?? '-'}"),
                          subtitle: const Text("Geolocation"),
                        ),
                    ],
                  ),
                if (user.company != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Company",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.business, color: Colors.indigo),
                        title: Text(user.company?.name ?? "N/A"),
                        subtitle: const Text("Company Name"),
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.bubble_chart, color: Colors.cyan),
                        title: Text(user.company?.catchPhrase ?? "N/A"),
                        subtitle: const Text("Catch Phrase"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.api, color: Colors.pink),
                        title: Text(user.company?.bs ?? "N/A"),
                        subtitle: const Text("Business Scope"),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
