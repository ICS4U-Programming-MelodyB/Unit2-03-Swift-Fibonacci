// This program reads information from line,
// it uses recursion to calculate the fibonacci.

//
//  Created by Melody

//  Created on 2023-04-24

//  Version 1.0

//  Copyright (c) 2023 Melody. All rights reserved.
import Foundation

// Define input & output paths.
let inputFile = "input.txt"
let outputFile = "output.txt"

// Usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for opening.")
        exit(1)
    }

    // Read context for file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string into lines, ensuring reading empty line.
    let inputLines = inputString.components(separatedBy: .newlines)

    // Usage of loop to access each element.
    for str in inputLines {
        if let num = Int(str) { 
            if num >= 0 {
                // Call function that will cal the Fibonacci.
                let fibonacci = Fibonacci(num: num)
                // Write to console.
                let data1 = Data(("The fibonacci sequence of " + str + "\n").utf8)
                output.write(data1)
                let data2 = Data((" is " + String(fibonacci) + "\n").utf8)
                output.write(data2)
            } else {
                // Displays error is num is less than 0'
                let data3 = Data(("Please enter a number greater than 0." + "\n").utf8)
                output.write(data3)
            }
        } else {
            // Displays error if num is not an int
            let data4 = Data(("Please enter valid input." + "\n").utf8)
            output.write(data4)
        }

    }

    // Close input & output file.
    input.closeFile()
    output.closeFile()

}
// This function uses recursion to
// calculate the factorial of numbers.
func Fibonacci(num: Int) -> Int {
    // Calculates factorial.
    if num == 0 {
        // Returns 0 because it is one of the base cases
        return 0
    } else if num == 1 {
        // Returns 0 because it is one of the base cases
        return 1
    } else {
        // Calls function recursively.
        return Fibonacci(num: num - 1) + Fibonacci(num: num - 2)
    }
}