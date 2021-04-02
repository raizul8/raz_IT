import "dart:io";
import "dart:convert";

String restOfFile;
List<String> sites;
File sitesFile = new File("/home/raz2/razIT/scriptsExtensions/extension/GrayExtension2/myjavascript.js");

List<String> getSites() {
  String text = sitesFile.readAsStringSync(encoding: UTF8);
  
  int pos1 = text.indexOf("sites =") + 7;
  int pos2 = text.indexOf("]; // -sites", pos1)+1;  
  
  String sitesText = text.substring(pos1, pos2);
  restOfFile = text.substring(pos2 + 12 , text.length);
  
  List<String> sitesArray = JSON.decode(sitesText);
  return sitesArray;
}

void addSite(String site) {
  sites = getSites();
  sites.add(site);
}

void writteSiteToFile() {
  String sitesT = JSON.encode(sites);
  String allText = 'var sites = $sitesT; // -sites $restOfFile';
  
  sitesFile.writeAsStringSync(allText);
}

void main() {
  print("Enter Site Name:");
  String site = stdin.readLineSync();
  
  addSite(site);
  writteSiteToFile();
}


















