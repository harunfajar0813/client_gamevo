import 'package:flutter/material.dart';
import 'design_course_app_theme.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DR6Game extends StatefulWidget {
  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class InvoicePubgBro {
  String gameName;
  String voucherName;
  String accountID;
  String paypalAccount;
}

class PilihanVoucherPubg {
  String tipeVoucher;
  PilihanVoucherPubg(this.tipeVoucher);
}

class _CourseInfoScreenState extends State<DR6Game> with TickerProviderStateMixin {
  final double infoHeight = 500.0;
  AnimationController animationController;
  Animation<double> animation;
  final GlobalKey<FormState> _postPubgInvoice = new GlobalKey<FormState>();
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  String _dropdownVal;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn))
    );
    _accountID = new TextEditingController();
    _paypalAccount = new TextEditingController();
    _dropdownVal = '';
    setData();
    super.initState();
  }

  TextEditingController _accountID;
  TextEditingController _paypalAccount;

  _postToApiPubg() async {
    try{
      var url = 'https://gamevofinal0813.000webhostapp.com/invoices'; 
      var postDataNow = await http.post(
        url,
        body: {
          'game_name' : 'Rainbow Six Siege PC',
          'voucher_name' : _dropdownVal,
          'account_id' : _accountID.text,
          'paypal_account' : _paypalAccount.text
        }
      );
      print(postDataNow.statusCode);
      _onBasicAlertPressed(context);
    } catch(e) {
      print(e);
    }
  }

  _onBasicAlertPressed(context){
    Alert(
      context: context,
      title: "Success",
      desc: "Data on Invoice!",
    ).show();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset('assets/design_course/webInterFace.png'),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: DesignCourseAppTheme.nearlyWhite,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: DesignCourseAppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight: tempHeight > infoHeight
                              ? tempHeight
                              : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, left: 18, right: 16),
                            child: Text(
                              'Rainbow Six Siege',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: DesignCourseAppTheme.darkerText,
                              ),
                            ),
                          ),
                          Form(
                            key: _postPubgInvoice,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 8, top: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: TextField(
                                            controller: _accountID,
                                            decoration: InputDecoration(
                                              labelText: 'Account ID',
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 8, top: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: TextField(
                                            controller: _paypalAccount,
                                            decoration: InputDecoration(
                                              labelText: 'Paypal Account',
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 8, top: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: DropDownFormField(
                                          titleText: 'Voucher Type',
                                          hintText: 'Please choose one',
                                          value: _dropdownVal,
                                          onChanged: (value) {
                                            setState(() {
                                              _dropdownVal = value;
                                            });
                                            print(_dropdownVal);
                                          },
                                          dataSource: [
                                            {
                                              "display": "10 Credits",
                                              "value": "10 Credits",
                                            },
                                            {
                                              "display": "20 Credits",
                                              "value": "20 Credits",
                                            },
                                            {
                                              "display": "30 Credits",
                                              "value": "30 Credits",
                                            },
                                            {
                                              "display": "40 Credits",
                                              "value": "40 Credits",
                                            },
                                            {
                                              "display": "50 Credits",
                                              "value": "50 Credits",
                                            },
                                          ],
                                          textField: 'display',
                                          valueField: 'value',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity1,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 48,
                                    height: 48,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: DesignCourseAppTheme.nearlyWhite,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        border: Border.all(
                                            color: DesignCourseAppTheme.grey
                                                .withOpacity(0.2)),
                                      ),
                                      child: Icon(
                                        Icons.payment,
                                        color: DesignCourseAppTheme.nearlyBlue,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _postToApiPubg();
                                      },
                                      child: Container(
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: DesignCourseAppTheme
                                                    .nearlyBlue
                                                    .withOpacity(0.5),
                                                offset: const Offset(1.1, 1.1),
                                                blurRadius: 10.0),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Buy Now',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              letterSpacing: 0.0,
                                              color: DesignCourseAppTheme
                                                  .nearlyWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
              right: 35,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: CurvedAnimation(
                    parent: animationController, curve: Curves.fastOutSlowIn),
                child: Card(
                  color: DesignCourseAppTheme.nearlyBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  elevation: 10.0,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: Icon(
                        Icons.games,
                        color: DesignCourseAppTheme.nearlyWhite,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: DesignCourseAppTheme.nearlyBlack,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: DesignCourseAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: DesignCourseAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
