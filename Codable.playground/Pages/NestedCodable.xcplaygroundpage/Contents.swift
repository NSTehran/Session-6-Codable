//: [Previous Topic](@previous)
//: # Playground for presenting Simple Nested Codable
import Foundation

//: ### Decoding From JSON string to Message Object which contain a from Person object
//:1. Create A simple json `Data` from `JSON` String
/*:
 A Message JSON Object
 ```
 {
     "message": "Hi, How are you?",
     "create": 1523895892938,
     "from": {
                 "name" : "Ali",
                 "age":25,
                 "email":"ali@gmail.com",
                 "address":"Iran, Tehran"
             }
 }
 ```
 */
let jsonData = """
{
     "message": "Hi, How are you?",
     "create": 1523895892938,
     "from": {
                 "name" : "Ali",
                 "age":25,
                 "email":"ali@gmail.com",
                 "address":"Iran, Tehran"
             }
 }
""".data(using: .utf8)!

//:2. Define a struct and called Message which adapt to `Codable` Protocol
struct Message : Codable {
    let message : String
    let create : TimeInterval
    let from : Person
    
//:3. Define a nested struct and named Person which adapted to `Codable` Protocol
    struct Person : Codable {
        let name : String
        let age : Int
        let email : String
        let address : String
    }
}

//:4. defind jsonDecoder as JSONDecoder
let jsonDecoder = JSONDecoder()

do {
/*:
 5. we use `-decode` method to decode `jsonData` into message object with `try` option
 - first parameter is type of Object which want convert into such as `Int`, `String`,
 or Declared `struct` or `class`. The example is `Int.self`
 - second parameter is `jsonData' which we want convert from it into our definded type
 */
    let message = try jsonDecoder.decode(Message.self,from:jsonData)
    
//:6. print Decoded `Message` Object
    print("""
        message = \(message.message)
        create = \(message.create)
        from  = \(message.from)
        \n
        """)
} catch {
/*:
 7. Handling Error
 * error occured while decoding json to message swift struct
 */
    print("Error on decoding \(error)")
}

//: [Next Topics](@next)
