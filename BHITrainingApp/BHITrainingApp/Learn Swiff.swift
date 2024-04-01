//
//  Learn Swiff.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 4/3/2024.
//

import Foundation
import UIKit
import SwiftUI


// class type
class Person : NSCopying {
    var id: Int = 1
    var name: String
    var age: Int
    
    // constructor
    init(id: Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
    // property = function de viet ham ToString
    var description: String {
        return "id:\(id), name:\(name), age:\(age)"
    }
    
    // implement protocol interface named NSCopying to clone object
    func copy(with zone: NSZone? = nil) -> Any {
        Person(id: id, name: name, age: age)
    }
    
}

// Struct type
struct Student {
    var id: Int
    var name:String
    var email: String
    
    // constructor => build in available
}

// label argument
func sum2Numbers(firstNumber x: Int, secondNumber y: Int) -> Int {
    x+y
}

func learning() {
    
    print("haha")
    //learn Swift here
    var x = 100
    print("x = \(x)")
    
    var y:Int = 10
    print("squared y = \(pow(Double(y),2))")
    
    let personA = Person(id: 1, name:"Hong Son", age: 23)
    personA.name = "aa" // let = final, khong gan A dc cho thang khac nhung van thay doi dc properties cua A
    dump(personA)
    print(personA.description)
    
    let studentA = Student(id: 1, name: "Robert Giang", email: "giangson@gmail.com")
    // studentA.name = "Duc Pham"  ---> let = freeze = immutable, object tao boi struct
    
    // different between class and struct
    // class is reference type
    var person2: Person? = personA   // ? is optional object, can be null(nil)
    var person3 = personA
    personA.name = "John"
    print(person2?.name ?? "")      // ?? is assigning default value
    print(person3.name)
    person2 = nil
    
    // clone object - su dung NSCopy interface (protocol), object clone nen su dung Struct
    var personB = personA.copy(with: nil)
    print("haha")
    
    print(sum2Numbers(firstNumber: 2, secondNumber: 3))
    
    // list like LINQ
    var persons:[Person] = [
        Person(id: 1, name:"Hong Son", age: 26),
        Person(id: 2, name:"Khanh Van", age: 29),
        Person(id: 3, name:"Ben Jonmathan", age: 44),
        Person(id: 4, name:"Hoj", age: 77)
    ]
    
    for person in persons {
        print(person.description)
    }
    
    // this is tuple
    for (index, person) in persons.enumerated() {
        print("i= \(index), person = \(person.description)")
    }
    
    let (a, b) = (3, 4)
    print("a= \(a), b= \(b)")
    
    //map
    let numbers:[Int] = [1,23,4,5,6]
    var squaredNumbers :[Int] = numbers.map {
        eachNumber in return eachNumber * eachNumber
    }
    
    // cai hay ho la su dung $0
    var powNumbers :[Int] = numbers.map {
        return $0 * $0
    }
    
    print(powNumbers)
    
    // filter ( show cac phan tu co name >5 )
    var filteredPersons: [Person] = persons.filter {
        $0.name.count > 5
    }
    
    for person in filteredPersons {
        print(person.description)
    }
    
    // delete = filter
    persons = persons.filter {
        $0.id != 2
    }
    
    for person in persons {
        print(person.description)
    }
    
    // async await
    // call api
//    var url1:URL? = URL(string: "https://jsonplaceholder.typicode.com/todos")
//    var url2:URL? = URL(string: "https://jsonplaceholder.typicode.com/comments")
//    
//    print("begin task 1")
//    URLSession.shared.dataTask(with: url1!) { _, response, error in
//        if let error = error {
//            // has error
//        }
//        print("end task 1")
//        print("response")
//    }.resume()
//    
//    print("begin task 2")
//    URLSession.shared.dataTask(with: url2!) {_, response, error in
//        if let error = error {
//            // has error
//        }
//        print("end task 2")
//        //print("response")
//    }.resume()
    
    // try async await
    Task.init {
        try await do2Tasks()
    }
}

// async func
func do2Tasks() async throws {
    print("do2Taks")
    var url1:URL? = URL(string: "https://jsonplaceholder.typicode.com/todos")
    var url2:URL? = URL(string: "https://jsonplaceholder.typicode.com/comments")
    let sharedSession = URLSession.shared
    do {
        print("begin task 1")
        let (response1, error1) = try await sharedSession.data(from: url1!, delegate: nil)
        print("end task 1")
        print("begin task 2")
        let (response2, error2) = try await sharedSession.data(from: url2!, delegate: nil)
        print("end task 2")
    } catch {
        
    }
}

