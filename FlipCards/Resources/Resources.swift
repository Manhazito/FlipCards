//
//  Resources.swift
//  FlipCards
//
//  Created by Filipe Ramos on 07/03/2024.
//

import Foundation

@Observable
class Resources {
    var data: ResourceData = load("swift.json")
}

struct ResourceData: Decodable {
    let questions: [QuestionData]
}

struct QuestionData: Decodable {
    let question: String
    let answer: String
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let fileUrl = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("The app was not able to find a file named \(filename).")
    }
    
    do {
        data = try Data(contentsOf: fileUrl)
    } catch {
        fatalError("An error occurred while loading file \(filename).")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        print(error)
        fatalError("Could not parse file \(filename).")
    }
}
