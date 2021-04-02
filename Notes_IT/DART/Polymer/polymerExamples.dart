@CustomTag('say-hello')
class SayHello extends PolymerElement {
  @published String nameAtr = '';
  

  SayHello.created() : super.created() {
  }

// get attribute value
//  void nameToUpper(Event e,var detail, Node target) {
  void nameToUpper(_,__, Element e) {
    nameAtr = nameAtr.toUpperCase() + e.attributes['data-arg1'];
  }
  
  @published num nr1 = 100;
  
  String get nr => nr1.toString();
  void set nr(String n) {
    nr1 = int.parse(n, onError: (_) => 0);
    
  }
  
}

// get class from shadowRoot
var p1 = this.shadowRoot.querySelector('.p1');

// get Element by id
$['nameInput'].focus();
