//
//  SuccessView.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/23.
//

import SwiftUI
import Lottie


//エラービューにおなじ
struct SplashSuccessScreen: View {

    @State var show = true

    var body: some View {
        ZStack(alignment: .center) {
            if (show) {
                successView(show: $show)
                    .frame(width: 120, height: 120)
            } else {
                // TODO show view after splash lottie animation
            }
        }
    }
}


struct successView: UIViewRepresentable {

    @Binding var show: Bool

    func makeUIView(context: Context) -> some AnimationView {
        let view = AnimationView(name: "success", bundle: Bundle.main)
        // lottie animationを表示開始
        view.play { (status) in
            if status {
                withAnimation(.spring()) {
                    // 表示が終了したタイミングで表示フラグをOFFに
                    show = false
                }
            }
        }
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
