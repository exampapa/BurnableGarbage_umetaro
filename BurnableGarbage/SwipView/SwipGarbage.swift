//
//  SwipGarbage.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/27.
//

import SwiftUI



struct SwipGarbage: View {
    
    @State var items = ["nuigurumi","kamikuzu","plastic","kutsushita","shoes"]
    
    @State var transration: CGSize = .zero

    @Binding var SwipViewOn: Bool
    @Binding var HomeOn: Bool
    
    var body: some View {
        
            ZStack {
                
                BackView()
                
                ForEach(items, id: \.self)  { num in
                        Image(num)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .background(Color.white)
                        .offset(self.items.last == num ? transration : .zero)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    self.transration = value.translation
                                    print("value: ", value.location)
                                })
                                .onEnded({ value in
                                    if value.startLocation.y - 150 > value.location.y {
                                        self.transration = .init(width: 0  , height: -800)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            self.items.removeLast()
                                            self.transration = .zero
                                        }
                                    } else if value.startLocation.y + 150 < value.location.y {
                                        self.transration = .init(width: 0  , height: +800)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            self.items.removeLast()
                                            self.transration = .zero
                                        }
                                    } else {
                                        self.transration = .zero
                                    }
                                })
                        )
                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1))
                    
                }
            
                VStack{
                    HStack{
                        Spacer()
                
                            Button(action: {
                                self.SwipViewOn = false
                                self.HomeOn = true
                            }) {
                                Text("やめる")
                                    .font(.system(size: 50))
                                    .foregroundColor(Color.red)
                                    .fontWeight(.black)
                                    .lineLimit(1)
                                    .minimumScaleFactor(1.0)
                            }
                            Spacer(minLength: UIScreen.main.bounds.size.width * 0.8)
                    }
                    Spacer()
                }

               
            }
    }
}

struct SwipGarbage_Previews: PreviewProvider {
    static var previews: some View {
        SwipGarbage(SwipViewOn: .constant(false),
                    HomeOn: .constant(false))
    }
}
