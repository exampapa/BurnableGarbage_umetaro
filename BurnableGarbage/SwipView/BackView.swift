//
//  SwipGarbageView.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/30.
//

import SwiftUI

extension Color {
    static let ligthBlue = Color(red: 0.8, green: 1.0, blue: 1.0)
    static let ligthOrange = Color(red: 1.0, green: 0.6, blue: 0.4)
}

struct BackView: View {
    
    var body: some View {
        GeometryReader { geometry in

            VStack{
                    Text("もえるごみ")
                        .font(.system(size: 90))
//u                       .frame(width: geometry.size.width, height: 400)
                        .frame(width: geometry.size.width, height: geometry.size.height / 2)
                        .background(Color.ligthOrange)
                
                
                
                    Text("プラスチックごみ")
                        .font(.system(size: 90))
//u                       .frame(width: geometry.size.width, height: 700)
                        .frame(width: geometry.size.width, height: geometry.size.height / 2)
                        .background(Color.ligthBlue)
                }

        }
        }
}

struct SwipGarbageView_Previews: PreviewProvider {
    static var previews: some View {
        BackView()
    }
}
