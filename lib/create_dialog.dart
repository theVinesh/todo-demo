import 'package:flutter/material.dart';

class CreateDialog extends StatefulWidget {
  @override
  _CreateDialogState createState() => _CreateDialogState();
}

class _CreateDialogState extends State<CreateDialog> {
  final titleInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Create Todo",
              style: Theme.of(context).textTheme.headline5,
            ),
            TextField(
              controller: titleInputController,
              decoration: InputDecoration(hintText: "title"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("cancel"),
                ),
                TextButton(
                    onPressed: () =>
                        Navigator.of(context).pop(titleInputController.text),
                    child: Text("ok")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
