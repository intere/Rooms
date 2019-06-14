//
//  ContentView.swift
//  Rooms
//
//  Created by Eric Internicola on 6/10/19.
//  Copyright © 2019 iColasoft. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObjectBinding var store = RoomStore()

    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Rooms"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(.grouped)
        }
    }

    func addRoom() {
        store.rooms.append(Room(name: "Hall 2", capacity: 2000))
    }

    func delete(at offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }
        store.rooms.remove(at: index)
    }

    func move(from source: IndexSet, to destinationIndex: Int) {
        guard let sourceIndex = source.first else {
            return
        }
        store.rooms.move(from: sourceIndex, to: destinationIndex)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.colorScheme, .dark)
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .environment(\.colorScheme, .dark)

        }
    }
}
#endif

struct RoomCell : View {
    let room: Room

    var body: some View {
        return NavigationButton(destination: RoomDetail(room: room)) {
            Image(room.thumbnailName)
                .cornerRadius(8)
                VStack(alignment: .leading) {
                    Text(room.name)
                    Text("\(room.capacity) people")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
