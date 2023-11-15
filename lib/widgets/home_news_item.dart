import 'package:flutter/material.dart';
import 'package:flutter_telugu/screens/details_page.dart';

class HomeNewsItem extends StatelessWidget {
  final String imageUrl, title, description;
  const HomeNewsItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (builder) => DetailsPage(
          //               imageUrl: imageUrl,
          //               title: title,
          //               description: description,
          //             )));
          showAboutBottomSheet(context);
        },
        leading: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        title: Text(title),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
    // return InkWell(
    //   onTap: () {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (builder) =>
    //                 DetailsPage(imageUrl: imageUrl, title: title)));
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 4, right: 4),
    //     child: Card(
    //       child: Container(
    //           margin: const EdgeInsets.only(bottom: 4),
    //           padding: const EdgeInsets.all(8),
    //           color: Colors.grey[10],
    //           child: Row(
    //             children: [
    //               Image.network(
    //                 imageUrl,
    //                 width: 100,
    //                 height: 100,
    //               ),
    //               const SizedBox(
    //                 width: 10,
    //               ),
    //               Text("Start learn ${title} Today."),
    //             ],
    //           )),
    //     ),
    //   ),
    // );
  }

  showAboutBottomSheet(BuildContext context) {
    showModalBottomSheet(
        // isDismissible: false,
        // enableDrag: false,
        context: context,
        isScrollControlled: true,
        builder: (bottomContext) {
          return Container(
            padding: MediaQuery.of(context).viewInsets,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                ),
                TextField(),
                Text(title),
                Text(description),
                IconButton(
                    onPressed: () {
                      Navigator.pop(bottomContext);
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
          );
        }).then((value) {});
  }
}
