
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';






import 'dart:async' show Future;

//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'dart:async';

//import 'package:shared_preferences/shared_preferences.dart';






class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;
 
  static final List<String> _listViewData = [
    "Inducesmile.com",
    "Flutter Dev",
    "Android Dev",
    "iOS Dev!",
    "React Native Dev!",
    "React Dev!",
    "express Dev!",
    "Laravel Dev!",
    "Angular Dev!",
  ];
  List<String> todos = ["nare"];
  List<String> _categoryBy = ["All","Fish FISH FISH FISH fish fish fish fish fish","Egg","MEAT","Chicken","Search1 Vallamreddy niki nikireddy","Brand2","Discount2","Search2","Brand3","Discount3","Search3","Brand4","Discount4","Search4"];
  List<bool> inputs = new List<bool>();
  List<String> litems = ["1","2","Third","4","1","2","Third","4","1","2","Third","4","1","2","Third","4","1","2","Third","4","1"];
  int categorysortby = 1;
  int _activeSortbyitem;
  var _sortBy =<String> ["Popularity ","price low to high ","Price high to low","Offers %","Alphabetical","Popularity","price low to high","Price high to low","Offers %","Alphabetical","Popularity","price low to high","Price high to low","Offers %","Alphabetical"];
  double screenSize;
  bool _BrandIsExpand = false;
  bool _SearchedBrandIsExpand = true;
  bool _PriceIsExpand = false;
  bool _DiscountIsExpand = true;
  List<String> _searchedCategory = new List<String>();
  List<bool> _searchedCategoryInputs = new List<bool>();
  /*Price and Discount List(Array)*/
  List<Map<String,dynamic>> _BrandIdAndBrandText = [{"brandId":1,"brandText":"Aarika","intialCheckboxTileStatus":false},{"brandId":2,"brandText":"All Time","intialCheckboxTileStatus":false},{"brandId":3,"brandText":"Asian","intialCheckboxTileStatus":false},{"brandId":4,"brandText":"bb Combo","intialCheckboxTileStatus":false},{"brandId":5,"brandText":"BB Home","intialCheckboxTileStatus":false},{"brandId":6,"brandText":"Bento","intialCheckboxTileStatus":false},{"brandId":7,"brandText":"Big Plastics","intialCheckboxTileStatus":false},{"brandId":8,"brandText":"Borosil","intialCheckboxTileStatus":false},{"brandId":9,"brandText":"Camry","intialCheckboxTileStatus":false},{"brandId":10,"brandText":"Cello","intialCheckboxTileStatus":false},{"brandId":11,"brandText":"Cook4u","intialCheckboxTileStatus":false},{"brandId":12,"brandText":"Daily Luck","intialCheckboxTileStatus":false},{"brandId":13,"brandText":"Dp","intialCheckboxTileStatus":false},{"brandId":14,"brandText":"Fendo","intialCheckboxTileStatus":false},{"brandId":15,"brandText":"Glad","intialCheckboxTileStatus":false},{"brandId":16,"brandText":"Joyo","intialCheckboxTileStatus":false},{"brandId":17,"brandText":"Jvs","intialCheckboxTileStatus":false},{"brandId":18,"brandText":"KM","intialCheckboxTileStatus":false},{"brandId":19,"brandText":"Laplast","intialCheckboxTileStatus":false},{"brandId":20,"brandText":"Homio","intialCheckboxTileStatus":false},{"brandId":21,"brandText":"Hotmugs","intialCheckboxTileStatus":false},{"brandId":22,"brandText":"lqix","intialCheckboxTileStatus":false},{"brandId":23,"brandText":"Jlt","intialCheckboxTileStatus":false},{"brandId":24,"brandText":"Milton","intialCheckboxTileStatus":false},{"brandId":25,"brandText":"Nakoda","intialCheckboxTileStatus":false},{"brandId":26,"brandText":"Nikmal","intialCheckboxTileStatus":false},{"brandId":27,"brandText":"Organic food","intialCheckboxTileStatus":false},{"brandId":28,"brandText":"Organic Tifin","intialCheckboxTileStatus":false},{"brandId":29,"brandText":"Organic Lunch","intialCheckboxTileStatus":false},{"brandId":30,"brandText":"Organic Dinner","intialCheckboxTileStatus":false}];
  List<Map<String,dynamic>> _PriceIdAndPriceText = [{"priceId":1,"priceText":"Less then Rs 20","intialCheckboxTileStatus":false},{"priceId":2,"priceText":" Rs 20 to Rs 50","intialCheckboxTileStatus":false},{"priceId":3,"priceText":"Rs 51 to Rs 100","intialCheckboxTileStatus":false},{"priceId":4,"priceText":" Rs 101 to Rs 200","intialCheckboxTileStatus":false},{"priceId":5,"priceText":" Rs 201 to Rs 500","intialCheckboxTileStatus":false},{"priceId":6,"priceText":"More then Rs 501","intialCheckboxTileStatus":false}];
  List<Map<String,dynamic>> _DiscountIdAndDiscountText = [{"discountId":1,"discountText":"Upto 5%","intialCheckboxTileStatus":false},{"discountId":2,"discountText":"5% - 10%","intialCheckboxTileStatus":false},{"discountId":3,"discountText":"10% - 15%","intialCheckboxTileStatus":false},{"discountId":4,"discountText":" 15% - 25%","intialCheckboxTileStatus":false},{"discountId":5,"discountText":" More then 25%","intialCheckboxTileStatus":false}];
  //List<User> users = [];
  /*Selected Brands,Prices, DisConts*,Sortby*/
  List<String> _SelectedBrands = [];
  List<String> _SelectedPrices = [];
  List<String> _SelectedDiscounts = [];
  int SearchTermLength = 0;
/*_UserStartSearchingBrand*/
  bool _UserStartSearchingBrand  = true;
