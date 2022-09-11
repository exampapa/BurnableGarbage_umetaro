//
//  SwipGarbage.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/27.
//

import SwiftUI
import Lottie


struct SwipGarbage: View {
    
    @State var items = ["nuigurumi","kamikuzu","plastic","kutsushita","shoes"]
    @State var itemskind = ["M","M","P","M","M"]
    
    @State var transration: CGSize = .zero

    @Binding var SwipViewOn: Bool
    @Binding var HomeOn: Bool
    
    
//    @State var isDragging = false //privateつけなくていいか？
    @State var location: CGPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y:UIScreen.main.bounds.height / 2) //privateつけなくていいか？
    
    @State var bangou: Int = 4
    
    @State var batsuFlag: Bool = false
    @State var seikaiFlag: Bool = false
    
    let device_half_height = UIScreen.main.bounds.height / 2
    
    /// Drag Gesture
    var dragGesture: some Gesture { //some Gestureって何？
        DragGesture()
            .onChanged { value in
                location = value.location
//                isDragging = true
            }
            .onEnded { _ in
//                isDragging = false
                
                //判定
                hantei()
                if bangou > 0{
                    

                   
                }else{
                    //終了処理のとこにジャンプ
                    saigo()
                }
                
            }
    }
    
    func saigo(){
        print("終わり")
        
        
        
    }
    
    func hantei(){
        if location.y > device_half_height && itemskind[bangou] == "P" || location.y < device_half_height && itemskind[bangou] == "M"{
            playSoundCorrect()
            seikaiFlag = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                seikaiFlag = false
                syokika()
            }
        }else{
            playSoundWrong()
//            SplashErrorhScreen()
            batsuFlag = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                batsuFlag = false
                syokika()
            }
            
//             callsplash()
        }
    }
    
    func syokika(){
        bangou -= 1
        location = CGPoint(x: UIScreen.main.bounds.width / 2, y:UIScreen.main.bounds.height / 2)
    }
    
    
//    func callsplash() -> some View{
//        SplashErrorhScreen()
//    }
    
    
    
    var body: some View {
        
            ZStack {
                
//                BackView()
        
//背景
                VStack(spacing: 0.0){
                    ZStack{
                        Color.ligthOrange
                        Text("もえるごみ")
                            .font(.system(size: 90))
                    }
                    ZStack{
                        Color.ligthBlue
                        Text("プラスチックごみ")
                            .font(.system(size: 90))
                    }
                }
                    .edgesIgnoringSafeArea(.all)

//問題画像の表示
                Image(items[bangou])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
//                    .background()
                    .position(location)
                    .gesture(dragGesture)
                

                
//                ForEach(items, id: \.self)  { num in
//                        Image(num)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 400, height: 400)
//                        .background(Color.white)
//                        .offset(self.items.last == num ? transration : .zero)
//                        .gesture(
//                            DragGesture()
//                                .onChanged({ value in
//                                    self.transration = value.translation
//                                    print("value: ", value.location)
//                                })
//                                .onEnded({ value in
//                                    if value.startLocation.y - 150 > value.location.y {
//                                        self.transration = .init(width: 0  , height: -800)
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                            self.items.removeLast()
//                                            self.transration = .zero
//                                        }
//                                    } else if value.startLocation.y + 150 < value.location.y {
//                                        self.transration = .init(width: 0  , height: +800)
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                            self.items.removeLast()
//                                            self.transration = .zero
//                                        }
//                                    } else {
//                                        self.transration = .zero
//                                    }
//                                })
//                        )
//                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1))
//
//                }
//

//止めるボタン
                VStack{
                    HStack{
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
                        Spacer()
                    }
                    Spacer()
                }
                
                if batsuFlag {
                    Image("batsu")
                }
                
                if seikaiFlag {
                    Image("maru")
                }
            } //元のZStackの閉じ
    } //viewの閉じ
} //SwipeGarbageの閉じ

struct SwipGarbage_Previews: PreviewProvider {
    static var previews: some View {
        SwipGarbage(SwipViewOn: .constant(false),
                    HomeOn: .constant(false))
    }
}
