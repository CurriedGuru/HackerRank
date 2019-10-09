// Solves the following:
// https://www.hackerrank.com/challenges/insertionsort1
// https://www.hackerrank.com/challenges/insertionsort2
// https://www.hackerrank.com/challenges/correctness-invariant
// https://www.hackerrank.com/challenges/runningtime

import Foundation 

func hackerRankPrintArray(_ array: [Int]) {
    for element in array {
        print("\(element) ", terminator: "")
    }
    print("")
}

func hackerRankReadInteger() -> Int {
    let line = readLine() ?? ""
    let number = line.trimmingCharacters(in: .whitespacesAndNewlines)
    return Int(number) ?? 0
}

func hackerRankReadIntArray() -> [Int] {
    let line = readLine() ?? ""
    return line.components(separatedBy: " ")
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        .map { Int($0)! }
}


func insertionSort(n: Int, array: inout [Int], printInnerLoop: Bool = false, printOuterLoop: Bool = false) -> Int {
    var numberOfShifts = 0
    for i in 1..<n {
        let key = array[i]
        var j = i - 1
        while j >= 0 && array[j] > key {
            numberOfShifts += 1
            array[j+1] = array[j]
            j = j - 1
            if printInnerLoop {
                hackerRankPrintArray(array)
            }
        }
        array[j+1] = key
        if printOuterLoop {
            hackerRankPrintArray(array)
        }
    }
    return numberOfShifts
}

var printResultArray = true
var printNumberOfShifts = false

let n = hackerRankReadInteger()
var array = hackerRankReadIntArray()
let nShifts = insertionSort(n: n, array: &array, printInnerLoop: true)

if printResultArray {
    hackerRankPrintArray(array)
}

if printNumberOfShifts { 
    print(nShifts)
}
