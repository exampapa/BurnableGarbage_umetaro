//
//  PutInTrash.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/20.
//

import SwiftUI

struct PutInTrash: View {
    
    @State var position:CGSize = CGSize(width: 600, height: 600)
    
    var drag: some Gesture {
        DragGesture()
            .onChanged{ value in
                self.position = CGSize(
                    width: value.startLocation.x + value.translation.width,
                    height: value.startLocation.y + value.translation.height
                )
            }
            .onEnded{ value in
                self.position = CGSize(
                    width: value.startLocation.x + value.translation.width,
                    height: value.startLocation.y + value.translation.height
                )
            }
    }
        
    
    var body: some View {
        
        
        VStack {
            Text("x: \(position.width)")
            Text("y:\(position.height)")
            
            Image("face")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .position(x: position.width, y: position.height)
                .gesture(drag)
        }
    }
}

struct PutInTrash_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PutInTrash()
        }
    }
}
