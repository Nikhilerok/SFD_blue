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
    
}