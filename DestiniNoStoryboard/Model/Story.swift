//
//  Story.swift
//  DestiniNoStoryboard
//
//  Created by Eugene Kotovich on 13.04.2022.
//

import Foundation

struct Story {
    let title: String
    let choice1: String
    let destination1: Int
    let choice2: String
    let destination2: Int
    
    init(s: String, c1: String, d1: Int, c2: String, d2: Int) {
        title = s
        choice1 = c1
        destination1 = d1
        choice2 = c2
        destination2 = d2
    }
}
