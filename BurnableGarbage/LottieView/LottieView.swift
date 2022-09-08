//
//  GarbageCharactor.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/31.
//

import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    var name: String
    var animationView = AnimationView()


    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        // 表示したいアニメーションのファイル名
        animationView.animation = Animation.named(name)
        // 比率
        animationView.contentMode = .scaleAspectFit
        // ループモード
        animationView.loopMode = .loop


        animationView.backgroundBehavior = .stop
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}