/*_UserSearchedBrands*/
  List<Map<String,dynamic>> _UserSearchedBrands = new List<Map<String,dynamic>>();
  /*_HideTextFiledSearchContent*/
  bool _HideTextFiledSearchContent =  false;
  /*_NoBrandsMatch*/
  List<dynamic>_NoBrandsMatch = new List<dynamic>();
  /*_NoBrandsSearchTerm*/
  String _NoBrandsSearchTerm ;
  /*ExpansionClickOnClose*/
  bool _ExpansionClickOnClose = false;
  bool _reddy = true;
  TextEditingController _c ;
  int _NoMatchId = 1;
  /*shopbycategory*/
  List<Map<String,dynamic>> _ShopByCategory =[
    {"cat_img":"assets/Fruits.svg","cat_name":"Fruits","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},
    {"cat_img":"assets/Vegetable.svg","cat_name":"Vegetable","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},
    {"cat_img":"assets/Breakfast.svg","cat_name":"Breakfast","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},

    {"cat_img":"assets/Instant & Packaged Foods.svg","cat_name":"Instant & Packaged Foods","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},
    {"cat_img":"assets/Grocery & Staples.svg","cat_name":"Grocery & Staples","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},
    {"cat_img":"assets/Beverages.svg","cat_name":"Beverages","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},

    {"cat_img":"assets/Health & Beauty.svg","cat_name":"Health & Beauty","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},
    {"cat_img":"assets/Household & Laundry.svg","cat_name":"Household & Laundry","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},
    {"cat_img":"assets/Baby & Kids.svg","cat_name":"Baby & Kids","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},
    {"cat_img":"assets/Accessories.svg","cat_name":"Accessories","cat_subcats":[{"subcat_id":1,"subcat_name":"Apple"},{"subcat_id":2,"subcat_name":"Apricots"},{"subcat_id":3,"subcat_name":"Avocados"},{"subcat_id":4,"subcat_name":"Bananas"},{"subcat_id":5,"subcat_name":"Boysenberries"},{"subcat_id":6,"subcat_name":"Blueberries"},{"subcat_id":7,"subcat_name":"Bing Cherry"},{"subcat_id":8,"subcat_name":"Cherries"},{"subcat_id":9,"subcat_name":"Cantaloupe,"},{"subcat_id":10,"subcat_name":"Crab apples"},{"subcat_id":11,"subcat_name":"Clementine"}]},
  ];
  List<Map<String,dynamic>> _ChooseCut =[
    {"CutImg":"assets/13803_150.jpg","CutName":"Boneless Filet 500g Pack","CutSubTitle":"Gross Wt.pprox 770g | Net Wt.500g @152.46 / 500g","CutMrp":"376.20"},  {"CutImg":"assets/fish2.png","CutName":"Whole Cleaned","CutSubTitle":"Gross Wt.approx 770g | Net Wt.500g @152.46/500g","CutMrp":"376.20"},    {"CutImg":"assets/Fish3.png","CutName":"Bengali Cut (May include head piec)","CutSubTitle":"Gross Wt.pprox 770g | Net Wt.500g @152.46 / 500g","CutMrp":"376.20"},
    {"CutImg":"assets/Fish1.png","CutName":"Boneless Filet 500g Pack","CutSubTitle":"Gross Wt.pprox 770g | Net Wt.500g @152.46 / 500g","CutMrp":"376.20"},  {"CutImg":"assets/fish2.png","CutName":"Whole Cleaned","CutSubTitle":"Gross Wt.approx 770g | Net Wt.500g @152.46/500g","CutMrp":"376.20"},    {"CutImg":"assets/Fish3.png","CutName":"Bengali Cut (May include head piec)","CutSubTitle":"Gross Wt.pprox 770g | Net Wt.500g @152.46 / 500g","CutMrp":"376.20"},
    {"CutImg":"assets/Fish1.png","CutName":"Boneless Filet 500g Pack","CutSubTitle":"Gross Wt.pprox 770g | Net Wt.500g @152.46 / 500g","CutMrp":"376.20"},  {"CutImg":"assets/fish2.png","CutName":"Whole Cleaned","CutSubTitle":"Gross Wt.approx 770g | Net Wt.500g @152.46/500g","CutMrp":"376.20"},    {"CutImg":"assets/Fish3.png","CutName":"Bengali Cut (May include head piec)","CutSubTitle":"Gross Wt.pprox 770g | Net Wt.500g @152.46 / 500g","CutMrp":"376.20"},

    {"CutImg":"assets/instantpackagefoods.png","CutName":"Boneless Filet 500g Pack","CutSubTitle":"Gross Wt.pprox 770g | Net Wt.500g @152.46 / 500g","CutMrp":"376.20"},  {"CutImg":"assets/instantpackagefoods.png","CutName":"Boneless Filet 250g Pack","CutSubTitle":"Gross Wt.pprox 770g | Net Wt.500g @152.46 / 500g","CutMrp":"376.20"}
  ];
  int _ExpandCategory;
  int _FishMeatEggActiveTab  =0;
  List niki =[];
  dynamic totalpayableAmount = 0;
  dynamic totalsavedAmount =0;
  List<dynamic> emptyarray1 = [];
  List<dynamic> emptyarray2 = [];
  int varienIdforLoader = 0;
  String deliveryChargeApplicableMsg;
  int minAmountForEachStore = 0;
  int deliveryChargeAmount ;
  List<Map<String,dynamic>> deliverySlots =[
    {"Date":"27 Mar, Sun","Slots":[{"time":"7.00 AM - 9.30 AM","userChoosedSlot":0},{"time":"9.30 AM - 12.00 AM","userChoosedSlot":0},{"time":"12.00 AM - 1.30 AM","userChoosedSlot":0},{"time":"1.30 AM - 3.30 AM","userChoosedSlot":0},{"time":"3.30 AM - 5.30 AM","userChoosedSlot":0}]},
    {"Date":"28 Mar, Sun","Slots":[{"time":"7.00 AM - 9.30 AM","userChoosedSlot":0},{"time":"9.30 AM - 12.00 AM","userChoosedSlot":0},{"time":"12.00 AM - 1.30 AM","userChoosedSlot":0},{"time":"1.30 AM - 3.30 AM","userChoosedSlot":0},{"time":"3.30 AM - 5.30 AM","userChoosedSlot":0}]},
    {"Date":"29 Mar, Sun","Slots":[{"time":"7.00 AM - 9.30 AM","userChoosedSlot":0},{"time":"9.30 AM - 12.00 AM","userChoosedSlot":0},{"time":"12.00 AM - 1.30 AM","userChoosedSlot":0},{"time":"1.30 AM - 3.30 AM","userChoosedSlot":0},{"time":"3.30 AM - 5.30 AM","userChoosedSlot":0}]},
    {"Date":"30 Mar, Sun","Slots":[{"time":"7.00 AM - 9.30 AM","userChoosedSlot":0},{"time":"9.30 AM - 12.00 AM","userChoosedSlot":0},{"time":"12.00 AM - 1.30 AM","userChoosedSlot":0},{"time":"1.30 AM - 3.30 AM","userChoosedSlot":0},{"time":"3.30 AM - 5.30 AM","userChoosedSlot":0}]},
    {"Date":"31 Mar, Sun","Slots":[{"time":"7.00 AM - 9.30 AM","userChoosedSlot":0},{"time":"9.30 AM - 12.00 AM","userChoosedSlot":0},{"time":"12.00 AM - 1.30 AM","userChoosedSlot":0},{"time":"1.30 AM - 3.30 AM","userChoosedSlot":0},{"time":"3.30 AM - 5.30 AM","userChoosedSlot":0}]},

  ];
  int dateOfDelivery = 0;
  int timeOfDelivery = 0;
  List<Map<String,dynamic>> deliveryAddress = [];
  List<Map<String,dynamic>> syncedCartItems = [];
  dynamic syncedCartItemsTotalPrice = 0;

  getUserPreferredSlot(dod,tod){
    print("dod");
    print(dod);

    print("tod");
    print(tod);
    setState((){
      dateOfDelivery = dod;

      timeOfDelivery  = tod;


    });

  }



  OverlayEntry _overlayEntry;
  OverlayEntry _createOverlayEntry() {




    return OverlayEntry(
        maintainState: true,
        builder: (context) =>
            Positioned( // user can't scroll when overlay is  visible
              //top: 0.0,
                // top: MediaQuery.of(context).size.height/2.25,
            //  right: 0.0,

              //bottom: 62.0,
            //  left: 0.0,
              bottom:62.0,
              width: MediaQuery.of(context).size.width,
              height: 90.0,
              child:SafeArea(
                child:Visibility(
                  visible : true,
                  //  visible : false,

                  child:   Container(
                  //  height:90.0,


                    decoration: BoxDecoration(

color:Colors.red,
                      //color:Colors.transparent,
                      //  color: Color(0xff000000).withOpacity(0.6),
                      // color:Colors.transparent,
                    ),


                    child:Material(
                      color:Colors.transparent,


                      child: InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        enableFeedback: false,
                        onTap :(){
                          print("ancesters");
                          reddygaru123();
                          //  overlayEntry123.remove();
                        },
                        child:  Stack(
                            children: <Widget>[
                              Positioned(
                                top: 6.0,
                                //right: 3.0,
                                // bottom: 0.0,
                                right: 3.0,
                                left: MediaQuery.of(context).size.width/2,
                                child: InkWell(
                                  onTap:(){
                                    print("ancesters calling123");
                                    //  reddygaru123();
                                    reddygaru123();




                                  },
                                  child:  Container(
                                    height: 43.0,
                                    //width: 140.0,
                                    margin: EdgeInsets.fromLTRB(3.0,0.0, 0.0, 0.0),
                                    padding: EdgeInsets.fromLTRB(12.0,0.0, 3.0, 0.0),
                                    //
                                    // height: 250.0,
                                    //  height: MediaQuery.of(context).size.height/2,
                                    //  width: 50.0,
                                    // width:MediaQuery.of(context).size.width,

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      //  color: Colors.red,
                                      // color: Color(0xff322226).withOpacity(0.7),
                                      borderRadius:new BorderRadius.only(
                                        // topLeft: new Radius.elliptical(40.0, 10.0),
                                        topRight: new Radius.circular(3.0),
                                        bottomRight: new Radius.circular(3.0),
                                        topLeft: new Radius.circular(3.0),
                                        bottomLeft: new Radius.circular(3.0),

                                      ),
                                    ),
                                    child:
                                    Align(
                                      alignment:Alignment.centerLeft,
                                      // padding: EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 7.0),
                                      child:
                                      Text("Empty Cart",
                                          style:
                                          TextStyle(fontFamily: 'Poppins-regular',fontSize:14.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1),decoration:TextDecoration.none)),

                                    ),
                                  ),
                                ),


                              ),

                            ]
                        ),
                      ),
                    ),


                  ),
                ),
              ),
            ) );
  }
  reddygaru(){
    this._overlayEntry = this._createOverlayEntry();
    Overlay.of(context).insert(this._overlayEntry);
  }
  reddygaru123(){

    this._overlayEntry.remove();
  }
  OverlayEntry _overlayEntryForFetchingDeliverySlots;
  OverlayEntry _createoverlayEntryForFetchingDeliverySlots() {




    return OverlayEntry(
        maintainState: true,
        builder: (context) =>
            Positioned( // user can't scroll when overlay is in visible
              top: 0.0,
              //    top: MediaQuery.of(context).size.height/2.25,
              right: 0.0,
              bottom: 0.0,
              left: 0.0,
              child:SafeArea(
                child:Visibility(
                  visible : true,
                  //  visible : false,

                  child:   Container(


                    decoration: BoxDecoration(

//color:Colors.red,
                      // color:Colors.transparent,
                      color: Color(0xff000000).withOpacity(0.6),
                    ),


                    child:Material(
                      color:Colors.transparent,


                      child: InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        enableFeedback: false,
                        onTap :(){
                          print("ancesters");
                          //  overlayEntry123.remove();
                        },
                        child:  Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: 88.0,
                                    margin: EdgeInsets.fromLTRB(23.0,0.0, 23.0, 0.0),
                                    //
                                    // height: 250.0,
                                    //  height: MediaQuery.of(context).size.height/2,
                                    //  width: 50.0,
                                    // width:MediaQuery.of(context).size.width,

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      //  color: Colors.red,
                                      // color: Color(0xff322226).withOpacity(0.7),
                                      borderRadius:new BorderRadius.only(
                                        // topLeft: new Radius.elliptical(40.0, 10.0),
                                        topRight: new Radius.circular(3.0),
                                        bottomRight: new Radius.circular(3.0),
                                        topLeft: new Radius.circular(3.0),
                                        bottomLeft: new Radius.circular(3.0),

                                      ),
                                    ),
                                    child:
                                    SingleChildScrollView(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:[
                                          InkWell(
                                            onTap:(){
                                              print("ancesters calling123");


                                            },
                                            child:Container(
                                              padding: EdgeInsets.fromLTRB(18.0, 21.0, .0, 12.0),
                                              child:     Row(
                                                //  mainAxisSize: MainAxisSize.min,
                                                //       mainAxisAlignment: MainAxisAlignment.start,

                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.fromLTRB(5.8, 5.8, 5.8, 5.8),
                                                      width: 45.0,
                                                      height:45.0,
                                                      decoration: BoxDecoration(
                                                        // border: Border.all(width: 1, color: Color(0xffAEADAD).withOpacity(0.68)),
                                                        border:   Border.all(width: 1.2, color: Color(0xffF2F4F7).withOpacity(1)),
                                                        color: Colors.white,
                                                        shape:BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(color: Color(0xffF2F4F7),spreadRadius: 1.0, blurRadius: 1.0),
                                                        ],

                                                      ),
                                                      child: CircularProgressIndicator(
                                                        strokeWidth : 3.2,
                                                        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffA8326D)),

                                                      ),
                                                    ),
                                                    SizedBox(width : 12.0),
                                                    Container(
                                                      // padding: EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 7.0),
                                                      child: Text("Fetching Delivery Options",
                                                          style:
                                                          TextStyle(fontFamily: 'Poppins-regular',fontSize:14.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1),decoration:TextDecoration.none)),

                                                    ), /*title and quantity close button*/


                                                  ]
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),

                                    ),
                                  ),

                                ),
                              ),

                            ]
                        ),
                      ),
                    ),


                  ),
                ),
              ),
            ) );
  }
  openFetchingDeliverySlots(){
    this._overlayEntryForFetchingDeliverySlots = this._createoverlayEntryForFetchingDeliverySlots();
    Overlay.of(context).insert(this._overlayEntryForFetchingDeliverySlots);
  }
  closeFetchingDeliverySlots(){

    this._overlayEntryForFetchingDeliverySlots.remove();
  }
  OverlayEntry _overlayEntryForShipMent;
  OverlayEntry _createOverlayEntryForShipMent() {




    return OverlayEntry(
        maintainState: true,
        builder: (context) =>
            Positioned( // user can't scroll when overlay is in visible
             /* top: 0.0,
              //    top: MediaQuery.of(context).size.height/2.25,
              right: 0.0,
              bottom: 0.0,
              left: 0.0,*/
             // bottom:62.0,
              //width: MediaQuery.of(context).size.width,
              //height: 90.0,
              child:
              Align(
                alignment: Alignment.bottomCenter,
                child:  Container(
                 // height:290.0,
                  /*constraints: new BoxConstraints(


                    minHeight: 5.0,
                    minWidth: 5.0,
                    maxHeight: MediaQuery.of(context).size.height/2,
                    // maxHeight: 150.0,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),*/
                  child: Container(
                    //visible : true,
                    //  visible : false,

                    child:
                    Container(
                      //height:90.0,
                      margin: EdgeInsets.fromLTRB(0.0,0.0, 0.0, 62.0),


                      decoration: BoxDecoration(


                       // color: Color(0xff000000).withOpacity(0.6),
                        color: Color(0xff000000).withOpacity(1.0),
                      ),


                      child: ConstrainedBox(
                        constraints: new BoxConstraints(


                          minHeight: 5.0,
                          minWidth: 5.0,
                          maxHeight: MediaQuery.of(context).size.height/2,
                          // maxHeight: 150.0,
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child:SingleChildScrollView(
                          child: Column(
                          //  mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Container(
                                padding: EdgeInsets.fromLTRB(12, 0.0 ,12.0, 0.0),
                                //  color: Colors.red,
                                 height: 63.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  //  color: Colors.green,
                                 // color: Color(0xffF1F0F0).withOpacity(1),
                                  borderRadius:new BorderRadius.only(
                                    // topLeft: new Radius.elliptical(40.0, 10.0),
                                    topRight: new Radius.circular(0.0),
                                    bottomRight: new Radius.circular(0.0),
                                    topLeft: new Radius.circular(0.0),
                                    bottomLeft: new Radius.circular(0.0),
                                  ),
                                ),
                                child:Align(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      // SvgPicture.asset('assets/Category.svg'),
                                      //Image.asset("assets/icons8-home-address-64.png", height: 38.0 , color:Color(0xff707070), ),
                                      Icon(Icons.local_shipping,color:Color(0xffffffff)),
                                      SizedBox(width: 12.0,),
                                      Expanded(
                                          flex:7,
                                          child:
                                          Text(
                                            'delivery shipment by tommorrow',
                                            // style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                                            style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w400,letterSpacing:0.1,color: Color(0xffffffff).withOpacity(1),decoration:TextDecoration.none),
                                          ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child:Container(
                                          height: MediaQuery.of(context).size.height,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                              left: BorderSide(width: 1.8, color: Color(0xff9BC317)),
                                              //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                              // bottom: BorderSide(width: 1.4, color: Color(0xffF2F7F9)),
                                            ),
                                          ),

                                          child:
                                          Material(
                                            color:Colors.transparent,
                                            child: InkWell(

                                              customBorder: new CircleBorder(),
                                              splashColor: Color(0xffD3D3D3).withOpacity(0.9),
                                              hoverColor: Color(0xffD3D3D3).withOpacity(0.9),
                                              onTap: (){

                                              },
                                              child: Icon(Icons.arrow_forward_ios, color:Color(0xffffffff), size:21.0),
                                              //Icon(Icons.arrow_back_ios, color: Color(0xffffffff),size: 25,),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                ),

                              ),
                             /* Text("Shipment1:Standard Delivery", textAlign : TextAlign.center,
                                  style:
                                  TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1),decoration:TextDecoration.none)),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                  //color: Colors.red,
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                                    //  right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                                    bottom: BorderSide(width: 1.4
                                        , color: Color(0xffF2F7F9)),
                                  ),

                                ),
                                child:  RichText(
                                  textAlign: TextAlign.center,

                                  text: TextSpan(

                                    //   style: DefaultTextStyle.of(context).style,
                                    children:[

                                      TextSpan(
                                        text: '${syncedCartItems.length} Items',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      WidgetSpan(
                                          child:SizedBox(width: 12.0,)

                                      ),


                                      TextSpan(
                                        text: 'Total : Rs ${totalpayableAmount}',
                                        style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff707070).withOpacity(1.0)),
                                      ),
                                      //  TextSpan(
                                      //     text: ' Ph: 7845874567', style: TextStyle(fontSize:12.0,fontWeight: FontWeight.bold)),






                                    ],
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ),





                    ),
                  ),
                ),

              ),
            )
    );
  }
  openOverlayEntryForShipMent(){
    this._overlayEntryForShipMent = this._createOverlayEntryForShipMent();
    Overlay.of(context).insert(this._overlayEntryForShipMent);
  }
  closeOverlayEntryForShipMent(){

    this._overlayEntryForShipMent.remove();
  }

  OverlayEntry _overlayEntry2;
  OverlayEntry _createOverlayEntry2() {




    return OverlayEntry(
        maintainState: true,
        builder: (context) =>
            Positioned( // user can't scroll when overlay is in visible
              top: 0.0,
              //    top: MediaQuery.of(context).size.height/2.25,
              right: 0.0,
              bottom: 0.0,
              left: 0.0,
              child:SafeArea(
                child:Visibility(
                  visible : true,
                  //  visible : false,

                  child:   Container(


                    decoration: BoxDecoration(

                      //color:Colors.red,
                      // color:Colors.transparent,
                      color: Color(0xffeeeeee).withOpacity(0.18),
                      // color:Colors.transparent,
                    ),





                  ),
                ),
              ),
            ) );
  }
  reddygaru2(){
    this._overlayEntry2 = this._createOverlayEntry2();
    Overlay.of(context).insert(this._overlayEntry2);
  }
  reddygaru1232(){

    this._overlayEntry2.remove();
  }
  //overlay  warnning msg for product quantity  availability
  OverlayEntry _overlayEntryForWarningMsg;
  OverlayEntry _createOverlayWarningMsg() {
    return OverlayEntry(
        maintainState: true,
        builder: (context) =>
            Positioned( // user can't scroll when overlay is in visible
              top: 0.0,
              //    top: MediaQuery.of(context).size.height/2.25,
              right: 0.0,
              bottom: 0.0,
              left: 0.0,
              child:SafeArea(
                child:  Container(


                  decoration: BoxDecoration(

//color:Colors.red,
                    color:Colors.transparent,
                  ),


                  child:Material(
                    color:Colors.transparent,

                    child: InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      enableFeedback: false,
                      onTap :(){
                        // overlayEntry123.remove();
                        _CloseWarningMsg();
                      },
                      child:  Stack(
                          children: <Widget>[
                            Positioned.fill(
                              //top: 0.0,
                              // top: MediaQuery.of(context).size.height/2.3,
                              // right: 12.0,
                              // bottom: 0.0,
                              // left: 12.0,
                              child:  Align(
                                // alignment: Alignment.bottomCenter,
                                alignment: Alignment.centerRight,
                                child:
                                Container(
                                  margin: EdgeInsets.fromLTRB(12.0,0.0, 12.0, 0.0),
                                  //height: 50.0,
                                  //
                                  // height: 250.0,
                                  //  height: MediaQuery.of(context).size.height/2,
                                  //  width: 50.0,
                                  // width:MediaQuery.of(context).size.width,

                                  decoration: BoxDecoration(

                                    //  color: Colors.white,
                                    color: Color(0xff322226).withOpacity(0.7),
                                    borderRadius:new BorderRadius.only(
                                      // topLeft: new Radius.elliptical(40.0, 10.0),
                                      topRight: new Radius.circular(7.0),
                                      bottomRight: new Radius.circular(7.0),
                                      topLeft: new Radius.circular(7.0),
                                      bottomLeft: new Radius.circular(7.0),

                                    ),
                                  ),
                                  child:
                                  SingleChildScrollView(
                                    child:     Column(
                                      //  mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 7.0),
                                            child: Text("You can not add any more quantites for this product",
                                                style:
                                                TextStyle(fontFamily: 'Poppins-regular',fontSize:14.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xffffffff).withOpacity(1),decoration:TextDecoration.none)),

                                          ), /*title and quantity close button*/
                                          /* ListView.builder(
                                        // scrollDirection: Axis.horizontal,
                                        // scrollDirection: Axis.vertical,
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: _productPropertiesandvarientsList[0]["varients"].length,
                                        itemBuilder: (context, index1) {
                                          return Visibility(
                                            visible: _productPropertiesandvarientsList[0]["varients"][index1]["userSelectVarient"]  == 0,
                                            // visible: true,
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                              decoration:BoxDecoration(

                                                // border: Border.all(width: 1.1,color: Color(0xff078C38)),
                                                border: Border(

                                                  bottom: BorderSide(width: 1.1, color: Color(0xfff2f4f7)),
                                                ),

                                              ),
                                              child: Row(
                                                children:[
                                                  Expanded(
                                                    flex:5,
                                                    child:  RichText(
                                                      text: TextSpan(
                                                        style: Theme.of(context).textTheme.body1,
                                                        children: [
                                                          /* TextSpan(text: '100kg (APP 123456 2444444)',
                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1))
                                                      ),

                                                      WidgetSpan(
                                                          child:SizedBox(width: 7.0,)

                                                      ),*/
                                                          TextSpan(text: '${_productPropertiesandvarientsList[0]["varients"][index1]["prodName"]},',
                                                              style:
                                                              TextStyle(fontFamily: 'Poppins-regular',fontSize:16.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                                          ),
                                                          TextSpan(text: ' ${_productPropertiesandvarientsList[0]["varients"][index1]["prodQuantity"]} ${_productPropertiesandvarientsList[0]["varients"][index1]["prodQuantityType"]}',
                                                              style:
                                                              TextStyle(fontFamily: 'Poppins-regular',fontSize:16.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex:1,

                                                    child:Material(
                                                      color: Color(0xffffffff),
                                                      child:  InkWell(

                                                        customBorder: new CircleBorder(),
                                                        splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                                                        hoverColor: Color(0xffB1B1B1).withOpacity(0.3),
                                                        // radius:50.0,
//borderRadius: BorderRadiusRadius.circular(50.0),
                                                        onTap: () {
                                                          overlayEntry.remove();
                                                          // showOverlay(context, 0);
                                                          //   overlayEntry?.remove();
                                                          // print("niki");
                                                          // onPressed: () =>
                                                          // _scaffoldKey.currentState.openDrawer();
                                                          //  Scaffold.of(context).openDrawer();
                                                          //  Scaffold.of(context).openDrawer();

                                                          /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );*/
                                                        },
                                                        //   Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>  Faq())),
                                                        // print("Container pressed"),



                                                        child:Container(
                                                          padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                                          child:     Icon(Icons.close,size: 21.0,color: Color(0xff707070),),
                                                        ),
                                                      ),
                                                    ),
                                                    // Icon(Icons.close,size: 21.0,color: Color(0xff707070),),
                                                  ),        ],
                                              ),
                                            ),
                                            /* Column(
                            children:[
                              //title, Quantity - QuantityComment
                              //sales price,  MRP , OfferItem Percent
                              Container(
                                padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                // margin: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        style: Theme.of(context).textTheme.body1,
                                        children: [
                                          /* TextSpan(text: '100kg (APP 123456 2444444)',
                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1))
                                                      ),

                                                      WidgetSpan(
                                                          child:SizedBox(width: 7.0,)

                                                      ),*/
                                          TextSpan(text: '${_productPropertiesandvarientsList[0]["varients"][index1]["prodName"]},',
                                              style:
                                              TextStyle(fontFamily: 'Poppins-regular',fontSize:18.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                          ),
                                          TextSpan(text: ' ${_productPropertiesandvarientsList[0]["varients"][index1]["prodQuantity"]} ${_productPropertiesandvarientsList[0]["varients"][index1]["prodQuantityType"]}',
                                              style:
                                              TextStyle(fontFamily: 'Poppins-regular',fontSize:18.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                          ),
                                        /*  TextSpan(text: _productPropertiesandvarientsList[index]["varients"][index1]["quantityComment"] == ""? "": ' -(${_productPropertiesandvarientsList[index]["varients"][index1]["quantityComment"]})',
                                              style:
                                              TextStyle(fontFamily: 'Poppins-regular',fontSize:18.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                          ),*/
                                        ],
                                      ),
                                    ),

                                    /*Out of stock*/
                                    /* Container(

                                margin: EdgeInsets.fromLTRB(0.0, 21.0, 0.0, 0.0),
                                width: MediaQuery.of(context).size.width,
                                decoration:BoxDecoration(
color:Colors.white,

                                 // border: Border.all(width: 0.0,color: Color(0xff707070).withOpacity(0.15)),
                                  border: Border(
                                    // top: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                                    //  left: BorderSide(width: 0.0, color: Color(0xFFFFFFFFFF)),
                                    //right: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                                    top: BorderSide(width: 1.4, color: Color(0xff707070).withOpacity(0.15)),
                                  ),

                                ),
                                child:Align(
                                  alignment: Alignment.center,
                               child: Container(


                                  padding: EdgeInsets.fromLTRB(4.5, 4.5, 4.5, 4.5),
                                  decoration:BoxDecoration(
                                    color:Color(0xff707070).withOpacity(0.15),
                                    borderRadius:new BorderRadius.only(
                                      // topLeft: new Radius.elliptical(40.0, 10.0),
                                      topRight: new Radius.circular(0.0),
                                      bottomRight: new Radius.circular(5.0),

                                      topLeft: new Radius.circular(0.0),
                                      bottomLeft: new Radius.circular(5.0),
                                    ),
                                //    border: Border.all(width: 0.0,color: Color(0xff707070).withOpacity(0.15)),

                                  ),
                                  child:Text("Out of Stock",
                                      style:     TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w400,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1),)),

                                ),
        ),
                              )*/
                                  ],
                                ),

                              ),

                            ],
                          ),
                          */
                                          );

                                          /* Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                constraints: BoxConstraints(minWidth: 70, maxWidth: 90),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color:  Colors.blue,
                                   borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,)
                            )
                          ],
                        );*/
                                          /* return
                        Card(

                          elevation: 1.5,
                          // color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(3),
                            splashColor: Color(0xffA8326D),
                            highlightColor: Color(0xffA8326D),

                            onTap: (){
                              _ActivateTheTab(index);

                            },
                            child:

                            Container(
                              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                              height: 72,
                           //  width: 79.0,




                              child: Center(
                                child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: _FishMeatEggActiveTab  == index ? Color(0xffA8326D).withOpacity(1.0) : Color(0xff464741).withOpacity(1.0))),
                              ),
                            ),
                          ),
                        );*/
                                          /*  InkWell(
                          splashColor: Colors.red,
                          highlightColor: Colors.red,
                          onTap: (){

                          },
                         child:  Container(
                           color: Color(0xff078c38),
                           padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                           child: Center(
                             child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                                 style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: Color(0xff464741).withOpacity(1.0))),
                           ),
                         ),
                       /*  Container(

                         // color: Color(0xffD3D3D3),

                         // width: 90.0,
                         // height: 90.0,
                          child: Container(

                            child:
                            Container(
                              color: Color(0xff078c38),
                              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                          child: Center(
                       child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                           style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: Color(0xff464741).withOpacity(1.0))),
                          ),
                        ),
                        ),
                        ),*/
                        );*/
                                        },
                                      ),
                                      //static data
                                      /*  Container(
                      padding: EdgeInsets.fromLTRB(9.0, 9.0, 9.0, 9.0),
                      decoration:BoxDecoration(

                        // border: Border.all(width: 1.1,color: Color(0xff078C38)),
                        border: Border(

                          bottom: BorderSide(width: 1.1, color: Color(0xfff2f4f7)),
                        ),

                      ),
                      child:
                      Row(
                        children:[
                          Expanded(
                            flex:5,
                            child:  RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.body1,
                                children: [
                                  /* TextSpan(text: '100kg (APP 123456 2444444)',
                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1))
                                                      ),

                                                      WidgetSpan(
                                                          child:SizedBox(width: 7.0,)

                                                      ),*/
                                  TextSpan(text: 'Boneless Filet 500g Pack,',
                                      style:
                                      TextStyle(fontFamily: 'Poppins-regular',fontSize:16.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                  ),
                                  TextSpan(text: ' 5 kg',
                                      style:
                                      TextStyle(fontFamily: 'Poppins-regular',fontSize:16.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                  ),
                                  TextSpan(text: ' -(approx.800 to 880g)',
                                      style:
                                      TextStyle(fontFamily: 'Poppins-regular',fontSize:16.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex:1,

                            child:Material(
                              color: Color(0xffffffff),
                          child:  InkWell(

                              customBorder: new CircleBorder(),
                              splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                              hoverColor: Color(0xffB1B1B1).withOpacity(0.3),
                              // radius:50.0,
//borderRadius: BorderRadiusRadius.circular(50.0),
                              onTap: () {
                               // showOverlay(context, 0);
                             //   overlayEntry?.remove();
                                // print("niki");
                                // onPressed: () =>
                                // _scaffoldKey.currentState.openDrawer();
                                //  Scaffold.of(context).openDrawer();
                                //  Scaffold.of(context).openDrawer();

                                /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );*/
                              },
                              //   Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>  Faq())),
                              // print("Container pressed"),



                              child:Container(
                                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                child:     Icon(Icons.close,size: 21.0,color: Color(0xff707070),),
                              ),
                            ),
        ),
                            // Icon(Icons.close,size: 21.0,color: Color(0xff707070),),
                          ),        ],
                      ),
                    ),
                    */
                                      ConstrainedBox(
                                        constraints: new BoxConstraints(

                                          minHeight: 5.0,
                                          minWidth: 5.0,
                                          maxHeight: MediaQuery.of(context).size.height/2,
                                          maxWidth: MediaQuery.of(context).size.width,
                                        ),

                                        child:   Container(
                                          padding: EdgeInsets.fromLTRB(9.0, 9.0, 9.0, 9.0),
                                          // height: 250.0,
                                          //   height: MediaQuery.of(context).size.height/2,
                                          // height: double.infinity,
                                          //  width: 50.0,
                                          //  width:MediaQuery.of(context).size.width,
                                          child:SingleChildScrollView(
                                            child:
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                /*    Text("Pack Sizes0",style: TextStyle(decoration: TextDecoration.none),),*/
                                                Container(
                                                  child:  Text(" item limit",
                                                      style: TextStyle(fontFamily: 'Poppins-regular',fontSize:16.0,fontWeight:FontWeight.w500,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1),decoration: TextDecoration.none)),
                                                ),
                                                /*  ListView.builder(
                            // scrollDirection: Axis.horizontal,
                            // scrollDirection: Axis.vertical,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return
                                new Container(
                                  margin:   EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 9.0),
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 9.0, 3.0),
                                  decoration: BoxDecoration(
                                    // color: Color(0xffAEADAD).withOpacity(0.68),
                                    border: Border.all(width: 1, color: Color(0xffAEADAD).withOpacity(0.68)),
                                    // border: Border.all(width: 1, color: Color(0xffA8326D).withOpacity(1)),
                                    borderRadius:new BorderRadius.only(
                                      // topLeft: new Radius.elliptical(40.0, 10.0),
                                      topRight: new Radius.circular(5.0),
                                      bottomRight: new Radius.circular(5.0),
                                      topLeft: new Radius.circular(5.0),
                                      bottomLeft: new Radius.circular(5.0),

                                    ),

                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.fromLTRB(4.5, 0.5, 5.5, 0.5),

                                        decoration:BoxDecoration(
                                          color:Color(0xff9BC317),
                                          borderRadius:new BorderRadius.only(
                                            // topLeft: new Radius.elliptical(40.0, 10.0),
                                            topRight: new Radius.circular(0.0),
                                            bottomRight: new Radius.circular(5.0),

                                            topLeft: new Radius.circular(5.0),
                                            bottomLeft: new Radius.circular(0.0),
                                          ),
                                          border: Border.all(width: 1.1,color: Color(0xff9BC317)),

                                        ),
                                        child:Text("20% off",
                                            style:
                                            TextStyle(fontFamily: 'OpenSans',fontSize:9.2,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xffffffff).withOpacity(1))),


                                      ),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex:2,
                                            child:Container(
                                              padding: EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                                              child:  Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("1kg",
                                                      style:  TextStyle(fontFamily: 'OpenSans',fontSize:13.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff322226).withOpacity(0.91))),


                                                ],
                                              ),
                                            ),


                                          ),
                                          Expanded(
                                            flex:2,
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                RichText(

                                                  text: TextSpan(
                                                    style: Theme.of(context).textTheme.body1,
                                                    children: [
                                                      /* TextSpan(text: '100kg (APP 123456 2444444)',
                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1))
                                                      ),

                                                      WidgetSpan(
                                                          child:SizedBox(width: 7.0,)

                                                      ),*/
                                                      TextSpan(text: 'RS 160',
                                                          style:
                                                          TextStyle(fontFamily: 'OpenSans',fontSize:13.0,fontWeight:FontWeight.w700,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    style: Theme.of(context).textTheme.body1,
                                                    children: [
                                                      /* TextSpan(text: '100kg (APP 123456 2444444)',
                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1))
                                                      ),

                                                      WidgetSpan(
                                                          child:SizedBox(width: 7.0,)

                                                      ),*/
                                                      TextSpan(text: 'MRP :',
                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:13.0,fontWeight:FontWeight.w400,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1))
                                                      ),
                                                      WidgetSpan(
                                                          child:SizedBox(width: 7.0,)

                                                      ),
                                                      TextSpan(text: 'Rs 1200', style: TextStyle(fontFamily: 'OpenSans',fontSize:13.0,fontWeight:FontWeight.w400,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1),decoration:TextDecoration.lineThrough,decorationThickness: 2.1,)
                                                      ),
                                                    ],
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex:2,
                                            child: Align(
                                              alignment: Alignment.centerRight,

                                              child:
                                              Column(
                                                children:[
                                                  Visibility(
                                                    visible:false,
                                                    child:
                                                  ButtonTheme(
                                                      minWidth: 55.0,
                                                      height: 32.0,



                                                      child:  FlatButton(

                                                          color: Color(0xffA8326D),
                                                          textColor: Colors.white,
                                                          disabledColor: Colors.grey,
                                                          disabledTextColor: Colors.black,
                                                          padding: EdgeInsets.all(0.0),
                                                          // splashColor: Colors.blueAccent,
                                                          splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0),
                                                            //  side: BorderSide(color: Colors.red)
                                                          ),
                                                          onPressed: () {
                                                            // personalDetails();
                                                            // this._showPersonalDetails = true;
                                                            print("onpressed edit name");
                                                            setState(() {
                                                              _AddQuantity(4);

                                                            });
                                                            /*...*/
                                                          },
                                                          child:Text("ADD",
                                                            style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,color: Color(0xffffffff)),)



                                                      )
                                                  ),
                              ),
                                                  Visibility(
                                                    visible:true,
                                                    child:
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                      ///  mainAxisSize: MainAxisSize.max,
                                                      // mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        ButtonTheme(
                                                            minWidth: 25.0,
                                                            height: 25.0,


                                                            child:  FlatButton(

                                                              color: Color(0xffffffff),
                                                              textColor: Color(0xffffffff),
                                                              disabledColor: Colors.grey,
                                                              disabledTextColor: Colors.black,
                                                              //  hoverColor: Colors.red,
                                                              padding: EdgeInsets.all(0.0),
                                                              // splashColor: Colors.blueAccent,
                                                              splashColor: Color(0xff14BBBC).withOpacity(1.0),
                                                              // shape:CircleBorder(),
                                                              shape: RoundedRectangleBorder(

                                                                  borderRadius: new BorderRadius.circular(5.0),
                                                                  side: BorderSide(width: 1.05,color: Color(0xffA8326D))
                                                              ),
                                                              /* shape: RoundedRectangleBorder(

                                                                            borderRadius: new BorderRadius.circular(5.0),
                                                                            side: BorderSide(width: 1.0,color: Color(0xffA8326D))
                                                                        ),*/
                                                              onPressed: () {

                                                              },
                                                              /*   child:Text("\2212",
                                                                         style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w600,color: Color(0xffffffff)),)*/
                                                              child: Icon(Icons.remove, color:Color(0xffA8326D),size:17.1),

                                                            )
                                                        ),
                                                        SizedBox(width:1.0),
                                                        Flexible(
                                                          //  Text('Row1jhgygygy hgjhgjh  hbhb h hgyfyj', overflow: TextOverflow.ellipsis,),
                                                          // fit: FlexFit.loose,
                                                          child: Text(
                                                              "1",                                                        softWrap: false,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w600,color: Color(0xffA8326D))
                                                          ),
                                                        ),
                                                        SizedBox(width:1.0),
                                                        ButtonTheme(
                                                            minWidth: 25.0,
                                                            height: 25.0,


                                                            child:  FlatButton(

                                                              color: Color(0xffffffff),
                                                              textColor: Color(0xffffffff),
                                                              disabledColor: Colors.grey,
                                                              disabledTextColor: Colors.black,
                                                              padding: EdgeInsets.all(0.0),
                                                              // splashColor: Colors.blueAccent,
                                                              splashColor: Color(0xffD3D3D3).withOpacity(1.0),
                                                              // shape:CircleBorder(),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: new BorderRadius.circular(5.0),
                                                                  side: BorderSide(width:1.05,color: Color(0xffA8326D))
                                                              ),
                                                              onPressed: () {

                                                              },
                                                              child: Icon(Icons.add, color:Color(0xffA8326D),size:17.1),


                                                              /* child: Text(
                              "Flat Button",
                              style: TextStyle(fontSize: 20.0),
                            ),*/
                                                            )
                                                        ),
                                                        // Text('Rh',overflow: TextOverflow.fade,)

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),


                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              /* Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                constraints: BoxConstraints(minWidth: 70, maxWidth: 90),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color:  Colors.blue,
                                   borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,)
                            )
                          ],
                        );*/
                              /* return
                        Card(

                          elevation: 1.5,
                          // color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(3),
                            splashColor: Color(0xffA8326D),
                            highlightColor: Color(0xffA8326D),

                            onTap: (){
                              _ActivateTheTab(index);

                            },
                            child:

                            Container(
                              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                              height: 72,
                           //  width: 79.0,




                              child: Center(
                                child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: _FishMeatEggActiveTab  == index ? Color(0xffA8326D).withOpacity(1.0) : Color(0xff464741).withOpacity(1.0))),
                              ),
                            ),
                          ),
                        );*/
                              /*  InkWell(
                          splashColor: Colors.red,
                          highlightColor: Colors.red,
                          onTap: (){

                          },
                         child:  Container(
                           color: Color(0xff078c38),
                           padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                           child: Center(
                             child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                                 style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: Color(0xff464741).withOpacity(1.0))),
                           ),
                         ),
                       /*  Container(

                         // color: Color(0xffD3D3D3),

                         // width: 90.0,
                         // height: 90.0,
                          child: Container(

                            child:
                            Container(
                              color: Color(0xff078c38),
                              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                          child: Center(
                       child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                           style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: Color(0xff464741).withOpacity(1.0))),
                          ),
                        ),
                        ),
                        ),*/
                        );*/
                            },
                          ),

