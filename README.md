# Session-6-Codable
Codable Feature in Xcode 9 and later 

# `Codable`
## NSTehran Session 6

### Table Of Contents
 
1. [Simple Codable](Codable.playground/Pages/SimpleCodable.xcplaygroundpage/Contents.swift)
2. [Nested Codable](Codable.playground/Pages/NestedCodable.xcplaygroundpage/Contents.swift)
3. [Customize CodingKey](Codable.playground/Pages/CustomizeCodingKey.xcplaygroundpage/Contents.swift)
4. [Error Handling](Codable.playground/Pages/ErrorHandling.xcplaygroundpage/Contents.swift)
5. [Customiz Codable](Codable.playground/Pages/CustomizeCodable.xcplaygroundpage/Contents.swift)
6. [Class Inheritance](Codable.playground/Pages/ClassInheritance.xcplaygroundpage/Contents.swift)
7. [Coding Strategies](Codable.playground/Pages/CodingStrategies.xcplaygroundpage/Contents.swift)
8. [Usage Such as Alamofire](Codable.playground/Pages/Usage.xcplaygroundpage/Contents.swift)


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
 
**Session Resources**
- Presentation Slides (PDF)
    + [*201_Codable.pdf*](https://github.com/NSTehran/Session-6-Codable/blob/master/Codable.playground/Resources/201_Codable.pdf)
 
- The video of session are in
    * youtube
        + [link](https://www.youtube.com/watch?v=FsyMteKqEsY)
    * Aparat
        + [link](https://www.aparat.com/v/p84UA)

[Codable Apple Documents](https://developer.apple.com/documentation/swift/codable)

Watch the WWDC session introducing the Codable
[WWDC Video](https://devstreaming-cdn.apple.com/videos/wwdc/2017/212vz78e2gzl2/212/212_sd_whats_new_in_foundation.mp4)
