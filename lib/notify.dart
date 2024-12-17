import 'package:flutter/material.dart';

class NotifyDropDown extends StatelessWidget {
  const NotifyDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 177, 96, 96),
      child: Container(
        child: const ExpansionTile(
          title: Text(
            "Notifications",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          initiallyExpanded: false,
          children: [
            SizedBox(
              height: 260, 
              child: NotificationWidget(),
            ),
          ],
        ),
      ),
    );
  }
}


class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});
   @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}


class _NotificationWidgetState extends State<NotificationWidget> {
  List<String> notifications = [];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Day Date",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
                ),
                IconButton(
                  onPressed: () {setState(() {
                    notifications.clear();
                  });
                  },
                  icon: const Icon(Icons.delete)
                )
              ],
            ),
            Expanded(
              child:  notifications.isEmpty?
              const Center(
                child: Text(
                  'There are no notifications',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
              ): ListView.builder(
                itemCount: notifications.length,
                 itemBuilder: (context, index){
                  return Dismissible(
                    key: ValueKey(notifications[index]),
                    background: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.mark_email_read),
                    ),
                    secondaryBackground: Container(
                     decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30.0),
                     ),
                     alignment: Alignment.centerRight,
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: const Icon(Icons.delete),
                    ),
                    onDismissed: (direction){
                      setState(() {
                        notifications.removeAt(index);
                      });
                      if (direction == DismissDirection.startToEnd){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Notification marked as read')),
                        );
                      }else if (direction == DismissDirection.endToStart){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Notification deleted')),
                        );
                      }
                    },
                    child: SingleChildScrollView(
                      child: Container(
                      width: double.infinity, 
                      // height: 70.0,
                      padding: const EdgeInsets.all(15.0),
                        margin: const EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(notifications[index], style: const TextStyle(fontSize: 16.0),),
                                const Text("Time")
                              ],
                            ),
                            const SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Description",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  );
                 }
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: _addNotification,
        child: const Icon(Icons.add),
      ),
    );
  }
  void _addNotification(){
    setState(() {
      notifications.add("Notification ${notifications.length + 1}");
    });
  }
}