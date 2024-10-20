import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {

  @override
  Widget buildResults(BuildContext context) {

    close(context, query);
    return Container();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, "");
      }, 
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(
        onPressed: (){ query = ""; }, 
        icon: const Icon(Icons.close)
      )
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
