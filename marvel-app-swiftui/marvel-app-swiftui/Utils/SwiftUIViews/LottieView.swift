//
//  LottieView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 18/12/21.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView {
    
    // MARK: - Attribute
    
    var animationName: String
    var onPlayed: (() -> ())?
    var loopMode: LottieLoopMode
    var animationView: AnimationView

    // MARK: Initializer
    
    init(
        animationName: String,
        loopMode: LottieLoopMode = .playOnce,
        onPlayed:  (() -> ())? = nil
    ) {
        self.animationName = animationName
        self.onPlayed = onPlayed
        self.loopMode = loopMode
        self.animationView = AnimationView()
    }
}

extension LottieView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        self.animationView.animation = Animation.named(self.animationName)
        self.animationView.contentMode = .scaleAspectFit
        self.animationView.loopMode = loopMode
        self.animationView.play() { _ in
            self.onPlayed?()
        }
        self.animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            self.animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            self.animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        //Nothing to update
    }
}
