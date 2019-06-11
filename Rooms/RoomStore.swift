//
//  RoomStore.swift
//  Rooms
//
//  Created by Eric Internicola on 6/10/19.
//  Copyright © 2019 iColasoft. All rights reserved.
//

import Combine
import SwiftUI

class RoomStore : BindableObject {
    var rooms: [Room] {
        didSet {
            didChange.send(Void())
        }
    }

    init(rooms: [Room] = []) {
        self.rooms = rooms
    }

    var didChange = PassthroughSubject<Void, Never>()
}

extension Array {

    mutating func move(from fromIndex: Int, to toIndex: Int) {
        let first = self[fromIndex]
        let second = self[toIndex]

        self[fromIndex] = second
        self[toIndex] = first
    }

}
