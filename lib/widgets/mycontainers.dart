import 'package:matatu/base/BaseData.dart';
import 'package:matatu/widgets/mybutton.dart';
import 'package:matatu/widgets/mytext.dart';
import 'package:flutter/material.dart';
class MyListItems extends StatefulWidget {
  String id,name,description,date;
  IconData icon;
  Function function;
  MyListItems({required this.id,required this.name,required this.description,required this.date,required this.icon,required this.function,super.key});

  @override
  State<MyListItems> createState() => _MyListItemsState();
}

class _MyListItemsState extends State<MyListItems> {
  BaseData baseData = BaseData();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child:Row(
        children: [
          Icon(widget.icon,color: baseData.basecolor,size: 25,),
          const SizedBox(width: 5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(child: MyTextView(data: widget.name, fontsize: 18)),
                    Expanded(child: MyTextView(data: widget.description, fontsize: 18))
                  ],
                ),
                const SizedBox(height: 5,),
                MyTextView(data: widget.date, fontsize: 14)
              ],
            ),
          ),
          const SizedBox(width: 5,),
          PsIconButton(icon: Icons.delete, color: Colors.red, function: ()=>showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Row(
                children: [
                  Expanded(child: MyTextView(data: 'Delete ${widget.name}')),
                  IconButton(
                    icon: const Icon(Icons.cancel_outlined),
                    tooltip: 'Cancel',
                    onPressed:() => Navigator.pop(context, 'Close'),
                  ),
                ],
              ),
              content: MyTextView(data: "Are You sure you want to Delete ${widget.name}"),
              actions: <Widget>[
                TextButton(
                  onPressed: (){
                    widget.function(widget.id);
                    Navigator.pop(context, 'Yes');
                  },
                  child: const Text('Delete'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'No'),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          )),
          const SizedBox(width: 15,),
        ],
      ),
    );
  }
}
