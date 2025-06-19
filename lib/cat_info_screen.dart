import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cat_card.dart';
import 'package:flutter_application_1/model/cat_model.dart';
import 'package:flutter_application_1/service/cat_api_service.dart';

class CatInfoScreen extends StatefulWidget {
  @override
  _CatInfoScreenState createState() => _CatInfoScreenState();
}

class _CatInfoScreenState extends State<CatInfoScreen> {
  List<Cat> cats = [];
  bool isLoading = false;
  String errorMessage = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load default cat (Abyssinian) on start
    searchCat('abyssinian');
  }

  Future<void> searchCat(String catName) async {
    if (catName.isEmpty) return;

    setState(() {
      isLoading = true;
      errorMessage = '';
      cats = [];
    });

    try {
      List<Cat> fetchedCats = await CatApiService.fetchCatInfo(catName.toLowerCase());
      setState(() {
        cats = fetchedCats;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Information'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Search section
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Enter cat breed name...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onSubmitted: (value) => searchCat(value),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => searchCat(searchController.text),
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          
          // Content section
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : errorMessage.isNotEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error, size: 64, color: Colors.red),
                            SizedBox(height: 16),
                            Text(
                              'Error loading data',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(errorMessage),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => searchCat(searchController.text),
                              child: Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    : cats.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.pets, size: 64, color: Colors.grey),
                                SizedBox(height: 16),
                                Text('No cat data found'),
                                Text('Try searching for a different breed'),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.all(16),
                            itemCount: cats.length,
                            itemBuilder: (context, index) {
                              return CatCard(cat: cats[index]);
                            },
                          ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}