*/
                                                /*API VARIENTS*/
                                                ListView.builder(
                                                  // scrollDirection: Axis.horizontal,
                                                  // scrollDirection: Axis.vertical,
                                                  physics: ClampingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: _productPropertiesandvarientsList[0]["varients"].length,
                                                  itemBuilder: (context, index1) {
                                                    return
                                                      new
                                                      Container(
                                                        margin:   EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 9.0),
                                                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 9.0, 0.0),
                                                        decoration: BoxDecoration(
                                                          // color: Color(0xffAEADAD).withOpacity(0.68),
                                                          // border: Border.all(width: 1, color: Color(0xffAEADAD).withOpacity(0.68)),
                                                          // border: Border.all(width: 1, color: Color(0xffA8326D).withOpacity(1)),
                                                          border: _productPropertiesandvarientsList[0]["varients"][index1]["userSelectVarient"]  == 0 ? Border.all(width: 1, color: Color(0xffA8326D).withOpacity(1)): Border.all(width: 1, color: Color(0xffAEADAD).withOpacity(0.68)),
                                                          borderRadius:new BorderRadius.only(
                                                            // topLeft: new Radius.elliptical(40.0, 10.0),
                                                            topRight: new Radius.circular(5.0),
                                                            bottomRight: new Radius.circular(5.0),
                                                            topLeft: new Radius.circular(5.0),
                                                            bottomLeft: new Radius.circular(5.0),

                                                          ),

                                                        ),
                                                        child: Material(
                                                          color:Color(0xffffffff),
                                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                                          child:     InkWell(
                                                            onTap: (){
                                                              setState(() {


                                                                _UserSelectedVarient(_productPropertiesandvarientsList[0]["varients"][index1]["variantId"]);
                                                                overlayEntry.markNeedsBuild(); //update the status Immediately

                                                              });
                                                            },
                                                            child:   Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Visibility(
                                                                  visible:_productPropertiesandvarientsList[0]["varients"][index1]["offerItemPercent"] > 0,
                                                                  child:Container(
                                                                    padding: EdgeInsets.fromLTRB(4.5, 0.5, 5.5, 0.5),

                                                                    decoration:BoxDecoration(
                                                                      color:Color(0xff9BC317),
                                                                      borderRadius:new BorderRadius.only(
                                                                        // topLeft: new Radius.elliptical(40.0, 10.0),
                                                                        topRight: new Radius.circular(0.0),
                                                                        bottomRight: new Radius.circular(5.0),

                                                                        topLeft: new Radius.circular(5.0),
                                                                        bottomLeft: new Radius.circular(0.0),
                                                                      ),
                                                                      border: Border.all(width: 1.1,color: Color(0xff9BC317)),

                                                                    ),
                                                                    child:Text("${_productPropertiesandvarientsList[0]["varients"][index1]["offerItemPercent"]}% off",
                                                                        style:
                                                                        TextStyle(fontFamily: 'OpenSans',fontSize:9.2,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xffffffff).withOpacity(1))),


                                                                  ),
                                                                ),

                                                                Container(
                                                                  // color:Colors.red,
                                                                  child:       Row(
                                                                    crossAxisAlignment: _productPropertiesandvarientsList[0]["varients"][index1]["offerItemPercent"] > 0 ? CrossAxisAlignment.start :CrossAxisAlignment.center,
                                                                    children: <Widget>[
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:Container(
                                                                          padding: EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                                                                          child:  Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: <Widget>[
                                                                              Text("${_productPropertiesandvarientsList[0]["varients"][index1]["prodQuantity"]} ${_productPropertiesandvarientsList[0]["varients"][index1]["prodQuantityType"]}",
                                                                                  style:  TextStyle(fontFamily: 'OpenSans',fontSize:13.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff322226).withOpacity(0.91))),


                                                                            ],
                                                                          ),
                                                                        ),

                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: <Widget>[
                                                                            RichText(
                                                                              text: TextSpan(
                                                                                style: Theme.of(context).textTheme.body1,
                                                                                children: [
                                                                                  /* TextSpan(text: '100kg (APP 123456 2444444)',
                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1))
                                                      ),

                                                      WidgetSpan(
                                                          child:SizedBox(width: 7.0,)

                                                      ),*/
                                                                                  TextSpan(text: 'RS ${_productPropertiesandvarientsList[0]["varients"][index1]["mrp"]}',
                                                                                      style:
                                                                                      TextStyle(fontFamily: 'OpenSans',fontSize:13.0,fontWeight:FontWeight.w700,letterSpacing:0.1,color: Color(0xff322226).withOpacity(1))
                                                                                  ),

                                                                                ],
                                                                              ),
                                                                            ),
                                                                            RichText(
                                                                              text: TextSpan(
                                                                                style: Theme.of(context).textTheme.body1,
                                                                                children: [
                                                                                  /* TextSpan(text: '100kg (APP 123456 2444444)',
                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1))
                                                      ),

                                                      WidgetSpan(
                                                          child:SizedBox(width: 7.0,)

                                                      ),*/
                                                                                  TextSpan(text: 'MRP :',
                                                                                      style: TextStyle(fontFamily: 'OpenSans',fontSize:13.0,fontWeight:FontWeight.w400,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1))
                                                                                  ),
                                                                                  WidgetSpan(
                                                                                      child:SizedBox(width: 7.0,)

                                                                                  ),
                                                                                  TextSpan(text: 'Rs ${_productPropertiesandvarientsList[0]["varients"][index1]["salePrice"]}', style: TextStyle(fontFamily: 'OpenSans',fontSize:13.0,fontWeight:FontWeight.w400,letterSpacing:0.1,color: Color(0xff707070).withOpacity(1),decoration:TextDecoration.lineThrough,decorationThickness: 2.1,)
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),


                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                        /*  Align(
                                                alignment: Alignment.centerRight,

                                                child:*/
                                                                        Container(
                                                                          //   color: Color(0xff078c38),
                                                                          child:   Column(
                                                                            //  mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                            children:[
                                                                              Visibility(
                                                                                visible:_productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"] == 0,
                                                                                child:
                                                                                ButtonTheme(
                                                                                    minWidth: 55.0,
                                                                                    height: 32.0,



                                                                                    child:  FlatButton(

                                                                                        color: Color(0xffA8326D),
                                                                                        textColor: Colors.white,
                                                                                        disabledColor: Colors.grey,
                                                                                        disabledTextColor: Colors.black,
                                                                                        padding: EdgeInsets.all(0.0),
                                                                                        // splashColor: Colors.blueAccent,
                                                                                        splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: new BorderRadius.circular(5.0),
                                                                                          //  side: BorderSide(color: Colors.red)
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          // personalDetails();
                                                                                          // this._showPersonalDetails = true;
                                                                                          print("onpressed edit name");
                                                                                          setState(() {
                                                                                            //   _AddQuantity(4);
                                                                                            _productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"] = _productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"] + 1;
                                                                                            _UserSelectedVarient(_productPropertiesandvarientsList[0]["varients"][index1]["variantId"]);
                                                                                            overlayEntry.markNeedsBuild();
                                                                                          });
                                                                                          /*...*/
                                                                                        },
                                                                                        child:Text("ADD",
                                                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,color: Color(0xffffffff)),)



                                                                                    )
                                                                                ),
                                                                              ),
                                                                              Visibility(
                                                                                // visible:true,
                                                                                visible:_productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"] >  0,
                                                                                child:
                                                                                Row(
                                                                                  // mainAxisAlignment: MainAxisAlignment.end,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  //   mainAxisSize: MainAxisSize.max,
                                                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[

                                                                                    Expanded(
                                                                                      child:       ButtonTheme(
                                                                                          minWidth: 32.0,
                                                                                          height: 32.0,


                                                                                          child:  FlatButton(

                                                                                            color: Color(0xffffffff),
                                                                                            textColor: Color(0xffffffff),
                                                                                            disabledColor: Colors.grey,
                                                                                            disabledTextColor: Colors.black,
                                                                                            //  hoverColor: Colors.red,
                                                                                            padding: EdgeInsets.all(0.0),
                                                                                            // splashColor: Colors.blueAccent,
                                                                                            splashColor: Color(0xffA8326D).withOpacity(1.0),
                                                                                            // shape:CircleBorder(),
                                                                                            shape: RoundedRectangleBorder(

                                                                                                borderRadius: new BorderRadius.circular(5.0),
                                                                                                side: BorderSide(width: 1.05,color: Color(0xffA8326D))
                                                                                            ),
                                                                                            /* shape: RoundedRectangleBorder(

                                                                            borderRadius: new BorderRadius.circular(5.0),
                                                                            side: BorderSide(width: 1.0,color: Color(0xffA8326D))
                                                                        ),*/
                                                                                            onPressed: () {
                                                                                              setState(() {
                                                                                                //   _AddQuantity(4);
                                                                                                _productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"] = _productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"] - 1;
                                                                                                _UserSelectedVarient(_productPropertiesandvarientsList[0]["varients"][index1]["variantId"]);
                                                                                                overlayEntry.markNeedsBuild();
                                                                                              });
                                                                                            },
                                                                                            /*   child:Text("\2212",
                                                                         style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w600,color: Color(0xffffffff)),)*/
                                                                                            child: Icon(Icons.remove, color:Color(0xffA8326D),size:17.1),

                                                                                          )
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width:3.0),
                                                                                    Expanded(
                                                                                      child:
                                                                                      Text(
                                                                                          "${ _productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"]}"
                                                                                          ,                                                        softWrap: true,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w600,color: Color(0xffA8326D))
                                                                                      ),
                                                                                    ),
                                                                                    /*  Flexible(
                                                            //  Text('Row1jhgygygy hgjhgjh  hbhb h hgyfyj', overflow: TextOverflow.ellipsis,),
                                                            // fit: FlexFit.loose,
                                                            child:
                                                            Text(
                                                                "${ _productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"]}",                                                        softWrap: false,
                                                               // overflow: TextOverflow.ellipsis,
                                                                style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w600,color: Color(0xffA8326D))
                                                            ),
                                                          ),*/
                                                                                    SizedBox(width:3.0),
                                                                                    Expanded(
                                                                                      child:
                                                                                      ButtonTheme(
                                                                                          minWidth: 32.0,
                                                                                          height: 32.0,


                                                                                          child:  FlatButton(

                                                                                            color: Color(0xffffffff),
                                                                                            textColor: Color(0xffffffff),
                                                                                            disabledColor: Colors.grey,
                                                                                            disabledTextColor: Colors.black,
                                                                                            padding: EdgeInsets.all(0.0),
                                                                                            // splashColor: Colors.blueAccent,
                                                                                            splashColor: Color(0xffA8326D).withOpacity(1.0),
                                                                                            // shape:CircleBorder(),
                                                                                            shape: RoundedRectangleBorder(
                                                                                                borderRadius: new BorderRadius.circular(5.0),
                                                                                                side: BorderSide(width:1.05,color: Color(0xffA8326D))
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              setState(() {
                                                                                                //   _AddQuantity(4);
                                                                                                _productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"] = _productPropertiesandvarientsList[0]["varients"][index1]["useraddQuantity"] + 1;
                                                                                                _UserSelectedVarient(_productPropertiesandvarientsList[0]["varients"][index1]["variantId"]);
                                                                                                overlayEntry.markNeedsBuild();
                                                                                              });
                                                                                            },
                                                                                            child: Icon(Icons.add, color:Color(0xffA8326D),size:17.1),


                                                                                            /* child: Text(
                              "Flat Button",
                              style: TextStyle(fontSize: 20.0),
                            ),*/
                                                                                          )
                                                                                      ),
                                                                                    ),
                                                                                    // Text('Rh',overflow: TextOverflow.fade,)

                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        /* Container(
                                                    padding: EdgeInsets.fromLTRB(3.8, 3.8, 3.8, 3.8),
                                                    width: 18.0,
                                                    height:18.0,
                                                    decoration: BoxDecoration(
                                                      // border: Border.all(width: 1, color: Color(0xffAEADAD).withOpacity(0.68)),
                                                      border: _productPropertiesandvarientsList[0]["varients"][index1]["userSelectVarient"]  == 0 ? Border.all(width: 1, color: Color(0xffA8326D).withOpacity(1)): Border.all(width: 1, color: Color(0xffAEADAD).withOpacity(0.68)),
                                                      color: Colors.white,
                                                      shape:BoxShape.circle,

                                                    ),
                                                    child:Visibility(
                                                      visible: _productPropertiesandvarientsList[0]["varients"][index1]["userSelectVarient"] == 0,
                                                      child:
                                                      Container(
                                                        width: 5.0,
                                                        height:5.0
                                                        ,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xff9BC317),
                                                          //color: this.niki == 1
                                                          //    ? Color(0xff2185FB): Colors.white,
                                                          // color:condition? Text("True"): null,
                                                          shape:BoxShape.circle,

                                                        ),

                                                      ),
                                                    )

                                                ),*/
                                                                        // ),


                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );

                                                    /* Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                constraints: BoxConstraints(minWidth: 70, maxWidth: 90),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color:  Colors.blue,
                                   borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,)
                            )
                          ],
                        );*/
                                                    /* return
                        Card(

                          elevation: 1.5,
                          // color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(3),
                            splashColor: Color(0xffA8326D),
                            highlightColor: Color(0xffA8326D),

                            onTap: (){
                              _ActivateTheTab(index);

                            },
                            child:

                            Container(
                              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                              height: 72,
                           //  width: 79.0,




                              child: Center(
                                child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: _FishMeatEggActiveTab  == index ? Color(0xffA8326D).withOpacity(1.0) : Color(0xff464741).withOpacity(1.0))),
                              ),
                            ),
                          ),
                        );*/
                                                    /*  InkWell(
                          splashColor: Colors.red,
                          highlightColor: Colors.red,
                          onTap: (){

                          },
                         child:  Container(
                           color: Color(0xff078c38),
                           padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                           child: Center(
                             child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                                 style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: Color(0xff464741).withOpacity(1.0))),
                           ),
                         ),
                       /*  Container(

                         // color: Color(0xffD3D3D3),

                         // width: 90.0,
                         // height: 90.0,
                          child: Container(

                            child:
                            Container(
                              color: Color(0xff078c38),
                              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                          child: Center(
                       child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                           style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: Color(0xff464741).withOpacity(1.0))),
                          ),
                        ),
                        ),
                        ),*/
                        );*/
                                                  },
                                                ),

                                              ],

                                            ),
                                          ),

                                        ),
                                      ),*/

                                          /*    Text("Any changes you made on the address from will be lost",textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w400,color: Color(0xff322226).withOpacity(0.49))),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
                  child:  Row(
                    // margin: EdgeInsets.fromLTRB(11.5, 0.0, 11.5, 0.0),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      Expanded(
                        //  child: Text("Are you sure you want to leave? ")
                        child:Container(
                          height: 52.0,
                          // padding: EdgeInsets.all(9.0),
                          padding: EdgeInsets.fromLTRB(0, 5, 7, 5),
                          //  color: Colors.red,
                          child: new

                          FlatButton(
                            // color: Colors.red,
                            // child: new Text("niki"),
                            // color: Color(0xffA8326D),
                            splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                            child: new Text("Leave",
                                style: TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w600,color: Color(0xff352529))
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              /* side: BorderSide(
                                    color:1 == 1 ?
                                    Color(0xffF50000).withOpacity(0.81):Color(0xff707070),width: 1.2,
                                  )*/
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        // child: Text("Are you sure you want to leave? ")
                        child:new
                        Container(
                          height: 52.0,
                          padding: EdgeInsets.fromLTRB(7, 5, 0, 5),
                          //color: Colors.green,
                          child: FlatButton(
                            // color: Colors.green,
                            color: Color(0xffA8326D),
                            splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                            child: new Text("Stay",
                                style: TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w600,color: Colors.white)
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              /* side: BorderSide(
                                    color:1 == 1 ?
                                    Color(0xffF50000).withOpacity(0.81):Color(0xff707070),width: 1.2,
                                  )*/
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ), */

                                        ]
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),


                ),
              ),
            ) );
  }
  _ShowWarningMsg() async{
    this._overlayEntryForWarningMsg = this._createOverlayWarningMsg();
    Overlay.of(context).insert(this._overlayEntryForWarningMsg);
    await Future.delayed(Duration(seconds: 3));
    _CloseWarningMsg();
  }
  _CloseWarningMsg(){
    print("closewarning msg");
    this. _overlayEntryForWarningMsg.remove();
  }

  
  /*getUserAddPoductsList()async{
    await databaseforproductlist.openDb(); //open DB
    Database db = databaseforproductlist.getalluseraddproducts();
    // Database db = databaseforproductlist.databaseforproductlist;
    List<Map<String, dynamic>> testing = await db.query('table_name_userselectedproducts', columns: ["categoryId", "categoryName",] , distinct:true, orderBy: "categoryId ASC");
    print(testing);

    print(testing.length);
    List.generate(testing.length, (i) {
      emptyarray1.add(testing[i]);


    });

    // final List<Map<String, dynamic>> nikithareddy1 = await databaseforproductlist.query('table_name_userselectedproducts', orderBy: "categoryId ASC");
    // print(nikithareddy1);
    // print(nikithareddy1.length);
    for(var i=0; i<emptyarray1.length; i++){
      emptyarray2 =[]; //for each index clear array
      final List<Map<String, dynamic>> testing1 = await db.query('table_name_userselectedproducts', where: "categoryId = ?", whereArgs: [testing[i]["categoryId"]]);
      print(testing1);
      print("testing1");
      print(testing1.runtimeType);
      print(testing1.length);
      List.generate(testing1.length, (i) {
        emptyarray2.add(testing1[i]);


      });

      // print(niki);
      // print(niki.runtimeType);
      // return;
      //   setState((){
      //  niki.add({"categoryId":testing[i]["categoryId"],"categoryName":testing[i]["categoryName"],"items": testing1});
      //  });
      setState((){
        niki.add({"categoryId":emptyarray1[i]["categoryId"],"categoryName":emptyarray1[i]["categoryName"],"items": emptyarray2});
      });



    }
    print("niki");
    //totalpayableAmount and totalsavedAmount
    for(var i=0; i < niki.length; i++){
      for(var n=0; n <niki[i]["items"].length; n++ ){
        setState((){
          totalpayableAmount = totalpayableAmount+ niki[i]["items"][n]["salePrice"];
          print(" totalpayableAmount");
          print( totalpayableAmount);
          totalsavedAmount = totalsavedAmount+ niki[i]["items"][n]["offerAmount"];
        });

      }
    }

    print(niki);
    print(niki.length);
  }
  clearcart() async{
    await databaseforproductlist.openDb(); //open DB
    Database db = databaseforproductlist.deleteallproducts();
    await db.delete(
      'table_name_userselectedproducts',

    );
    final List<Map<String, dynamic>> nikithareddy = await db.query('table_name_userselectedproducts');
    print("nikithareddy intial delete");
    print(nikithareddy);
    print("123456reddy");
    print("123456reddy123");
    print("niki");
    setState((){
      niki = [];
    });
    //reddygaru1231();
    //return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Emptycart()),
    );
    // databaseforproductlist.deleteAllProducts();
  }
  removeItemFromCart(itemvarientId) async{



    setState((){
      varienIdforLoader = itemvarientId; //show loader
      reddygaru2();  //show overlay

      // databaseforproductlist.deleteProductItem(itemvarientId);
    });
    await databaseforproductlist.openDb(); //open DB
    Database db = databaseforproductlist.deleteoneproduct();

    await db.delete(
        'table_name_userselectedproducts',
        where: "variantId = ?", whereArgs: [itemvarientId]
    );
    
    reddygaru1232(); //remove the overlay for delete
    setState((){
      varienIdforLoader=0; //hide the loader
    });
    //delete the item from local array
    for(var i=0; i < niki.length; i++){
      for(var n=0; n< niki[i]["items"].length; n++){
        if(niki[i]["items"][n]["variantId"] == itemvarientId){
          setState((){
            niki[i]["items"].removeAt(n);
          });



        }

      }
    }
    //totalpayableAmount and totalsavedAmount
    totalpayableAmount = 0;
    totalsavedAmount = 0;
    for(var i=0; i < niki.length; i++){
      for(var n=0; n <niki[i]["items"].length; n++ ){
        setState((){
          totalpayableAmount = totalpayableAmount+ niki[i]["items"][n]["salePrice"];
          totalsavedAmount = totalsavedAmount+ niki[i]["items"][n]["offerAmount"];
        });

      }
    }
    //if totalpayableAmount is zero go to empty cart
    if(totalpayableAmount == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Emptycart()),
      );


    }





  }
  //update*/
   _onItemTapped(int index)async {
    print("checking index reddy");
    print(index);
    //index 0 go to Landing page
    if(index == 0){
   

    }
    //index 1 go to ShopbyCategory
    if(index == 1){
    
    }
    //index 2 go to Product Search
    if(index == 2){
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('url', "https://www.youtube.com/");//set userTypedText  to empty string
    Navigator.pushNamed(
              context,
              '/login1',
            );

   /*   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PrdouctSearch()),
      );*/
    }
    //index 3 go to Account
    if(index == 3){
     // SharedPreferences prefs = await SharedPreferences.getInstance();
    /*  if(prefs.getString('is_logged_in') == "1"){ //user logged in (go to my account page)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyAccountPage()),
        );

      }
      else{ //user not logged in (go to generallogin page)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GeneralLoginPage(),
              settings: RouteSettings(name: '/myaccountpage')),
        );

      }*/
    }
    //index 4 go to emptyCart or reviewCart based on cart items Count
    if(index == 4){
     
    }
  }


 
 

  @override
  void initState() {
    setState(() {

      _c = new TextEditingController();

      for(int i=0;i<_categoryBy.length;i++){
        // inputs.add("Name ${i}");
        inputs.add(false);
      }
      _UserSearchedBrands = _BrandIdAndBrandText;
      print(_UserSearchedBrands);
    });
    // getUserAddPoductsList();

    //getDeliveryAddressOnAliasId();
    //storeTermsForDeliveryCharge();
   
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
     // openFetchingDeliverySlots();
    });
    // _controller = ScrollController();
    _tabController = TabController(vsync: this, length: 1);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    // _searchedCategory = _categoryBy;
  }

