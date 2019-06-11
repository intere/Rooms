//
//  RoomDetail.swift
//  Rooms
//
//  Created by Eric Internicola on 6/10/19.
//  Copyright © 2019 iColasoft. All rights reserved.
//

import SwiftUI

struct RoomDetail : View {
    let room: Room

    var body: some View {
        Image(room.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .navigationBarTitle(Text(room.name), displayMode: .inline)
    }
}

#if DEBUG
struct RoomDetail_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomDetail(room: testData[0])
        }
    }
}
#endif
