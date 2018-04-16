//: [Previous Topic](@previous)
/*:
 # Playground for Presenting
 # Handling Error while ecoding and decoding in `Codable`
 */
//: ### handling occured error while try to decode from json string into dataType
//: ### we create a simple mistake which write a wrong key name in `CodingKeys` enum in `Message` struct
//: ### then we write a non optional property in message called `update` as `TimeInterval`
//: ### which json key maybe have a value in json string
//: ### you can produce error by reading
//: [Apple DecodingError Document](https://developer.apple.com/documentation/swift/decodingerror/)
//: ### and reading
//: [Apple EncodingError Document](https://developer.apple.com/documentation/swift/encodingerror/)
/*:
 A Message JSON Object
 ```
 {
     "message": "Hi, How are you?",
     "create": 1523895892938,
     "update": 1523899532938, maybe has a value in json otherwise filled with `null`
     "from": {
                 "name" : "Ali",
                 "age":25,
                 "email":"ali@gmail.com",
                 "address":"Iran, Tehran"
                 }
 }
 ```
 */

import Foundation

//:1. Create A simple json `Data` from `JSON` String
let jsonMessageData = """
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
    let sender : Person
    
/*:
 3. Declared CodingKeys\
 which is `enum` of `String` and adapt to `CodingKey` protocol\
 */
    private enum CodingKeys : String, CodingKey {
//: * message represent of *message* property
        case message
//: * create represent of *create* property
        case create
/*:
 * sender represent of *sender* property but\
 we need to set value of *sender* case to "from"\
 **Note:**"from" is json key that present in message json string
 ## *we just need to set a wrong key name which we set it to 'fromPerson' to occur error*
 */
        case sender = "fromPerson"
    }
    
//:4. Define a nested struct and named Person which adapted to `Codable` Protocol
    struct Person : Codable {
        let name : String
        let age : Int
        let email : String
        let address : String
    }
}

//:5. defind jsonDecoder as JSONDecoder
let jsonDecoder = JSONDecoder()

do {
/*:
 6. we use `-decode` method to decode `jsonData` into `Message` object with `try` option
 - first parameter is type of Object which want convert into such as `Int`, `String`,
 or Declared `struct` or `class`. The example is `Int.self`
 - second parameter is `jsonData' which we want convert from it into our definded type
 */
    let message = try jsonDecoder.decode(Message.self,from:jsonMessageData)
    
//:7. print Decoded `Message` Object
    print("""
        message = \(message.message)
        create = \(message.create)
        sender  = \(message.sender)
        \n
        """)
} catch {
/*:
 8. Handling Error
 * error occured while decoding json to message swift struct
 */
    print("Error on decoding \(error)")
}

/*:
9. So we can write above code again but handling `DecodingError.keyNotFound`\
    other solution is to make sender optional then error does not happened\
 ```let sender : Person?```
 */
do {
    let message = try jsonDecoder.decode(Message.self,from:jsonMessageData)
    print("""
        message = \(message.message)
        create = \(message.create)
        sender  = \(message.sender)
        \n
        """)
} catch DecodingError.keyNotFound(let key, let context) {
//:## `DecodingError.keyNotFound` error catch here
    print("key is not found in json for keyPath : \(key)")
    print("for context = \(context.debugDescription)")
    print("CodingPath = \(context.codingPath)")
} catch {
//: other error will catch here
      print("Error on decoding \(error)")
}

//: ### a key maybe present is json or isn't

//:1. Create A simple json `Data` from `JSON` String which key 'update' has `null` value
let jsonMessageUpdateData = """
{
     "message": "Hi, How are you?",
     "create": 1523895892938,
     "update": null,
     "from": {
                 "name" : "Ali",
                 "age":25,
                 "email":"ali@gmail.com",
                 "address":"Iran, Tehran"
             }
 }
""".data(using: .utf8)!


//:2. Define a struct and called Message2 which adapt to `Codable` Protocol
struct Message2 : Codable {
    
    let message : String
    let create : TimeInterval
    let update : TimeInterval
    let sender : Person
    
/*:
3. Declared CodingKeys\
which is `enum` of `String` and adapt to `CodingKey` protocol\
*/
    private enum CodingKeys : String, CodingKey {
        case message
        case create
        case update
        case sender = "from"
    }
    
//:4. Define a nested struct and named Person which adapted to `Codable` Protocol
    struct Person : Codable {
        let name : String
        let age : Int
        let email : String
        let address : String
    }
}

/*:
 5. if we want try to decoding `jsonMessageData` to `Message2` Object \
 we meet `DecodingError.valueNotFound` error while decoding data\
 **solution**: we just need set update property to optional `TimeInterval`\
 ```let update: TimeInterval?```
 */
do {
//: this line code occur error because `update` key has `null` value in jsonMessageUpdateData
    let message = try jsonDecoder.decode(Message2.self,from:jsonMessageUpdateData)
    print("""
        message = \(message.message)
        create = \(message.create)
        update = \(message.update)
        sender  = \(message.sender)
        \n
        """)
    
} catch DecodingError.keyNotFound(let key, let context) {
//:## `DecodingError.keyNotFound` error catch here
    print("key is not found in json for keyPath : \(key)")
    print("for context = \(context.debugDescription)")
    print("CodingPath = \(context.codingPath)")
    
} catch DecodingError.valueNotFound(let type,let context){
//:## `DecodingError.valueNotFound` error catch here
    print("value not found in json for type : \(type)")
    print("for context = \(context.debugDescription)")
    print("CodingPath = \(context.codingPath)")
} catch {
//: other error will catch here
    print("Error on decoding \(error)")
}


//: [Next Topic](@next)