/*here great logic will goes*/

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    _c?.dispose();
    super.dispose();
  }
  int _varientCode = 0;
  _varientCodeFunction(Code){
    setState(() {
      this._varientCode = Code;
      Navigator.of(context).pop();
    });


  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width/1;
    // return DefaultTabController(
    //   length: 2,
    //       child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Example App'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             text: "Home",
    //             icon: Icon(Icons.home),
    //           ),
    //           Tab(
    //             text: "Example page",
    //             icon: Icon(Icons.help),
    //           )
    //         ],
    //       ),
    //     ),

    return Scaffold(
      //backgroundColor: Color(0xffD3D3D3),
      // backgroundColor: Color(0xffFFFFFF),
      //   resizeToAvoidBottomPadding: false,
      //backgroundColor: Colors.white,
      backgroundColor: Color(0xffE3E3E3),


      /* floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        isExtended: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        icon: Icon(Icons.supervised_user_circle),
        label: Text('Fixed Button'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,*/
      body:
      NestedScrollView(

        controller: _scrollViewController,
        //     physics: ScrollPhysics(parent: PageScrollPhysics()),
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            /* SliverAppBar(
              automaticallyImplyLeading:false,
              elevation: 0.0,
                expandedHeight: 210.0,
              leading:Padding(
                // padding: EdgeInsets.all(7.0),
                  padding: EdgeInsets.fromLTRB(7, 4.1, 9, 7),


                  child: InkWell(

                    customBorder: new CircleBorder(),
                    splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                    hoverColor: Color(0xffB1B1B1).withOpacity(0.3),
                    // radius:50.0,
//borderRadius: BorderRadiusRadius.circular(50.0),
                    onTap: () {
                      // print("niki");
                      // onPressed: () =>
                     // _scaffoldKey.currentState.openDrawer();
                      //  Scaffold.of(context).openDrawer();
                      //  Scaffold.of(context).openDrawer();

                      /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );*/
                    },
                    //   Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>  Faq())),
                    // print("Container pressed"),



                    child:  SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Menu">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Menu" clip-path="url(#clip-Menu)">
    <g id="Burger_Button" data-name="Burger Button" transform="translate(3 3)">
      <rect id="Bounds" width="24" height="24" fill="none"/>
      <path id="Icon" d="M3,18H21V16H3v2Zm0-5H21V11H3v2ZM3,6V8H21V6Z" fill="#fff"/>
    </g>
  </g>
</svg>

'''),
                  )

              ),
              title: Text("My mark@",
                  style: TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w600,color: Colors.white)),
              centerTitle: true,
            /*  actions: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(7, 7, 0, 0),
                  child: InkWell(
                    customBorder: new CircleBorder(),
                    splashColor: Colors.blue,
                    hoverColor: Colors.red,

                    onTap: (){
                      setState(() {
                        //  this._reddy = false;
                      });

                    },
                    child:Container(
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child:   SvgPicture.asset('assets/Cut.svg',
                        width: 34.0,),
                    ),
                  ),
                ),
              ],*/
              //  backgroundColor: Colors.red,
              //    expandedHeight: 120.0,


               backgroundColor: Color(0xffA8326D),
             // backgroundColor: Color(0xffffffff),
              /* title: Text('Tab Controller Example',
              style: TextStyle(color:Colors.blue),),*/
              pinned: false,
              // snap: true,
              floating: false,
              primary: true,

              forceElevated: boxIsScrolled,
              /*  flexibleSpace:Container(
                height: 90.0,
               color: Colors.blue,


              ),*/
              /*  flexibleSpace: FlexibleSpaceBar(
                title: Text('Basic Slivers'),
                centerTitle: true,
              ),*/

              bottom: TabBar(

                labelPadding: EdgeInsets.only(right: 0.0, left: 0.0),
                indicatorWeight:0.1,
                tabs: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 6.0),
                    height: 45.0,

                    color: Color(0xffA8326D),
                    //   color:Colors.red,

                    child: TextField(
                      // maxLines: 1,
                      /*  style: new TextStyle(
                               // fontSize: 10.0,
                              //  height: 2.9,
                               // color: Colors.black
                            ),*/

                      // obscureText: true,
                      // style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      cursorColor:Color(0xffA8326D),
                      decoration: InputDecoration(
                        /*  suffixIcon: ButtonTheme(
                             minWidth: 25.0,

                        child:   FlatButton(
                              // minWidth:123.0,
                               padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                              //color: Color(0xffA8326D),
                           color:Color(0xffD1D1D1).withOpacity(0.49),
                              textColor: Color(0xffffffff),
                              // disabledColor: Colors.grey,
                              hoverColor:Colors.red,

                              disabledTextColor: Colors.red,
                              // padding: EdgeInsets.all(23.0),
                              splashColor: Colors.red,
                              onPressed: () {
                                /*...*/
                              },


                              child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''),
                            ),
                           ),*/
                        /*  suffixIcon: Container(
                             // color: Colors.blue,
                            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                            decoration: BoxDecoration(
                                color: Color(0xffD1D1D1).withOpacity(0.49),
                               /* borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(1.0),
                                    topRight: const Radius.circular(1.0)),*/
                           // borderRadius: BorderRadius.all(Radius.circular(1)),
                             /* borderRadius:new BorderRadius.only(
                                // topLeft: new Radius.elliptical(40.0, 10.0),
                               // topRight: new Radius.circular(1.0),
                               // bottomRight: new Radius.circular(1.0),

                               // topLeft: new Radius.circular(1.0),
                              //  bottomLeft: new Radius.circular(1.0),
                              ),*/
                              border: Border(
                                top: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                              //  left: BorderSide(width: 0.0, color: Color(0xFFFFFFFFFF)),
                                right: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                                bottom: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                              ),
                            ),
                            // padding: const EdgeInsetsDirectional.only(end: 21.0),
                              child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''), // myIcon is a 48px-wide widget.
                            ),*/
                        filled: true,
                        fillColor: Color(0xffffffff),

                        // fillColor: Colors.green,
                        contentPadding: const EdgeInsets.all(12.0),
                        //  contentPadding:EdgeInsets.fromLTRB(1.0, 12.0, 12.0, 0.0),

                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(width: 1,color: Color(0xffD1D1D1)),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(width: 1,color: Color(0xffD1D1D1)),
                        ),
                        /*  border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                           //   borderSide: BorderSide(width:2.1,color: Color(0xff078c38).withOpacity(1),
                              //    style:BorderStyle.solid),
                              borderRadius: const BorderRadius.all(
                                 Radius.circular(5.0),


                              ),
                            ),*/
                        hintText: 'Search Products',
                        hintStyle:TextStyle(fontFamily: 'Poppins-Regular',height:1.42,fontSize:12.0,fontWeight:FontWeight.w500,color: Color(0xff838383).withOpacity(1)),
                        // labelText: 'Enter Last Name',
                        //labelStyle:TextStyle(fontFamily: 'OpenSans',fontSize:18.0,fontWeight:FontWeight.w400,color: Color(0xffcccccc).withOpacity(1),
                        //  decoration: TextDecoration.none),
                        //  labelText: 'Password',
                        suffixIcon: ButtonTheme(
                          minWidth: 25.0,

                          child:   FlatButton(
                            // minWidth:123.0,
                            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                            //color: Color(0xffA8326D),
                            color:Color(0xffD1D1D1).withOpacity(0.49),
                            textColor: Color(0xffffffff),
                            // disabledColor: Colors.grey,
                            hoverColor:Colors.red,

                            disabledTextColor: Colors.red,
                            // padding: EdgeInsets.all(23.0),
                            splashColor: Colors.red,
                            onPressed: () {
                              /*...*/
                            },


                            child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''),
                          ),
                        ),

                      ),
                    ),
                  ),
                 /* Container(
                    height: 45.0,
//color:Colors.red,
                    margin: EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 0.0),
                    decoration: BoxDecoration(
                      // border: Border.all(width: 1.0,color: Color(0xffD1D1D1)),

                      /* border: Border(
                                  top: BorderSide(width: 1.0, color: Color(0xFFFD1D1D1)),
                                  left: BorderSide(width: 1.0, color: Color(0xFFD1D1D1)),
                                 // right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                                  bottom: BorderSide(width: 1.0, color: Color(0xFFD1D1D1)),
                                ),*/
                      boxShadow: [
                        BoxShadow(color: Color(0xffD1D1D1), blurRadius: 1.0),
                      ],
                      borderRadius: new BorderRadius.only(
                        // topLeft: new Radius.elliptical(40.0, 10.0),
                        //topRight: new Radius.circular(20.0),
                        //bottomRight: new Radius.circular(20.0),
                        topLeft: new Radius.circular(5.0),
                        bottomLeft: new Radius.circular(5.0),
                      ),

                    ),
                    width: screenSize,

                    // double yourWidth = width  / 5;
                    child:
                    /*FlatButton(
    color: Colors.red,
    child: Text("reddy garu"),
    onPressed: () {
      _changecategoryandsortbystate(1);
      //  this.categorysortby = 2;
      /*...*/
    },

  ),*/
                    FlatButton.icon(

                      //   color: Color(0xffA8326D),
                      color: this.categorysortby == 1
                          ? Color(0xffA8326D): Colors.white,
                      //  textColor: Colors.white,
                      textColor: this.categorysortby == 1
                          ? Color(0xffffffff): Color(0xff838383),
                      // disabledColor: Colors.grey,
                      hoverColor:Colors.red,

                      disabledTextColor: Colors.red,
                      // padding: EdgeInsets.all(23.0),
                      splashColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        // borderRadius: new BorderRadius.circular(0.0),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            topRight: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0)
                        ),
                        // side: BorderSide(color: Colors.red)
                      ),
                      label:
                      /*    Expanded(
child:
                              Row(
                               // mainAxisAlignment: MainAxisAlignment.center,
 mainAxisSize: MainAxisSize.min,
    children: <Widget>[
Expanded(
  child:
   Text("Category By ",

        //  overflow: TextOverflow.clip,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
        // overflow: TextOverflow.fade,
        style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w500),
      ),
                    ),


    ],
),
                              ),*/
                      Flexible(
                        child:
                        Text("Category By ",

                          //  overflow: TextOverflow.clip,
                          // overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w400),
                        ),
                      ),
                      icon: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-category">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="category" clip-path="url(#clip-category)">
    <g id="Group_3253" data-name="Group 3253" transform="translate(2.988 7.745)">
      <rect id="Rectangle_762" data-name="Rectangle 762" width="18.735" height="2.342" transform="translate(4.684)" fill="#fff"/>
      <rect id="Rectangle_763" data-name="Rectangle 763" width="18.735" height="2.342" transform="translate(4.684 5.855)" fill="#fff"/>
      <rect id="Rectangle_764" data-name="Rectangle 764" width="18.735" height="2.342" transform="translate(4.684 11.709)" fill="#fff"/>
      <path id="Path_4220" data-name="Path 4220" d="M6.171,21.5a1.171,1.171,0,1,0,1.171,1.171A1.166,1.166,0,0,0,6.171,21.5Z" transform="translate(-5 -21.5)" fill="#fff"/>
    </g>
  </g>
</svg>

''',color: this.categorysortby == 1
                          ? Color(0xffffffff): Color(0xff000000),),
                      onPressed: () {
                        _changecategoryandsortbystate(1);
                        print(inputs);
                        // this.categorysortby = 1;
                        /*...*/
                      },
                      /*  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                //  Icon(Icons.play_arrow, color: Colors.white,),
                                  Expanded(
                                    //flex: 1,
                                child:
                                SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-category">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="category" clip-path="url(#clip-category)">
    <g id="Group_3253" data-name="Group 3253" transform="translate(2.988 7.745)">
      <rect id="Rectangle_762" data-name="Rectangle 762" width="18.735" height="2.342" transform="translate(4.684)" fill="#fff"/>
      <rect id="Rectangle_763" data-name="Rectangle 763" width="18.735" height="2.342" transform="translate(4.684 5.855)" fill="#fff"/>
      <rect id="Rectangle_764" data-name="Rectangle 764" width="18.735" height="2.342" transform="translate(4.684 11.709)" fill="#fff"/>
      <path id="Path_4220" data-name="Path 4220" d="M6.171,21.5a1.171,1.171,0,1,0,1.171,1.171A1.166,1.166,0,0,0,6.171,21.5Z" transform="translate(-5 -21.5)" fill="#fff"/>
    </g>
  </g>
</svg>

'''),
                                  ),
                                  //Expanded(
                                   // flex: 3,
                               // child:
                                Text("Category By",
                                    style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w500),
                                  ),
                                //  ),

                                ],
                              ),*/
                      /* child: Text(
                                "Login",
                                style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                              ),*/
                      // ),
                    ),

                  ),*/
                /*  Container(
                      height: 45.0,
                      width: screenSize,
                      margin: EdgeInsets.fromLTRB(0.0, 12.0, 12.0, 0.0),
                      //  color: Colors.blue,
                      decoration: BoxDecoration(
                        // border: Border.all(width: 1.0,color: Color(0xffD1D1D1)),

                        /*  border: Border(
                                  top: BorderSide(width: 1.0, color: Color(0xFFFD1D1D1)),
                                  //left: BorderSide(width: 1.0, color: Color(0xFFD1D1D1)),
                                  right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                                  bottom: BorderSide(width: 1.0, color: Color(0xFFD1D1D1)),
                                ),*/
                        boxShadow: [
                          BoxShadow(color: Color(0xffD1D1D1), blurRadius: 1.0),
                        ],
                        borderRadius: new BorderRadius.only(
                          // topLeft: new Radius.elliptical(40.0, 10.0),
                          topRight: new Radius.circular(5.0),
                          bottomRight: new Radius.circular(5.0),
                          // topLeft: new Radius.circular(5.0),
                          // bottomLeft: new Radius.circular(5.0),
                        ),

                      ),
                      child:
                      /*     FlatButton(
                     // color: Colors.red,
                      child: Text("reddy garu"),
                      onPressed: () {
                        _changecategoryandsortbystate(2);
                        //  this.categorysortby = 2;
                        /*...*/
                      },
                    ),*/
                      FlatButton.icon(
                        //color: Color(0xffffffff),
                        color: this.categorysortby == 2
                            ? Color(0xffA8326D): Colors.white,
                        // color: Color(0xff078c38),
                        //  textColor: Color(0xff838383),
                        textColor: this.categorysortby == 2
                            ? Color(0xffffffff):Color(0xff838383),
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        //padding: EdgeInsets.all(23.0),
                        splashColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0.0),
                              bottomLeft: Radius.circular(0.0),
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0)
                          ),
                          //borderRadius: new BorderRadius.circular(0.0),
                          // side: BorderSide(color: Colors.red)
                          //side:
                        ),
                        onPressed: () {
                          _changecategoryandsortbystate(2);
                          //  this.categorysortby = 2;
                          /*...*/
                        },

                        label:Flexible(
                          child:  Text("Sort By1", textAlign: TextAlign.left,

                            style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w400),
                          ),
                        ),
                        icon:  SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Sort_By">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Sort_By" data-name="Sort By" clip-path="url(#clip-Sort_By)">
    <g id="Group_2994" data-name="Group 2994" transform="translate(3.747 5.794)">
      <path id="Path_4219" data-name="Path 4219" d="M11.323,32.16,10,33.482l3.08,3.079a.935.935,0,0,0,1.323,0l3.08-3.079L16.16,32.159l-1.483,1.483V20H12.806V33.642Z" transform="translate(-10 -20)"/>
      <rect id="Rectangle_758" data-name="Rectangle 758" width="13.094" height="1.871" transform="translate(9.353 1.871)"/>
      <rect id="Rectangle_759" data-name="Rectangle 759" width="10.288" height="1.871" transform="translate(9.353 5.612)"/>
      <rect id="Rectangle_760" data-name="Rectangle 760" width="7.483" height="1.871" transform="translate(9.353 9.353)"/>
      <rect id="Rectangle_761" data-name="Rectangle 761" width="4.677" height="1.87" transform="translate(9.353 13.094)"/>
    </g>
  </g>
