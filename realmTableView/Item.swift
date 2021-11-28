//
//  Item.swift
//  realmTableView
//
//  Created by Maxim Mitin on 28.11.21.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var id: Int = 0
}
