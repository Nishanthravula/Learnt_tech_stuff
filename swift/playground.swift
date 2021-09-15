import Foundation

var name = "first"

var fName: String = "sec"

var lName: String? = "ln" //optinal

lName = nil

var j: Int? = nil

var nm = "ln"

//print(lName)

//print(fName)

//optional ?

// true / false
var isOp = false

// Tuples

// func maxMin( array:[Int]) -> (Int, Int) {

//     return
    
// }

let fullName = ("fn","ln")

// print(fullName.0, fullName.1)


var person: String?  = "Suresh" //optional 
// print(person)

// print(person!) //forced unwaraped

var n: Int?  = nil

// if n != nil {
//     print("Not nil")
// }else {
//     print(n) 
// }

//optional binding 

class Customer {}
var customer: Customer? = Customer()
// var customer: Customer? = nil // no value output

if let c = customer {
    // print(c)
}else {
    // print("No value")
}

func test() {
    guard let c1 = customer else {
    return
    }
    // print(c1)
}


//Strings

let str = """
The package identifier is found but a version within the specified dependency range cannot be found on any of the sources. 
The range might be specified by a package and not the user.

"""
// print(str)


//empty String

let s1 = ""
var s2 = String()

if s2.isEmpty {
    // print("Empty")
}

let f = "FirstName"

let l = "LastName"

var str1 = f + l 

for c in str1 {
    // print(c)
    
}

let c: Character = "N" // define single char


// Arrays

// empty array
var numArray: [Int] = []
// var numArray = [Int]() 

var array = [1,2,3,4]
var strArray =  ["1","2","3","4"]
// var str1: [String] = strArray

// print(strArray[1])
// print(strArray.last)






