</svg>

''',color: this.categorysortby == 2
                            ? Color(0xffffffff): Color(0xff000000),),
                        /*  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      //  Icon(Icons.play_arrow, color: Colors.white,),
                                      Expanded(
                                        flex: 3,
                                        child:
                                        SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Sort_By">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Sort_By" data-name="Sort By" clip-path="url(#clip-Sort_By)">
    <g id="Group_2994" data-name="Group 2994" transform="translate(3.747 5.794)">
      <path id="Path_4219" data-name="Path 4219" d="M11.323,32.16,10,33.482l3.08,3.079a.935.935,0,0,0,1.323,0l3.08-3.079L16.16,32.159l-1.483,1.483V20H12.806V33.642Z" transform="translate(-10 -20)"/>
      <rect id="Rectangle_758" data-name="Rectangle 758" width="13.094" height="1.871" transform="translate(9.353 1.871)"/>
      <rect id="Rectangle_759" data-name="Rectangle 759" width="10.288" height="1.871" transform="translate(9.353 5.612)"/>
      <rect id="Rectangle_760" data-name="Rectangle 760" width="7.483" height="1.871" transform="translate(9.353 9.353)"/>
      <rect id="Rectangle_761" data-name="Rectangle 761" width="4.677" height="1.87" transform="translate(9.353 13.094)"/>
    </g>
  </g>
</svg>


'''),
                                      ),
                                      Expanded(
                                       flex: 3,
                                      // child:
                                      child:Text("Sort By", textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w500),
                                      ),
                                       ),

                                    ],
                                  ),*/
                        /*  child: Text(
                                    "Register",
                                    style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                                    //     style: TextStyle(fontSize: 16.0),
                                  ),*/
                      )

                  ),*/


                  /*  Tab(
                    text: "Home",
                    icon: Icon(Icons.home),
                  ),

                  FlatButton(
                    color: Colors.red,
                   child: Text("reddy garu"),
                  ),*/
                  /* Tab(
                    text: "Example page page u jj",
                    icon: Icon(Icons.help),
                  )*/
                ],
                controller: _tabController,
              ),
              /*  flexibleSpace:Container(
                  height: 90.0,
                  color: Colors.red,
                  child:Text("reddy"),
                )*/
