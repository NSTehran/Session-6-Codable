//: [Table Of Contents](@previous)
//: # Playground for presenting Simple Codable
import UIKit
import Foundation

//: ### Decoding From JSON string to Person Object in Swift
//:1. Create A simple json `Data` from `JSON` String
/*:
 A Simple Person JSON Object
 ```
 {
     "name" : "Ali",
     "age":25,
     "email":"ali@gmail.com",
     "address":"Iran, Tehran"
 }
 ```
 */
let jsonData = """

    {
        "name" : "Ali",
        "age":25,
        "email":"ali@gmail.com",
        "address":"Iran, Tehran"
    }

""".data(using: .utf8)!

//:2. Define a struct and called Person which adapt to `Codable` Protocol

struct Person : Codable {
    let name : String
    let age : Int
    let email : String
    let address : String
}

//:3. defind jsonDecoder as JSONDecoder
let jsonDecoder = JSONDecoder()

do {
/*:
4. we use `-decode` method to decode `jsonData` into person object with `try` option
 - first parameter is type of Object which want convert into such as `Int`, `String`,
   or Declared `struct` or `class`. The example is `Int.self`
 - second parameter is `jsonData' which we want convert from it into our definded type
 */
    let person = try jsonDecoder.decode(Person.self,from:jsonData)
    
//:5. print Decoded Person Object
    print("""
        name = \(person.name)
        age = \(person.age)
        email  = \(person.email)
        address = \(person.address)
        \n
        """)
} catch {
/*:
6. Handling Error
     * error occured while decoding json to person swift struct
*/
    print("Error on decoding \(error)")
}

//: ### Encoding a Person to json String
//:1. declare a new person
let person = Person(name:"Hadi",age:35,email:"hadi@mail.com",address:"Iran, Tabriz")

//:2. declare a jsonEncoder which is `JSONEncoder`
let jsonEncoder = JSONEncoder()
//:3. we set outputFormatting to `.prettyPrinted`
jsonEncoder.outputFormatting = .prettyPrinted

do {
/*:
4. we use `-encode` method to ecode `person` into jsonData
5. all we must do, is send our person object as parameter to `encode` method
*/
    let encodedData = try jsonEncoder.encode(person)
    
//: 6. Convert `encodedData`,which represent of json data of `person` that we convert it, to jsonString
    let jsonString = String(data:encodedData,encoding:.utf8)!
//:7. print JSON String
    print(jsonString)
}catch {
/*:
8. Handling Error
     * error occured while decoding json to person swift struct
*/
    print("Error on encoding \(error)")
}

//: [Next Topic](@next)

