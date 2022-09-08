//
//  LottieView.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/23.
//
import SwiftUI
import Lottie

//struct LottieView: UIViewRepresentable {
//    var name: String
//    var animationView = AnimationView()
//
//
//    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
//        let view = UIView(frame: .zero)
//        // 表示したいアニメーションのファイル名
//        animationView.animation = Animation.named(name)
//        // 比率
//        animationView.contentMode = .scaleAspectFit
//        // ループモード
//        animationView.loopMode = .playOnce
//
//
//        animationView.backgroundBehavior = .stop
//        animationView.play()
//
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(animationView)
//        NSLayoutConstraint.activate([
//            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        ])
//        return view
//    }
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
//    }
//}


//問題。。二つ目のアクションがおらない丸→バツ（２つ目のバツが動かない）早くクリックすると表示される。
struct SplashErrorhScreen: View {

    @State var show = true

    var body: some View {
        ZStack(alignment: .center) {
            if (show) {
                errorView(show: $show)
                    .frame(width: 120, height: 120)
            } else {
                // TODO show view after splash lottie animation
            }
        }
    }
}

struct errorView: UIViewRepresentable {

    @Binding var show: Bool

    func makeUIView(context: Context) -> some AnimationView {
        let view = AnimationView(name: "error", bundle: Bundle.main)
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