flexibleSpace: FlexibleSpaceBar(
  title:
Container(
  height: 90.0,
  color :Colors.red,
  child:TextField()
)
),

            )*/

          ];
        },
        /*  body: Column(
          children: <Widget>[
           // PageOne(),
            /* Container(
               height: 50.0,
               color: Colors.blue,
               child: TextField(

               ),
             ),*/
            //Text("reddy"),
            Flexible(
         child:  PageTwo(),
            )
          ],
        //  controller: _tabController,
        ),*/
        body:
        SafeArea(

          // margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
          child:   CustomScrollView(
            controller: _scrollViewController,
            // physics: ScrollPhysics(parent: PageScrollPhysics()),
//reverse: true,
            slivers: <Widget>[



              //  Visibility(

              // child:
              /*   Container(
              child:false ? SliverAppBar(
                primary: false,
                backgroundColor: Colors.red,
              ):
              SliverAppBar(
               // expandedHeight: 200,
                primary: false,
                pinned: true,
                snap: false,

              ),
            ),*/
              // ),

/*Container(
        child: true ? SliverAppBar(
          primary: false,
          backgroundColor: Colors.red,

        ):SliverAppBar(primary: false,
          backgroundColor: Colors.blue,

        )

),*/
              //  child:
              //   PreferredSize(

              //  child:AnimatedContainer(
              //   height: 55.0 ,
              //     duration: Duration(milliseconds: 200),
              //  child:
              // Container()
              /* Visibility(
              visible: true,
          child: SliverAppBar(

            ),
            ),*/

              SliverAppBar(
                automaticallyImplyLeading:false,
                elevation: 3.0,
                // expandedHeight: 210.0,
                leading:
                Padding(
                  // padding: EdgeInsets.all(7.0),
                    padding: EdgeInsets.fromLTRB(7, 9.0, 9, 7),


                    child: InkWell(

                      customBorder: new CircleBorder(),
                      splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                      hoverColor: Color(0xffB1B1B1).withOpacity(0.3),
                      // radius:50.0,
//borderRadius: BorderRadiusRadius.circular(50.0),
                      onTap: () {
                        Navigator.pop(context,true);
                        //reddygaru();
                       // openOverlayEntryForShipMent();
                        // print("niki");
                        // onPressed: () =>
                        // _scaffoldKey.currentState.openDrawer();
                        //  Scaffold.of(context).openDrawer();
                        //  Scaffold.of(context).openDrawer();

                        /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );*/
                      },
                      //   Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>  Faq())),
                      // print("Container pressed"),



                      child: 
                    Icon(Icons.arrow_back),
                  
                    )

                ),
                /* leading:Row(
children: [

                  Expanded(
                child:  Padding(
                    // padding: EdgeInsets.all(7.0),
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),


                      child: InkWell(

                        customBorder: new CircleBorder(),
                        splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                        hoverColor: Color(0xffB1B1B1).withOpacity(0.3),
                        // radius:50.0,
//borderRadius: BorderRadiusRadius.circular(50.0),
                        onTap: () {
                          // print("niki");
                          // onPressed: () =>
                          // _scaffoldKey.currentState.openDrawer();
                          //  Scaffold.of(context).openDrawer();
                          //  Scaffold.of(context).openDrawer();

                          /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );*/
                        },
                        //   Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>  Faq())),
                        // print("Container pressed"),



                        child:  SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Menu">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Menu" clip-path="url(#clip-Menu)">
    <g id="Burger_Button" data-name="Burger Button" transform="translate(3 3)">
      <rect id="Bounds" width="24" height="24" fill="none"/>
      <path id="Icon" d="M3,18H21V16H3v2Zm0-5H21V11H3v2ZM3,6V8H21V6Z" fill="#fff"/>
    </g>
  </g>
</svg>

'''),
                      )

                  ),
                  ),
  Expanded(
    child:  Padding(
      // padding: EdgeInsets.all(7.0),
        padding: EdgeInsets.fromLTRB(0, 0.0, 0.0, 0.0),


        child: InkWell(

          customBorder: new CircleBorder(),
          splashColor: Color(0xffB1B1B1).withOpacity(0.3),
          hoverColor: Color(0xffB1B1B1).withOpacity(0.3),
          // radius:50.0,
//borderRadius: BorderRadiusRadius.circular(50.0),
          onTap: () {
            // print("niki");
            // onPressed: () =>
            // _scaffoldKey.currentState.openDrawer();
            //  Scaffold.of(context).openDrawer();
            //  Scaffold.of(context).openDrawer();

            /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );*/
          },
          //   Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>  Faq())),
          // print("Container pressed"),



          child:  SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Menu">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Menu" clip-path="url(#clip-Menu)">
    <g id="Burger_Button" data-name="Burger Button" transform="translate(3 3)">
      <rect id="Bounds" width="24" height="24" fill="none"/>
      <path id="Icon" d="M3,18H21V16H3v2Zm0-5H21V11H3v2ZM3,6V8H21V6Z" fill="#fff"/>
    </g>
  </g>
</svg>

'''),
        )

    ),
  ),

            ],
        ),*/
                title: Text("About Us",
                    style: TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w600,color: Colors.white)),
                centerTitle: true,


                //    expandedHeight: 120.0,


                backgroundColor: Color(0xff87C034),

                pinned: true,
                snap: false,
                floating: true,
                primary: false,



              ),

              /* CurrySliverHeader(Colors.white, "FISH, MEAT & EGG"),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),

                  sliver: SliverToBoxAdapter(
                    child: Container(
                      height: 52.0,
                      //   margin: EdgeInsets.fromLTRB(  0.0, 5.0, 0.0, 5.0),
                      //  color: Color(0xff078c38),
                      color: Color(0xffD3D3D3),
                      // width: 120.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // scrollDirection: Axis.vertical,
                        itemCount: _categoryBy.length,
                        itemBuilder: (context, index) {
                          return
                            new ConstrainedBox(
                              constraints: new BoxConstraints(

                                minHeight: 5.0,
                                minWidth: 5.0,
                                maxHeight: 60.0,
                                maxWidth: 131.0,
                              ),
                              //  child: new DecoratedBox(
                              //  decoration: new BoxDecoration(color: Colors.red),
                              // child:
                              //Material(
                              // type: MaterialType.transparency,
                              //color: Colors.teal[900],
                              // child:
//                           InkWell(
//                                splashColor: Color(0xffA8326D).withOpacity(0.7),
//                                hoverColor:
//                                Colors.blue,
//                                highlightColor: Color(0xffA8326D).withOpacity(0.7),
/*onTap: (){

},*/
                              child:  Container(
                                // margin: EdgeInsets.fromLTRB( index == 0 ? 5.0: 0.0, 5.0, 5.0, 5.0),
                                // padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                // margin: EdgeInsets.all(5),
                                margin: EdgeInsets.fromLTRB( index == 0 ? 5.0: 0.0, 5.0, 5.0, 5.0),
                                //color: Color(0xffffffff),
                                decoration: BoxDecoration(
                                  // color: Color(0xff078c38),
                                  borderRadius: BorderRadius.all(Radius.circular(3)),
                                  //  boxShadow: [
                                  // BoxShadow(color: Color(0xffffffff
                                  //).withOpacity(1),spreadRadius: 0.5,blurRadius: 0.5),
                                  //],
                                ),
                                child:Material(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.all(Radius.circular(3)),
                                  elevation: 3.0,
                                  /*shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.red)
  ),*/
                                  //color: Colors.blue,
                                  // padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                                  child: InkWell(
                                      borderRadius: BorderRadius.all(Radius.circular(3)),
                                      splashColor: Color(0xffA8326D).withOpacity(0.7),
                                      hoverColor: Color(0xffA8326D).withOpacity(0.7),
                                      onTap: () {
                                        print("tapped");
                                      },

                                      child:   Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            // Material(

                                            //  color: Colors.white,
                                            //  child:
                                            Container(

                                              // color:Colors.white,
                                              padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                                              //splashColor: Colors.orange,
                                              child:    Text('${_categoryBy[index]}',textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,maxLines:2,
                                                  style: TextStyle(fontFamily: 'OpenSans',fontSize:10.50,fontWeight:FontWeight.w600,letterSpacing:0.0,color: Color(0xff322226).withOpacity(1.0))
                                              ),
                                            ),
                                            //  ),
                                          ]
                                      )
                                  ),
                                ),
                              ),
                              //  ),
                              // ),
                              // ),
                            );
                          /* Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                constraints: BoxConstraints(minWidth: 70, maxWidth: 90),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color:  Colors.blue,
                                   borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,)
                            )
                          ],
                        );*/
                          /* return
                        Card(

                          elevation: 1.5,
                          // color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(3),
                            splashColor: Color(0xffA8326D),
                            highlightColor: Color(0xffA8326D),

                            onTap: (){
                              _ActivateTheTab(index);

                            },
                            child:

                            Container(
                              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                              height: 72,
                           //  width: 79.0,




                              child: Center(
                                child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'OpenSans',fontSize:14.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: _FishMeatEggActiveTab  == index ? Color(0xffA8326D).withOpacity(1.0) : Color(0xff464741).withOpacity(1.0))),
                              ),
                            ),
                          ),
                        );*/
                          /*  InkWell(
                          splashColor: Colors.red,
                          highlightColor: Colors.red,
                          onTap: (){

                          },
                         child:  Container(
                           color: Color(0xff078c38),
                           padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                           child: Center(
                             child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                                 style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: Color(0xff464741).withOpacity(1.0))),
                           ),
                         ),
                       /*  Container(

                         // color: Color(0xffD3D3D3),

                         // width: 90.0,
                         // height: 90.0,
                          child: Container(

                            child:
                            Container(
                              color: Color(0xff078c38),
                              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                          child: Center(
                       child: Text('${_categoryBy[index]}',textAlign: TextAlign.center,
                           style: TextStyle(fontFamily: 'OpenSans',fontSize:12.0,fontWeight:FontWeight.w600,letterSpacing:0.0,color: Color(0xff464741).withOpacity(1.0))),
                          ),
                        ),
                        ),
                        ),*/
                        );*/
                        },
                      ),
                    ),
                  ),
                ),
                //CurrySliverHeader(Colors.deepPurple, "Header 2"),
                NikithaSliverHeader(Color(0xffE8E8E8).withOpacity(1), "4 Items"),
*/
              /* SliverAppBar(
                  automaticallyImplyLeading:false,
                  elevation: 3.0,
                 //  expandedHeight: 30.0,
                 /* leading: Container(
                    // SliverPadding(,
                    margin: EdgeInsets.fromLTRB(12.0, 9.0, 0.0, 9.0),
                   // padding: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 7.0),
                    child: Text("4 items"),
                  ),*/
                 //color: Colors.red,
                 /* Padding(
                    // padding: EdgeInsets.all(7.0),
                      padding: EdgeInsets.fromLTRB(7, 9.0, 9, 7),


                      child: InkWell(

                        customBorder: new CircleBorder(),
                        splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                        hoverColor: Color(0xffB1B1B1).withOpacity(0.3),
                        // radius:50.0,
//borderRadius: BorderRadiusRadius.circular(50.0),
                        onTap: () {
                          // print("niki");
                          // onPressed: () =>
                          // _scaffoldKey.currentState.openDrawer();
                          //  Scaffold.of(context).openDrawer();
                          //  Scaffold.of(context).openDrawer();

                          /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );*/
                        },
                        //   Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>  Faq())),
                        // print("Container pressed"),



                        child:  SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Menu">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Menu" clip-path="url(#clip-Menu)">
    <g id="Burger_Button" data-name="Burger Button" transform="translate(3 3)">
      <rect id="Bounds" width="24" height="24" fill="none"/>
      <path id="Icon" d="M3,18H21V16H3v2Zm0-5H21V11H3v2ZM3,6V8H21V6Z" fill="#fff"/>
    </g>
  </g>
</svg>

'''),
                      )

                  ),*/
                  title: Text("4 Cuts",
                      style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w400,color: Color(0xff707070))),
                 // centerTitle: true,
                  actions: <Widget>[
                    /*       FlatButton(
                        // minWidth:123.0,
                        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                        //color: Color(0xffA8326D),
                        color:Color(0xffD1D1D1).withOpacity(0.49),
                        textColor: Color(0xffffffff),
                        // disabledColor: Colors.grey,
                        hoverColor:Colors.red,

                        disabledTextColor: Colors.red,
                        // padding: EdgeInsets.all(23.0),
                        splashColor: Colors.red,
                        onPressed: () {
                          /*...*/
                        },


                        child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''),
                      ),
              */
                    /*Padding(
                      // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.fromLTRB(12.0, 9.0, 12.0, 12.0),
                      child: InkWell(
                        customBorder: new CircleBorder(),
                        splashColor: Colors.blue,
                        hoverColor: Colors.red,

                        onTap: (){
                          setState(() {
                            //  this._reddy = false;
                          });

                        },
                        child:Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child:   SvgPicture.asset('assets/Search.svg',
                              width: 25.0,color:Color(0xffffffff)),
                        ),
                      ),
                    ),*/

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)
                        ),
                        boxShadow: [
                          BoxShadow(color: Color(0xffD8D8D8),spreadRadius: 1.5,blurRadius: 1.5),
                        ],
                      ),
                margin: EdgeInsets.fromLTRB(0.0, 9.0, 12.0, 9.0),
                   child:
                   FlatButton.icon(
focusColor: Color(0xff078c38),

                      //   color: Color(0xffA8326D),
                      color:  Colors.white,
                      //  textColor: Colors.white,

                      // disabledColor: Colors.grey,
                     highlightColor: Colors.blue,
                      hoverColor:Color(0xff078c38),
//colorBrightness: Brightness.dark,
                      disabledTextColor: Colors.red,
                      // padding: EdgeInsets.all(23.0),
                      splashColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        // borderRadius: new BorderRadius.circular(0.0),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)
                        ),
                        // side: BorderSide(color: Colors.red)
                      ),
                      label:
                      /*    Expanded(
child:
                              Row(
                               // mainAxisAlignment: MainAxisAlignment.center,
 mainAxisSize: MainAxisSize.min,
    children: <Widget>[
Expanded(
  child:
   Text("Category By ",

        //  overflow: TextOverflow.clip,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
        // overflow: TextOverflow.fade,
        style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w500),
      ),
                    ),


    ],
),
                              ),*/
                      Flexible(
                        child:
                        Text("Filter ",

                          //  overflow: TextOverflow.clip,
                          // overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w400,color: Color(0xff707070)),
                        ),
                      ),
                      icon: SvgPicture.string('''
                      <?xml version="1.0" ?>
                      <svg id="Layer_1" style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M36.9,12c-0.4-1.7-2-3-3.9-3s-3.4,1.3-3.9,3H2v2h27.1c0.4,1.7,2,3,3.9,3s3.4-1.3,3.9-3H46v-2H36.9z M33,15   c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S34.1,15,33,15z"/><path d="M33,31c-1.9,0-3.4,1.3-3.9,3H2v2h27.1c0.4,1.7,2,3,3.9,3s3.4-1.3,3.9-3H46v-2h-9.1C36.4,32.3,34.9,31,33,31z M33,37   c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S34.1,37,33,37z"/><path d="M15,20c-1.9,0-3.4,1.3-3.9,3H2v2h9.1c0.4,1.7,2,3,3.9,3s3.4-1.3,3.9-3H46v-2H18.9C18.4,21.3,16.9,20,15,20z M15,26   c-1.1,0-2-0.9-2-2c0-1.1,0.9-2,2-2s2,0.9,2,2C17,25.1,16.1,26,15,26z"/></g></svg>
''',color:  Color(0xff707070),width: 30.0,),
                      onPressed: () {
                        _changecategoryandsortbystate(1);
                        print(inputs);
                        // this.categorysortby = 1;
                        /*...*/
                      },
                      /*  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                //  Icon(Icons.play_arrow, color: Colors.white,),
                                  Expanded(
                                    //flex: 1,
                                child:
                                SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-category">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="category" clip-path="url(#clip-category)">
    <g id="Group_3253" data-name="Group 3253" transform="translate(2.988 7.745)">
      <rect id="Rectangle_762" data-name="Rectangle 762" width="18.735" height="2.342" transform="translate(4.684)" fill="#fff"/>
      <rect id="Rectangle_763" data-name="Rectangle 763" width="18.735" height="2.342" transform="translate(4.684 5.855)" fill="#fff"/>
      <rect id="Rectangle_764" data-name="Rectangle 764" width="18.735" height="2.342" transform="translate(4.684 11.709)" fill="#fff"/>
      <path id="Path_4220" data-name="Path 4220" d="M6.171,21.5a1.171,1.171,0,1,0,1.171,1.171A1.166,1.166,0,0,0,6.171,21.5Z" transform="translate(-5 -21.5)" fill="#fff"/>
    </g>
  </g>
</svg>

'''),
                                  ),
                                  //Expanded(
                                   // flex: 3,
                               // child:
                                Text("Category By",
                                    style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w500),
                                  ),
                                //  ),

                                ],
                              ),*/
                      /* child: Text(
                                "Login",
                                style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                              ),*/
                      // ),
                    ),
    ),
                  ],
                  //  backgroundColor: Colors.red,
                  //    expandedHeight: 120.0,


                  backgroundColor: Color(0xffE8E8E8).withOpacity(1),
                  // backgroundColor: Color(0xffffffff),
                  /* title: Text('Tab Controller Example',
              style: TextStyle(color:Colors.blue),),*/
                  pinned: true,
                  snap: false,
                 // floating: true,
                  primary: true,
