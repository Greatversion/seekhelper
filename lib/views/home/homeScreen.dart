import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:seekhelperpro/resources/shimmer.dart';
import 'package:seekhelperpro/view_model/userViewModel.dart';
import 'package:seekhelperpro/views/userDetails.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserViewModel>(context);
    final users = query.isEmpty ? vm.users : vm.search(query);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: const Text('Users Directory'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => context.push('/add'),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search by name',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                ),
                onChanged: (val) => setState(() => query = val),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          tooltip: 'Add User',
          child: const Icon(Icons.add),
        ),
        body: Builder(builder: (context) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (vm.loading) {
            buildShimmer();
          }
          if (vm.error.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(vm.error,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => vm.fetchUsers(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 4,
                        child: ListTile(
                          leading: Hero(
                            tag: 'user-avatar-${user.id}', // Use unique tag
                            child: CircleAvatar(
                              child: Text(user.name[0]), // or use user image
                            ),
                          ),
                          subtitle: Text(user.email),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          title: Hero(
                            tag: 'user-name-${user.id}',
                            child: Material(
                              // Text needs to be wrapped in Material for Hero to work correctly with text
                              color: Colors.transparent,
                              child: Text(user.name,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    UserDetailScreen(userId: user.id),
                              ),
                            );
                          },
                        )),
                  ),
                ),
              );
            },
          );
        }));
  }
}
