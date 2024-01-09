/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */

 @isTest
 private class CalculatorClassTest {
     // Test method for addNumbers
     @isTest
     static void testAddNumbers() {
         // Arrange
         CalculatorClass calculator = new CalculatorClass();
         Integer number1 = 5;
         Integer number2 = 10;
         
         // Act
         Integer result = calculator.addNumbers(number1, number2);
         
         // Assert
         System.assertEquals(15, result, 'The result should be the sum of number1 and number2');
     }
     
     // Test method for multiplyNumbers
     @isTest
     static void testMultiplyNumbers() {
         // Arrange
         CalculatorClass calculator = new CalculatorClass();
         Integer number1 = 3;
         Integer number2 = 7;
         
         // Act
         Integer result = calculator.multiplyNumbers(number1, number2);
         
         // Assert
         System.assertEquals(21, result, 'The result should be the product of number1 and number2');
     }
 }
 
 
 
 