forceElevated: false,
                 //  forceElevated: boxIsScrolled,
                  /*  flexibleSpace:Container(
                height: 90.0,
               color: Colors.blue,


              ),*/
                  /*  flexibleSpace: FlexibleSpaceBar(
                title: Text('Basic Slivers'),
                centerTitle: true,
              ),*/

                  /*   bottom: TabBar(

                    labelPadding: EdgeInsets.only(right: 0.0, left: 0.0),
                    indicatorWeight:0.1,
                    tabs: <Widget>[
                      Container(

                        padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 6.0),
                        height: 45.0,
                       width:   MediaQuery.of(context).size.width,
                       // color: Color(0xffA8326D),
                          color:Colors.red,

                        child:  Center(
                          child: new Text(
                            "Keerthanai Songs",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      /*  TextField(
                          // maxLines: 1,
                          /*  style: new TextStyle(
                               // fontSize: 10.0,
                              //  height: 2.9,
                               // color: Colors.black
                            ),*/

                          // obscureText: true,
                          // style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                          cursorColor:Color(0xffA8326D),
                          decoration: InputDecoration(
                            /*  suffixIcon: ButtonTheme(
                             minWidth: 25.0,

                        child:   FlatButton(
                              // minWidth:123.0,
                               padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                              //color: Color(0xffA8326D),
                           color:Color(0xffD1D1D1).withOpacity(0.49),
                              textColor: Color(0xffffffff),
                              // disabledColor: Colors.grey,
                              hoverColor:Colors.red,

                              disabledTextColor: Colors.red,
                              // padding: EdgeInsets.all(23.0),
                              splashColor: Colors.red,
                              onPressed: () {
                                /*...*/
                              },


                              child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''),
                            ),
                           ),*/
                            /*  suffixIcon: Container(
                             // color: Colors.blue,
                            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                            decoration: BoxDecoration(
                                color: Color(0xffD1D1D1).withOpacity(0.49),
                               /* borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(1.0),
                                    topRight: const Radius.circular(1.0)),*/
                           // borderRadius: BorderRadius.all(Radius.circular(1)),
                             /* borderRadius:new BorderRadius.only(
                                // topLeft: new Radius.elliptical(40.0, 10.0),
                               // topRight: new Radius.circular(1.0),
                               // bottomRight: new Radius.circular(1.0),

                               // topLeft: new Radius.circular(1.0),
                              //  bottomLeft: new Radius.circular(1.0),
                              ),*/
                              border: Border(
                                top: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                              //  left: BorderSide(width: 0.0, color: Color(0xFFFFFFFFFF)),
                                right: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                                bottom: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                              ),
                            ),
                            // padding: const EdgeInsetsDirectional.only(end: 21.0),
                              child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''), // myIcon is a 48px-wide widget.
                            ),*/
                            filled: true,
                            fillColor: Color(0xffffffff),

                            // fillColor: Colors.green,
                            contentPadding: const EdgeInsets.all(12.0),
                            //  contentPadding:EdgeInsets.fromLTRB(1.0, 12.0, 12.0, 0.0),

                            enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(width: 1,color: Color(0xffD1D1D1)),

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(width: 1,color: Color(0xffD1D1D1)),
                            ),
                            /*  border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                           //   borderSide: BorderSide(width:2.1,color: Color(0xff078c38).withOpacity(1),
                              //    style:BorderStyle.solid),
                              borderRadius: const BorderRadius.all(
                                 Radius.circular(5.0),


                              ),
                            ),*/
                            hintText: 'Search Products',
                            hintStyle:TextStyle(fontFamily: 'Poppins-Regular',height:1.37,fontSize:12.0,fontWeight:FontWeight.w500,color: Color(0xff838383).withOpacity(1)),
                            // labelText: 'Enter Last Name',
                            //labelStyle:TextStyle(fontFamily: 'OpenSans',fontSize:18.0,fontWeight:FontWeight.w400,color: Color(0xffcccccc).withOpacity(1),
                            //  decoration: TextDecoration.none),
                            //  labelText: 'Password',
                            suffixIcon: ButtonTheme(
                              minWidth: 25.0,

                              child:   FlatButton(
                                // minWidth:123.0,
                                padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                //color: Color(0xffA8326D),
                                color:Color(0xffD1D1D1).withOpacity(0.49),
                                textColor: Color(0xffffffff),
                                // disabledColor: Colors.grey,
                                hoverColor:Colors.red,

                                disabledTextColor: Colors.red,
                                // padding: EdgeInsets.all(23.0),
                                splashColor: Colors.red,
                                onPressed: () {
                                  /*...*/
                                },


                                child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''),
                              ),
                            ),

                          ),
                        ),*/
                      ),
                      /* Container(
                    height: 45.0,
//color:Colors.red,
                    margin: EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 0.0),
                    decoration: BoxDecoration(
                      // border: Border.all(width: 1.0,color: Color(0xffD1D1D1)),

                      /* border: Border(
                                  top: BorderSide(width: 1.0, color: Color(0xFFFD1D1D1)),
                                  left: BorderSide(width: 1.0, color: Color(0xFFD1D1D1)),
                                 // right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                                  bottom: BorderSide(width: 1.0, color: Color(0xFFD1D1D1)),
                                ),*/
                      boxShadow: [
                        BoxShadow(color: Color(0xffD1D1D1), blurRadius: 1.0),
                      ],
                      borderRadius: new BorderRadius.only(
                        // topLeft: new Radius.elliptical(40.0, 10.0),
                        //topRight: new Radius.circular(20.0),
                        //bottomRight: new Radius.circular(20.0),
                        topLeft: new Radius.circular(5.0),
                        bottomLeft: new Radius.circular(5.0),
                      ),

                    ),
                    width: screenSize,

                    // double yourWidth = width  / 5;
                    child:
                    /*FlatButton(
    color: Colors.red,
    child: Text("reddy garu"),
    onPressed: () {
      _changecategoryandsortbystate(1);
      //  this.categorysortby = 2;
      /*...*/
    },

  ),*/
                    FlatButton.icon(

                      //   color: Color(0xffA8326D),
                      color: this.categorysortby == 1
                          ? Color(0xffA8326D): Colors.white,
                      //  textColor: Colors.white,
                      textColor: this.categorysortby == 1
                          ? Color(0xffffffff): Color(0xff838383),
                      // disabledColor: Colors.grey,
                      hoverColor:Colors.red,

                      disabledTextColor: Colors.red,
                      // padding: EdgeInsets.all(23.0),
                      splashColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        // borderRadius: new BorderRadius.circular(0.0),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            topRight: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0)
                        ),
                        // side: BorderSide(color: Colors.red)
                      ),
                      label:
                      /*    Expanded(
child:
                              Row(
                               // mainAxisAlignment: MainAxisAlignment.center,
 mainAxisSize: MainAxisSize.min,
    children: <Widget>[
Expanded(
  child:
   Text("Category By ",

        //  overflow: TextOverflow.clip,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
        // overflow: TextOverflow.fade,
        style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w500),
      ),
                    ),


    ],
),
                              ),*/
                      Flexible(
                        child:
                        Text("Category By ",

                          //  overflow: TextOverflow.clip,
                          // overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w400),
                        ),
                      ),
                      icon: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-category">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="category" clip-path="url(#clip-category)">
    <g id="Group_3253" data-name="Group 3253" transform="translate(2.988 7.745)">
      <rect id="Rectangle_762" data-name="Rectangle 762" width="18.735" height="2.342" transform="translate(4.684)" fill="#fff"/>
      <rect id="Rectangle_763" data-name="Rectangle 763" width="18.735" height="2.342" transform="translate(4.684 5.855)" fill="#fff"/>
      <rect id="Rectangle_764" data-name="Rectangle 764" width="18.735" height="2.342" transform="translate(4.684 11.709)" fill="#fff"/>
      <path id="Path_4220" data-name="Path 4220" d="M6.171,21.5a1.171,1.171,0,1,0,1.171,1.171A1.166,1.166,0,0,0,6.171,21.5Z" transform="translate(-5 -21.5)" fill="#fff"/>
    </g>
  </g>
</svg>

''',color: this.categorysortby == 1
                          ? Color(0xffffffff): Color(0xff000000),),
                      onPressed: () {
                        _changecategoryandsortbystate(1);
                        print(inputs);
                        // this.categorysortby = 1;
                        /*...*/
                      },
                      /*  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                //  Icon(Icons.play_arrow, color: Colors.white,),
                                  Expanded(
                                    //flex: 1,
                                child:
                                SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-category">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="category" clip-path="url(#clip-category)">
    <g id="Group_3253" data-name="Group 3253" transform="translate(2.988 7.745)">
      <rect id="Rectangle_762" data-name="Rectangle 762" width="18.735" height="2.342" transform="translate(4.684)" fill="#fff"/>
      <rect id="Rectangle_763" data-name="Rectangle 763" width="18.735" height="2.342" transform="translate(4.684 5.855)" fill="#fff"/>
      <rect id="Rectangle_764" data-name="Rectangle 764" width="18.735" height="2.342" transform="translate(4.684 11.709)" fill="#fff"/>
      <path id="Path_4220" data-name="Path 4220" d="M6.171,21.5a1.171,1.171,0,1,0,1.171,1.171A1.166,1.166,0,0,0,6.171,21.5Z" transform="translate(-5 -21.5)" fill="#fff"/>
    </g>
  </g>
</svg>

'''),
                                  ),
                                  //Expanded(
                                   // flex: 3,
                               // child:
                                Text("Category By",
                                    style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w500),
                                  ),
                                //  ),

                                ],
                              ),*/
                      /* child: Text(
                                "Login",
                                style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                              ),*/
                      // ),
                    ),

                  ),*/
                      /*  Container(
                      height: 45.0,
                      width: screenSize,
                      margin: EdgeInsets.fromLTRB(0.0, 12.0, 12.0, 0.0),
                      //  color: Colors.blue,
                      decoration: BoxDecoration(
                        // border: Border.all(width: 1.0,color: Color(0xffD1D1D1)),

                        /*  border: Border(
                                  top: BorderSide(width: 1.0, color: Color(0xFFFD1D1D1)),
                                  //left: BorderSide(width: 1.0, color: Color(0xFFD1D1D1)),
                                  right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                                  bottom: BorderSide(width: 1.0, color: Color(0xFFD1D1D1)),
                                ),*/
                        boxShadow: [
                          BoxShadow(color: Color(0xffD1D1D1), blurRadius: 1.0),
                        ],
                        borderRadius: new BorderRadius.only(
                          // topLeft: new Radius.elliptical(40.0, 10.0),
                          topRight: new Radius.circular(5.0),
                          bottomRight: new Radius.circular(5.0),
                          // topLeft: new Radius.circular(5.0),
                          // bottomLeft: new Radius.circular(5.0),
                        ),

                      ),
                      child:
                      /*     FlatButton(
                     // color: Colors.red,
                      child: Text("reddy garu"),
                      onPressed: () {
                        _changecategoryandsortbystate(2);
                        //  this.categorysortby = 2;
                        /*...*/
                      },
                    ),*/
                      FlatButton.icon(
                        //color: Color(0xffffffff),
                        color: this.categorysortby == 2
                            ? Color(0xffA8326D): Colors.white,
                        // color: Color(0xff078c38),
                        //  textColor: Color(0xff838383),
                        textColor: this.categorysortby == 2
                            ? Color(0xffffffff):Color(0xff838383),
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        //padding: EdgeInsets.all(23.0),
                        splashColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0.0),
                              bottomLeft: Radius.circular(0.0),
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0)
                          ),
                          //borderRadius: new BorderRadius.circular(0.0),
                          // side: BorderSide(color: Colors.red)
                          //side:
                        ),
                        onPressed: () {
                          _changecategoryandsortbystate(2);
                          //  this.categorysortby = 2;
                          /*...*/
                        },

                        label:Flexible(
                          child:  Text("Sort By1", textAlign: TextAlign.left,

                            style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w400),
                          ),
                        ),
                        icon:  SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Sort_By">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Sort_By" data-name="Sort By" clip-path="url(#clip-Sort_By)">
    <g id="Group_2994" data-name="Group 2994" transform="translate(3.747 5.794)">
      <path id="Path_4219" data-name="Path 4219" d="M11.323,32.16,10,33.482l3.08,3.079a.935.935,0,0,0,1.323,0l3.08-3.079L16.16,32.159l-1.483,1.483V20H12.806V33.642Z" transform="translate(-10 -20)"/>
      <rect id="Rectangle_758" data-name="Rectangle 758" width="13.094" height="1.871" transform="translate(9.353 1.871)"/>
      <rect id="Rectangle_759" data-name="Rectangle 759" width="10.288" height="1.871" transform="translate(9.353 5.612)"/>
      <rect id="Rectangle_760" data-name="Rectangle 760" width="7.483" height="1.871" transform="translate(9.353 9.353)"/>
      <rect id="Rectangle_761" data-name="Rectangle 761" width="4.677" height="1.87" transform="translate(9.353 13.094)"/>
    </g>
  </g>
</svg>

''',color: this.categorysortby == 2
                            ? Color(0xffffffff): Color(0xff000000),),
                        /*  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      //  Icon(Icons.play_arrow, color: Colors.white,),
                                      Expanded(
                                        flex: 3,
                                        child:
                                        SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Sort_By">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Sort_By" data-name="Sort By" clip-path="url(#clip-Sort_By)">
    <g id="Group_2994" data-name="Group 2994" transform="translate(3.747 5.794)">
      <path id="Path_4219" data-name="Path 4219" d="M11.323,32.16,10,33.482l3.08,3.079a.935.935,0,0,0,1.323,0l3.08-3.079L16.16,32.159l-1.483,1.483V20H12.806V33.642Z" transform="translate(-10 -20)"/>
      <rect id="Rectangle_758" data-name="Rectangle 758" width="13.094" height="1.871" transform="translate(9.353 1.871)"/>
      <rect id="Rectangle_759" data-name="Rectangle 759" width="10.288" height="1.871" transform="translate(9.353 5.612)"/>
      <rect id="Rectangle_760" data-name="Rectangle 760" width="7.483" height="1.871" transform="translate(9.353 9.353)"/>
      <rect id="Rectangle_761" data-name="Rectangle 761" width="4.677" height="1.87" transform="translate(9.353 13.094)"/>
    </g>
  </g>
</svg>


'''),
                                      ),
                                      Expanded(
                                       flex: 3,
                                      // child:
                                      child:Text("Sort By", textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 14.0,fontFamily:'Poppins-regular',fontWeight:FontWeight.w500),
                                      ),
                                       ),

                                    ],
                                  ),*/
                        /*  child: Text(
                                    "Register",
                                    style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                                    //     style: TextStyle(fontSize: 16.0),
                                  ),*/
                      )

                  ),*/


                      /*  Tab(
                    text: "Home",
                    icon: Icon(Icons.home),
                  ),

                  FlatButton(
                    color: Colors.red,
                   child: Text("reddy garu"),
                  ),*/
                      /* Tab(
                    text: "Example page page u jj",
                    icon: Icon(Icons.help),
                  )*/
                    ],
                    controller: _tabController,
                  ),*/
                  /*  flexibleSpace:Container(
                  height: 90.0,
                  color: Colors.red,
                  child:Text("reddy"),
                )*/
                  /* flexibleSpace: FlexibleSpaceBar(
                  title:
                  Container(
                    //  height: 90.0,
                      color :Colors.red,
                      child:TextField()
                  )
              ),*/

                ),*/
              /* SliverPadding(
            sliver:  SliverPersistentHeader(

                 // floating: false,
                  pinned: true,
                  delegate: _SliverAppBarDelegate123(
                    minHeight: 300,
                    maxHeight: 300,
                    child: Text("reddy")
                  ),
                ),
        ),*/
              /*  SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate123(
                      minHeight:120,
                      maxHeight: 120,

                      child: Text("reddy")
                    /*  child: PreferredSize(
                        preferredSize: Size.fromHeight(38.0),
                        child: Container(
                          // color: Theme.of(context).primaryColor,
                          color:Colors.white,
                          child: Padding(
                            // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 9.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Choose Cut',textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w700,letterSpacing:0.0,color: Color(0xff848484).withOpacity(1)))
                              ],
                            ),
                          ),
                        ),
                      )*/
                  ),
                ),*/
              /*  SliverPersistentHeader(
                  pinned: true,

                  delegate: _SliverAppBarDelegateFliter(

                      child: PreferredSize(
                        preferredSize: Size.fromHeight(40.0),
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(color: Color(0xffD1D1D1),spreadRadius: 1.0,blurRadius: 1.5),
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("reddy",         style: TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w700,letterSpacing:0.0,color: Color(0xff848484).withOpacity(1))),
                                Text("reddy")
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ),*/
              /* PreferredSize(

                  preferredSize: Size.fromHeight(90.0),
                  child: SliverAppBar(
                    automaticallyImplyLeading:false,
                    elevation: 3.0,

                  //  expandedHeight: 120.0,

                    //expandedHeight: 10.0,

                    //  expandedHeight: 300.0,
                      flexibleSpace:Container(
                      //  height: 140.0,
                        color: Colors.red,
                        child:Column(
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                // height: 90.0,
                                  color :Colors.blue,
                                  child:Text("Reddy")
                              ),
                              Container(
                                 //height: 90.0,
                                  color :Colors.red,
                                  child:Text("Rueddy")
                              )

                            ]
                        )
                      ),
                 /*    flexibleSpace: FlexibleSpaceBar(
                         centerTitle: true,

             title:Column(
                 children: <Widget>[
             Container(
               // height: 90.0,
                 color :Colors.red,
                 child:Text("Reddy")
             ),
                   Container(
                     // height: 90.0,
                       color :Colors.red,
                       child:Text("Rueddy")
                   )

                         ]
                  )
         ),*/

                    //  expandedHeight: 300,
                    backgroundColor: Colors.white,

                    //   centerTitle: true,
                    /*  leading: Padding(
                // padding: EdgeInsets.all(7.0),
                  padding: EdgeInsets.fromLTRB(7, 4.1, 9, 7),


                  child: InkWell(

                    customBorder: new CircleBorder(),
                    splashColor: Color(0xffB1B1B1).withOpacity(0.3),
                    hoverColor: Color(0xffB1B1B1).withOpacity(0.3),
                    // radius:50.0,
//borderRadius: BorderRadiusRadius.circular(50.0),
                    onTap: () {
                      // print("niki");
                      // onPressed: () =>
                      //_scaffoldKey.currentState.openDrawer();
                      //  Scaffold.of(context).openDrawer();
                      //  Scaffold.of(context).openDrawer();

                      /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );*/
                    },
                    //   Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>  Faq())),
                    // print("Container pressed"),



                    child:  SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Menu">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Menu" clip-path="url(#clip-Menu)">
    <g id="Burger_Button" data-name="Burger Button" transform="translate(3 3)">
      <rect id="Bounds" width="24" height="24" fill="none"/>
      <path id="Icon" d="M3,18H21V16H3v2Zm0-5H21V11H3v2ZM3,6V8H21V6Z" fill="#fff"/>
    </g>
  </g>
</svg>

'''),
                  )

              ),*/
                    //title:TextField(),
                    centerTitle: true,

                    /*  title:
                PreferredSize(                       // Add this code
                 preferredSize: Size.fromHeight(90.0),
               child:
               Container(
                 // height: 90.0,
                 padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
              child:
              //Text("Search "),
                 FlatButton(

                   child:Text("Reddy garu")
                 )

                ),
                ),*/
                  /*  title: Container(
                      height: 38.0,

                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0,color: Color(0xffC1C1C1)),
                        borderRadius:new BorderRadius.only(
                          // topLeft: new Radius.elliptical(40.0, 10.0),
                          topRight: new Radius.circular(5.0),
                          bottomRight: new Radius.circular(5.0),
                          topLeft: new Radius.circular(5.0),
                          bottomLeft: new Radius.circular(5.0),

                        ),
                      ),

                      child:  FlatButton(

                        //  color: Color(0xffA8326D),
                        textColor: Color(0xffffffff),
                        // disabledColor: Colors.grey,
                        hoverColor:Colors.red,

                        disabledTextColor: Colors.red,
                        // padding: EdgeInsets.all(23.0),
                        splashColor: Colors.red,
                        onPressed: () {
                          /*...*/
                        },


                        child: Text(
                          "Shop by category",
                          // style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                          style: TextStyle(fontFamily: 'OpenSans',fontSize:18.0,fontWeight:FontWeight.w700,letterSpacing:0.0,color: Color(0xff848484).withOpacity(1)),
                        ),
                      ),
                    ),*/
                    //    Visibility(
                    // visible: _categoryBy.indexOf(val) == 0,// child:
                    //      child:
/*comment for now*/
                    /*  Visibility(
                  visible: true,
                   child:  Container(
                      height: 30.0,
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
  child:TextField(

    cursorColor:Color(0xff000000).withOpacity(0.7),
onChanged: (string){
      _FilterBrandArray(string);
},

    decoration: InputDecoration(
      enabledBorder: UnderlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 2.1,color: Color(0xff000000)),
      ),
      focusedBorder: UnderlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 2.1,color: Color(0xff000000)),
      ),
      hintText: 'Search in Brand',
      hintStyle:TextStyle(fontFamily: 'Poppins-Regular',height:1.42,fontSize:12.0,fontWeight:FontWeight.w400,color: Color(0xff838383).withOpacity(1)),
      prefixIcon:
      ButtonTheme(
        minWidth: 18.0,

        child:   FlatButton(
          // minWidth:123.0,
          padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
          //color: Color(0xffA8326D),
        //  color:Color(0xffD1D1D1).withOpacity(0.49),
          textColor: Color(0xffffffff),
          // disabledColor: Colors.grey,
          hoverColor:Colors.red,

          disabledTextColor: Colors.red,
          // padding: EdgeInsets.all(23.0),
          splashColor: Colors.red,
          onPressed: () {
            /*...*/
          },


          child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


''',width: 20.0,),
        ),
      ),
    ),
  ),
                    ),
    ),*/

                    /* bottom: TabBar(
            tabs: <Widget>[
               Tab(
                    text: "Home",
                    icon: Icon(Icons.home),
                  ),
              Tab(
                text: "Example page",
                icon: Icon(Icons.help),
              )
            ],
            controller: _tabController,
          ),*/
                    /*  actions: <Widget>[
                  Visibility(
                    visible: true,
               child:   IconButton(
               icon:  SvgPicture.asset('assets/Cut.svg',
                    width: 38.0,),
                    tooltip: 'Close Search Brands',
                    onPressed: () {
                 setState(() {
                   this._UserStartSearchingBrand = true;
                   this._HideTextFiledSearchContent = false;
                   this._ExpansionClickOnClose = true;
                   this. _SearchedBrandIsExpand = true; //to keep active color on search brand expansionable  tile text



                 });
                      // handle the press
                    },
                  ),
                  ),
                /*  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    tooltip: 'Open shopping cart',
                    onPressed: () {
                      // handle the press
                    },
                  ),*/
                ],*/
                    /*FlatButton(
    child: Text("reddy garu"),
  ),*/
                    //  ),
