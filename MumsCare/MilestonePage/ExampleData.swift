//
//  ExampleData.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 8/1/17.
//  Copyright © 2017 Yong Su. All rights reserved.
//

import Foundation

//
// MARK: - Section Data Structure
//
public struct Item {
    var name: String
    var detail: String
    var image: String
    var selected: Int
    
    public init(name: String, detail: String, image: String, selected: Int) {
        self.name = name
        self.detail = detail
        self.image = image
        self.selected = selected
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

public var sectionsData: [Section] = [
    Section(name: "", items: []),
    
    Section(name: NSLocalizedString("0-4 Months", comment: ""), items: [
        Item(name: NSLocalizedString("\nAble to lift head and chest when laying on stomach\n", comment: ""), detail: "", image: "Physical1", selected: 0),
        Item(name: NSLocalizedString("\nResponds to gentle touching, cuddling, rocking\n", comment: ""), detail: NSLocalizedString("", comment: ""),image:"Physical2", selected: 0),
        Item(name: NSLocalizedString("\nAble to grasp finger put into hands\n", comment: ""), detail: NSLocalizedString("", comment: ""),image:"Physical3", selected: 0)
        ]),
    
    Section(name: NSLocalizedString("4-8 Months", comment: ""), items: [
        Item(name: NSLocalizedString("\nRaises head and chest when lying on stomach\n", comment: ""), detail: NSLocalizedString("", comment: ""),image:"Physical4", selected: 0),
        Item(name: NSLocalizedString("\nAble to take weight on feet when standing\n", comment: ""), detail: NSLocalizedString("", comment: ""),image:"Physical5", selected: 0),
        Item(name: NSLocalizedString("\nPlays with feet and toes\n", comment: ""), detail: NSLocalizedString("", comment: ""),image:"Physical6", selected: 0)
    ]),
    
    Section(name: NSLocalizedString("8-12 Months", comment: ""), items: [
        Item(name: NSLocalizedString("\nStands by pulling themself up using furniture\n", comment: ""), detail:NSLocalizedString("", comment: ""),image:"Physical7", selected: 0),
        Item(name: NSLocalizedString("\nMature crawling (quick and fluent)\n", comment: ""), detail:NSLocalizedString("", comment: ""),image:"p8", selected: 0),
        Item(name: NSLocalizedString("\nHolds biscuit or bottle\n", comment: ""), detail:NSLocalizedString("", comment: ""),image:"Physical9", selected: 0)
    ]),
    
    Section(name: NSLocalizedString("1-2 Years", comment: ""), items: [
        Item(name: NSLocalizedString("\nChild walks\n", comment: ""), detail:NSLocalizedString("", comment: ""),image:"Physical10", selected: 0),
        Item(name: NSLocalizedString("\nScribbles with pencil or crayon held in fist\n", comment: ""), detail:NSLocalizedString("", comment: ""),image:"Physical11", selected: 0),
        Item(name: NSLocalizedString("\nCan drink from a cup\n", comment: ""), detail:NSLocalizedString("", comment: ""),image:"Physical12", selected: 0)
        ])
]
