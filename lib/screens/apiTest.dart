import 'package:firebase_signin/model/modeltest.dart';

import 'package:flutter/material.dart';

class apiTest extends StatefulWidget {
  const apiTest(Event? event, {Key? key}) : super(key: key);
  static Event? event;
  @override
  State<apiTest> createState() => _apiTestState();
}

class _apiTestState extends State<apiTest> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //Event.name,
                  "Event name placeholder",
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  //Event.url,
                  "Event Url placeholder",
                  style: TextStyle(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      //Event.dates,
                      "Event Dates placeholder",
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
