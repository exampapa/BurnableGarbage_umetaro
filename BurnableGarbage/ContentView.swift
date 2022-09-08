//
//  ContentView.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var HomeOn = true
    @State var ButtonGarbageOn = false
    @State var SwipViewOn = false

    //本当は、この構造体をフラグにどの画面を表示するかを決めるようにしたかったが、
    //このデータの受け渡しの方法がわからず諦めた。ここについて質問したい(Boolの受け渡し方法はわかった）
//    enum display {
//        case first //Home
//        case second //TouchGarbage
//        case third //SwipGarbage
//    }
//    @State var displayMode = display.first
    
  
    var body: some View {
        
//        NavigationView {
//
//            VStack {
//                NavigationLink {
//                    TouchGarbage()
//                } label: {
//                    Text("タッチ①")
//                }
//                .padding()
//
//                NavigationLink {
//                    SwipGarbage()
//                } label: {
//                    Text("スワイプ②")
//                }
//            }
//            .navigationTitle("メニュー")
//            Home()
//        }

        
        if HomeOn{
            
            ZStack{
                Home()
            
                VStack{
                    Spacer(minLength: UIScreen.main.bounds.size.height * 0.8)
                    HStack{
                        Spacer(minLength: 30)
                        Button(action: {
                    ButtonGarbageOn = true
                    HomeOn = false
                    SwipViewOn = false
//                            displayMode = .second
                        }) {
                            Text("えらんで分別")
                                .font(.system(size: 50))
                                .foregroundColor(Color.red)
                                .fontWeight(.black)
                                .lineLimit(1)
                                .minimumScaleFactor(1.0)
                        }
                        Spacer(minLength: 50)
                        Button(action: {
                    SwipViewOn = true
                    HomeOn = false
                    ButtonGarbageOn = false
//                            displayMode = .third
                        }) {
                            Text("ずらして分別")
                                .font(.system(size: 50))
                                .foregroundColor(Color.red)
                                .fontWeight(.black)
                                .lineLimit(1)
                                .minimumScaleFactor(1.0)
                        }
                        Spacer(minLength: 30)
                    }
                    Spacer(minLength: 30)
                }
            }
            
        }
            
//        } else if displayMode == display.second {
//            TouchGarbage(displayMode2: $displayMode)
//        } else if displayMode == display.third {
//            SwipGarbage()
//        }
        
        if ButtonGarbageOn{
            TouchGarbage(
                ButtonGarbageOn: $ButtonGarbageOn,
                HomeOn: $HomeOn
            )
        }
        
        if SwipViewOn{
            SwipGarbage(
                SwipViewOn: $SwipViewOn,
                HomeOn: $HomeOn
            )
        }
        
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
