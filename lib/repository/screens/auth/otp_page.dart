import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_chat_app/domain/constants/text_contents/texts.dart';
import 'package:one_chat_app/main.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ContentTxt.enterNo,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Text(ContentTxt.enterNoDesc),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Phone number",
                      ),
                    )),
                Spacer(),
                SizedBox(
                  width: 0.7.sw,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "is this the correct number",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          content: Text(
                            "+91 xxxxxxxxxx",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Edit",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Yes",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.surface,
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    child: Text("next"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:one_chat_app/domain/constants/text_contents/texts.dart';

// class OtpPage extends StatelessWidget {
//   const OtpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(ContentTxt.enterNo),
//             Text(ContentTxt.enterNoDesc),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(width: 40, child: TextFormField()),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 SizedBox(width: 300, child: TextFormField()),
//               ],
//             ),
//             ElevatedButton(onPressed: () {}, child: Text("hdsfgg"))
//           ],
//         ),
//       ),
//     );
//   }
// }
