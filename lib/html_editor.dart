import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class HtmlEditorPage extends StatefulWidget {
  const HtmlEditorPage({Key? key}) : super(key: key);

  @override
  _HtmlEditorPageState createState() => _HtmlEditorPageState();
}

class _HtmlEditorPageState extends State<HtmlEditorPage> {

  late HtmlEditorController controller;
  double height = 200;
  double oldContentHeight = 0;
  ScrollPhysics physics = NeverScrollableScrollPhysics();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = HtmlEditorController();
  }

  void setHeight(double height1){
    setState(() {
      height = height1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white70,
        body: ListView(
          physics: physics,
          // primary: false,
          children: [
            Container(
              height: 400,
              child: Form(
                child: HtmlEditor(
                  controller: controller,
                  htmlEditorOptions: HtmlEditorOptions(
                    darkMode: false,
                    adjustHeightForKeyboard: false,
                    // autoAdjustHeight: false,
                    // hint: (fieldValue != null && fieldValue != false && fieldValue != "")?null:'Your text here...',
                    // shouldEnsureVisible: true,
                    initialText: "<p><br></p>",
                  ),
                  htmlToolbarOptions: HtmlToolbarOptions(
                    toolbarPosition: ToolbarPosition.aboveEditor, //by default
                    toolbarType: ToolbarType.nativeScrollable, //by default
                  ),
                  otherOptions: OtherOptions(height: 400),
                  callbacks: Callbacks(
                    // onBlur: (){
                    //   setState(() {
                    //     physics = AlwaysScrollableScrollPhysics();
                    //   });
                    // },
                    // onFocus: (){
                    //   setState(() {
                    //     physics = NeverScrollableScrollPhysics();
                    //   });
                    //
                    // },
                    // onMouseDown: (){
                    //   setState(() {
                    //     physics = NeverScrollableScrollPhysics();
                    //   });
                    // },
                    //   onMouseUp: (){
                    //     setState(() {
                    //       physics = AlwaysScrollableScrollPhysics();
                    //     });
                    //   },
                    //
                    //   onScroll: (){
                    //     setState(() {
                    //       physics = NeverScrollableScrollPhysics();
                    //     });
                    //   },
                      onInit: () {
                        // controller.setFullScreen();
                        // controller.editorController!.evaluateJavascript(source: "document.getElementsByClassName('note-editable')[0].style.backgroundColor='blue';");
                      },
                      onChangeContent: (content) async {
                        // controller.recalculateHeight();
                        if(this.mounted){
                          var contentHeight = await controller.editorController!.evaluateJavascript(
                              source:
                              """
                              (function() {
                                return document.getElementsByClassName('note-editable')[0].scrollHeight;
                              })();
                                  """);
                          var DPR = MediaQuery.of(context).devicePixelRatio; // máy Vinfast là 2, Pixel6 là 3.5 -> contentHeight đã được chuyển đổi thành logic rồi
                          if(contentHeight != null){
                            double newHeight = 43+ (contentHeight).toDouble() + 40;
                            if((contentHeight).toDouble() != oldContentHeight){
                              setHeight(newHeight);
                              oldContentHeight = contentHeight.toDouble();
                            }
                          } else{
                            setHeight(100);
                          }
                        }
                      }
                  ),

                ),
              ),
            ),
            Container(
              height: 400,
              color: Colors.blue,
            ),
            Container(
              height: 400,
              color: Colors.yellow,
            ),
          ]
        ),
      ),
    );
  }
}
