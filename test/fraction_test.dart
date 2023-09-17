import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/fraction.dart';

void main(){

test("answer shld be 5",(){
  final ans = Fraction(numerator: 10,denominator: 2);
  expect(ans.toDouble, allOf([
    10/2,2.5*2,20/3
  ]));
});





}