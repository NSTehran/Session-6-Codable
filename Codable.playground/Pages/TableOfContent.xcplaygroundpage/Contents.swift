//: # `Codable`
//: ## NSTehran Session 6
/*:
### Table Of Contents
 
1. [Simple Codable](SimpleCodable)
2. [Nested Codable](NestedCodable)
3. [Customize CodingKey](CustomizeCodingKey)
4. [Error Handling](ErrorHandling)
5. [Customiz Codable](CustomizeCodable)
6. [Class Inheritance](ClassInheritance)
7. [Coding Strategies](CodingStrategies)
8. [Usage Such as Alamofire](Usage)
 */
/*:
 ---
 **`Codable`** in Playground
 
 # **Overview**
 
 Theses Playgrounds represent how to use `codable` in your project.
 we going to learn `Codable` and find this awesome feature
 
 The Steps, we walk through in, contain below items:
 - first, we create a simple json string and convert it to *Swift* DataTypes such `Struct`,`Class` and etc.
 - second, we create nested json object string and covert into Nested Objects
 - third, we customize `CodingKey` when our json string has custome `key` named
 - 4th, we make a mistake on decoding then we learn how to use `catch` decoding or encdoing error
 - 5th, we jump into `Encodable` and `Decodable` Protocol and how to override theses methods to customize
        encoding and decoding or create a custom validation which `Codable` errors do not invole it.
 - 6th, we defind base class and a class which inherite from base. Then we implement `Codable` method and how to send encoding or decoding container to base class
 - 7th, we walk into Encoding or Decoding stratiges such as convert date string into `Date` in decoding and etc.
 - 8th and last, we accept a awesome challenge which use `Codable` in our project or create decodable response or encodable request in [Alamofire](https://github.com/Alamofire/Alamofire)
 ---
 */
/*:
**Session Resources**
- Presentation Slides (PDF)
    + *201_Codable.pdf* in `Resources` folder
 
- The video of session are in
    * youtube
        + [link](https://www.youtube.com/watch?v=FsyMteKqEsY)
    * Aparat
        + [link](https://www.aparat.com/v/p84UA)

*/

//:[Codable Apple Documents](https://developer.apple.com/documentation/swift/codable)

/*:
Watch the WWDC session introducing the Codable
    ![WWDC Codable](https://devstreaming-cdn.apple.com/videos/wwdc/2017/212vz78e2gzl2/212/212_sd_whats_new_in_foundation.mp4)
*/
//: [Next Topic](@next)
