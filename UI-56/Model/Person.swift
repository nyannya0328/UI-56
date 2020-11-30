//
//  Person.swift
//  UI-56
//
//  Created by にゃんにゃん丸 on 2020/11/30.
//

import SwiftUI

struct item : Identifiable {
    var id = UUID().uuidString
    var name : String
    var source : String = "App"
}

var items = [
    item(name: "Girl"),
    item(name: "Nature"),
    item(name: "Night"),
    item(name: "Tokyo"),
    item(name: "プレイ"),
    item(name: "東京タワー"),
    
]