//                 Container(
//             //TextField(),
//           // child: showSearch(context: context , delegate: DataSearch())
//                 )

                    /* bottom: PreferredSize(                       // Add this code
              preferredSize: Size.fromHeight(70.0),
           child: TabBar(
                tabs: <Widget>[
                  FlatButton(
                    child: Text("reddy"),
                  ),
                  FlatButton(
                    child: Text("reddy"),
                  ),
                  ],
              controller: _tabController,

            ) ,
            ),*/
                    /*  Text(

                  'My mark@  ',
                  style: TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w600,color: Colors.white)),
            */
                    pinned: true,
                    // floating: true,
                    primary: true,
                     //snap: true,
                    //expandedHeight: 0.0,
                    forceElevated:false,
                    /*   flexibleSpace: FlexibleSpaceBar(
                title: Text('Basic Slivers'),
                centerTitle: true,
              ),*/

                  ),
                ),*/

              // )
              //  ),


              /*SliverToBoxAdapter(
         /*  child:   Stack(
                  children: <Widget>[
             // child:
              Positioned(
                  left: 30.0,
                  top: 30.0,
                  child: new Container(
                    width: 100.0,
                    height: 80.0,
                    decoration: new BoxDecoration(color: Colors.red),
                    child: new Text('hello'),
                  )
              ),
           ]
              ),*/
           child:  Visibility(
                visible: true,
              child: Container(
               // height: 100.0,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 primary: false,
                 controller: _scrollViewController,

                 // scrollDirection: Axis.horizontal,
                   scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                  return  Stack(
                      children: <Widget>[
                   // return
                        Positioned(
                          left: 30.0,
                          top: 30.0,

                  child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: Card(
                        child: Text('data'),
                      ),
                    ),
                    ),
                      ]
                    );
                  },
                ),
              ),
              ),

            ),*/
              /*  SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                      child: PreferredSize(
                        preferredSize: Size.fromHeight(38.0),
                        child: Container(
                         // color: Theme.of(context).primaryColor,
                          color:Colors.white,
                          child: Padding(
                           // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 9.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Choose Cut',textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: 'OpenSans',fontSize:16.0,fontWeight:FontWeight.w700,letterSpacing:0.0,color: Color(0xff848484).withOpacity(1)))
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegateFliter(

                      child: PreferredSize(
                        preferredSize: Size.fromHeight(50.0),
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.red,
                          boxShadow: [
                            BoxShadow(color: Color(0xffD1D1D1),spreadRadius: 1.0,blurRadius: 1.5),
                          ],
                      ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                            child: Row(
                             // mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               Text("reddy"),
                                Text("reddy")
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ),*/
              /* SliverPersistentHeader(
              pinned: false,
              floating: true,
              delegate: NetworkingPageHeader(
                minExtent: 150.0,
                maxExtent: 250.0,
              ),
            ),*/
              /*  SliverFixedExtentList(
   // itemExtent: 58,
    delegate: SliverChildListDelegate([
      Visibility(
        visible: false,
        child:  Container(
          // height: 30.0,
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child:TextField(

            cursorColor:Color(0xff000000).withOpacity(0.7),
            onChanged: (string){
              _FilterBrandArray(string);
            },

            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 2.1,color: Color(0xff000000)),
              ),
              focusedBorder: UnderlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 2.1,color: Color(0xff000000)),
              ),
              hintText: 'Search in Brand',
              hintStyle:TextStyle(fontFamily: 'Poppins-Regular',height:1.42,fontSize:12.0,fontWeight:FontWeight.w400,color: Color(0xff838383).withOpacity(1)),
              prefixIcon:
              ButtonTheme(
                minWidth: 18.0,

                child:   FlatButton(
                  // minWidth:123.0,
                  padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                  //color: Color(0xffA8326D),
                  //  color:Color(0xffD1D1D1).withOpacity(0.49),
                  textColor: Color(0xffffffff),
                  // disabledColor: Colors.grey,
                  hoverColor:Colors.red,

                  disabledTextColor: Colors.red,
                  // padding: EdgeInsets.all(23.0),
                  splashColor: Colors.red,
                  onPressed: () {
                    /*...*/
                  },


                  child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


''',width: 20.0,),
                ),
              ),
            ),
          ),
        ),
      ),


      ])),*/

              /*comment SliverFixedExtentList*/
              /* SliverFixedExtentList(
              itemExtent: 58,
              delegate: SliverChildListDelegate([
                Container(
                  padding: new EdgeInsets.all(10.0),
             //  height: 150.0,
                    color: Color(0xffA8326D),
                  child: TextField(
                    // maxLines: 1,
                    /*  style: new TextStyle(
                               // fontSize: 10.0,
                              //  height: 2.9,
                               // color: Colors.black
                            ),*/

                    // obscureText: true,
                    // style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                    cursorColor:Color(0xffA8326D),
                    decoration: InputDecoration(
                      /*  suffixIcon: ButtonTheme(
                             minWidth: 25.0,

                        child:   FlatButton(
                              // minWidth:123.0,
                               padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                              //color: Color(0xffA8326D),
                           color:Color(0xffD1D1D1).withOpacity(0.49),
                              textColor: Color(0xffffffff),
                              // disabledColor: Colors.grey,
                              hoverColor:Colors.red,

                              disabledTextColor: Colors.red,
                              // padding: EdgeInsets.all(23.0),
                              splashColor: Colors.red,
                              onPressed: () {
                                /*...*/
                              },


                              child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''),
                            ),
                           ),*/
                      /*  suffixIcon: Container(
                             // color: Colors.blue,
                            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                            decoration: BoxDecoration(
                                color: Color(0xffD1D1D1).withOpacity(0.49),
                               /* borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(1.0),
                                    topRight: const Radius.circular(1.0)),*/
                           // borderRadius: BorderRadius.all(Radius.circular(1)),
                             /* borderRadius:new BorderRadius.only(
                                // topLeft: new Radius.elliptical(40.0, 10.0),
                               // topRight: new Radius.circular(1.0),
                               // bottomRight: new Radius.circular(1.0),

                               // topLeft: new Radius.circular(1.0),
                              //  bottomLeft: new Radius.circular(1.0),
                              ),*/
                              border: Border(
                                top: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                              //  left: BorderSide(width: 0.0, color: Color(0xFFFFFFFFFF)),
                                right: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                                bottom: BorderSide(width: 1.0, color: Color(0xffD1D1D1)),
                              ),
                            ),
                            // padding: const EdgeInsetsDirectional.only(end: 21.0),
                              child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''), // myIcon is a 48px-wide widget.
                            ),*/
                      filled: true,
                      fillColor: Color(0xffffffff),

                      // fillColor: Colors.green,
                      contentPadding: const EdgeInsets.all(12.0),
                      //  contentPadding:EdgeInsets.fromLTRB(1.0, 12.0, 12.0, 0.0),

                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Color(0xffD1D1D1)),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Color(0xffD1D1D1)),
                      ),
                      /*  border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                           //   borderSide: BorderSide(width:2.1,color: Color(0xff078c38).withOpacity(1),
                              //    style:BorderStyle.solid),
                              borderRadius: const BorderRadius.all(
                                 Radius.circular(5.0),


                              ),
                            ),*/
                      hintText: 'Search Products',
                      hintStyle:TextStyle(fontFamily: 'Poppins-Regular',height:1.42,fontSize:12.0,fontWeight:FontWeight.w500,color: Color(0xff838383).withOpacity(1)),
                      // labelText: 'Enter Last Name',
                      //labelStyle:TextStyle(fontFamily: 'OpenSans',fontSize:18.0,fontWeight:FontWeight.w400,color: Color(0xffcccccc).withOpacity(1),
                      //  decoration: TextDecoration.none),
                      //  labelText: 'Password',
                      suffixIcon: ButtonTheme(
                        minWidth: 25.0,

                        child:   FlatButton(
                          // minWidth:123.0,
                          padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                          //color: Color(0xffA8326D),
                          color:Color(0xffD1D1D1).withOpacity(0.49),
                          textColor: Color(0xffffffff),
                          // disabledColor: Colors.grey,
                          hoverColor:Colors.red,

                          disabledTextColor: Colors.red,
                          // padding: EdgeInsets.all(23.0),
                          splashColor: Colors.red,
                          onPressed: () {
                            /*...*/
                          },


                          child: SvgPicture.string('''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="29" viewBox="0 0 30 29">
  <defs>
    <clipPath id="clip-Search">
      <rect width="30" height="29"/>
    </clipPath>
  </defs>
  <g id="Search" clip-path="url(#clip-Search)">
    <g id="Search_Line" data-name="Search Line" transform="translate(-3 -2)">
      <g id="Search_Line-2" data-name="Search Line" transform="translate(0 0)">
        <rect id="Rectangle_115" data-name="Rectangle 115" width="33" height="33" fill="none"/>
        <g id="Group_1011" data-name="Group 1011" transform="translate(4.704 4.704)">
          <circle id="Ellipse_51" data-name="Ellipse 51" cx="9.183" cy="9.183" r="9.183" stroke-width="2.5" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
          <line id="Line_47" data-name="Line 47" x1="8.881" y1="8.226" transform="translate(15.672 15.672)" fill="none" stroke="#979797" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"/>
        </g>
      </g>
    </g>
  </g>
</svg>


'''),
                        ),
                      ),

                    ),
                  ),

                ),
               /* StickyHeader(
                  header: Container(
                    height: 90.0,
                      color: Colors.red,
                    child: Text("reddy be cool"),
                  ),
                  content: Container(
                    height: 90.0,
                    color: Colors.red,
                  ),
                ),*/
                Container(
                  height: 120.0,
                    color: Colors.green),
                Container(
                    height: 120.0,
                    color: Colors.blue

                ),
     AppBar(

     )
     /*   new ListView.builder(
          controller:  _scrollViewController,
            itemCount: litems.length,
            itemBuilder: (context, i) => new StickyHeader(
                header: new Container(
                //  height: 40.0,
                  child: new Text("Head1er $i"),
                  padding: const EdgeInsets.all(8.0),
                ),
                content: new Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new Text('item ${i}'),
                  //new Column(

                     /* children: list
                          .map((val) => new ListTile(
                        title: new Text(val),
                      ))

                          .toList()*/
                     /*children: <Widget>[
                       Text("reddy"),
                       Container(
                           height: 120.0,
                           color: Colors.blue),
                     ],*/
                     //),
                )),
          ),*/
        /*  StickyHeader(
            header: Container(
              height: 50.0,
              color: Colors.blueGrey[700],
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text('Header',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            content: Container(
              child: Text('Header',
                style: const TextStyle(color: Colors.white),
              //Image.network(imageForIndex(index), fit: BoxFit.cover,
                 // width: double.infinity, height: 200.0),
            ),
          ),
          ),*/
   /*  Container(
      child: NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  //   backgroundColor: Colors.red,
                  expandedHeight: 50.0,
                  backgroundColor: Color(0xffA8326D),
                  title: Text('Tab Controller Example'),
                  pinned: false,
                  //  snap: true,
                  floating: true,
                  forceElevated: boxIsScrolled,
                  /* flexibleSpace:Container(
                height: 90.0,
               // color: Colors.blue,

              ),*/
                  /*  flexibleSpace: FlexibleSpaceBar(
                title: Text('Basic Slivers'),
                centerTitle: true,
              ),*/

                  /*   bottom: TabBar(
                tabs: <Widget>[
                /*  Tab(
                    text: "Home",
                    icon: Icon(Icons.home),
                  ),*/
                  Tab(
                    text: "Example page",
                    icon: Icon(Icons.help),
                  )
                ],
                controller: _tabController,
              ),*/
                )
              ];
            },
        ),
     )*/
                //Container(color: Colors.blue),
              ]),
            ),*/
              /*Fish and seafood banner*/
              /* SliverPadding(
                    padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                    sliver:
                    SliverList(



                        delegate: SliverChildListDelegate([
                          ClipRRect(
                            // borderRadius: new BorderRadius.circular(5.0),
                              borderRadius:new BorderRadius.only(
                                // topLeft: new Radius.elliptical(40.0, 10.0),
                                topRight: new Radius.circular(5.0),
                                bottomRight: new Radius.circular(0.0),
                                topLeft: new Radius.circular(5.0),
                                bottomLeft: new Radius.circular(0.0),
                              ),
                              child:  Container(
                                // color: Colors.red,
                                // height: 120.0,
                                child: Image.asset("assets/fishandseafood.png", fit: BoxFit.contain,),
                              )
                          ),
                        ])
                    )
                ),*/
/**/
              /* SliverPadding(
    padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
    sliver:
    SliverList(



    delegate: SliverChildListDelegate([
      ])
    )
    ),*/
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                sliver:
                SliverList(
                  /*   delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.orange[100 * (index % 9)],
                    child: Text('orange $index'),
                  );
                },
                childCount: 9,
              ),*/


                  delegate: SliverChildListDelegate([
                    /*Delivery Address UI*/
                    Container(

                      //height:51.0,

                      padding: EdgeInsets.fromLTRB(9.0, 0.0, 9.0, 9.0),
                      decoration: BoxDecoration(

//color:Colors.red,
                        color:Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(color: Color(0xff707070).withOpacity(0.3), blurRadius: 1.0,spreadRadius: 1.0,),
                        ],
                        //  color: Color(0xff000000).withOpacity(0.6),
                        // color:Colors.transparent,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                          children:[

                            Container(
                              padding: EdgeInsets.fromLTRB(9.0, 12.0, 9.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[



                                  SizedBox(height: 11.0),

                                  Text(
                                    "My Market is one of the fastest growing Greengrocers in Bengaluru. Customers can discover stores, products, and price and then place an order to store via My Market app or website.Orders will be delivered within 90 minutes to 2 hours or Customer preferred time. We sell at MRP or discount price and we do not escalate the price of the products.",
                                    // style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                                    style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff322226).withOpacity(1.0)),
                                  ),
                                  SizedBox(height: 12.0),
                                  Text(
                                    "My Market means Faster, Reliable and Trusted. Our goal is to make shopping easy for online savvy and not online savvy customers, and create sustained neighborhood business environment where users can get best service and best quality with competitive price.",
                                    // style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                                    style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff322226).withOpacity(1.0)),
                                  ),

                                  SizedBox(height: 12.0),
                                  Text(
                                    '"My Market" trademark, logo, website and app are owned by My Market Partnership firm.',
                                    // style: TextStyle(fontSize: 16.0,fontFamily:'Roboto-Medium',fontWeight:FontWeight.w500),
                                    style: TextStyle(fontFamily: 'OpenSans',fontSize:14.5,fontWeight:FontWeight.w500,letterSpacing:0.0,color: Color(0xff322226).withOpacity(1.0)),
                                  ),


                                ],
                              ),
                            ),
                          ]
                      ),

                    ),

//review cart




                  ]),


                ),
              ),

            ],
          ),

        ),
      ),
        bottomNavigationBar: Container(
            height: 62.0,
            decoration: BoxDecoration(
              // shape: BoxShape.rectangle,
              // color: Color(0xFF078c38),
                boxShadow: [BoxShadow(
                  //  color: Colors.grey[500],
                  color: Color(0xFF000000).withOpacity(0.16),
                  // spreadRadius:37.0,
                  blurRadius: 37.0,
                ),]

            ),


            child:BottomNavigationBar(
              //: BottomNavigationBarType.shifting,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xffFFFFFF),
              selectedItemColor: Colors.black,
              //unselectedItemColor: Colors.white,
              selectedFontSize:10.0,
              unselectedFontSize:10.0,
              onTap: _onItemTapped,
              // backgroundColor: Colors.red,
              items: [
                BottomNavigationBarItem(
                    title: Text("Home",
                        style: TextStyle(fontFamily: 'OpenSans',fontSize:10.0,fontWeight:FontWeight.w600,color: Color(0xff707070))),
                    //  icon: Icon(Icons.home)
                    icon:Icon(Icons.home),
                  //  icon:IconButton()
                ),
                BottomNavigationBarItem(
                  title: Text("Category",
                      style: TextStyle(fontFamily: 'OpenSans',fontSize:10.0,fontWeight:FontWeight.w600,color: Color(0xff707070))),
                  // icon: Icon(Icons.folder)
                      icon:Icon(Icons.home),




                ),
                BottomNavigationBarItem(
                    title: Text("Search",
                        style: TextStyle(fontFamily: 'OpenSans',fontSize:10.0,fontWeight:FontWeight.w600,color: Color(0xff707070))),
                    //   icon: Icon(Icons.folder)
                    icon:Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                    title: Text("Account",
                        style: TextStyle(fontFamily: 'OpenSans',fontSize:10.0,fontWeight:FontWeight.w600,color: Color(0xff707070))),
                    //icon: Icon(Icons.folder)
                    icon:Icon(Icons.home),
                ),
             
               BottomNavigationBarItem(
                    title: Text("Account",
                        style: TextStyle(fontFamily: 'OpenSans',fontSize:10.0,fontWeight:FontWeight.w600,color: Color(0xff707070))),
                    //icon: Icon(Icons.folder)
                    icon:Icon(Icons.home),
                ),
              ],
            )
        )
    );
  }
}




