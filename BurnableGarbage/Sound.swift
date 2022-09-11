//
//  Sound.swift
//  BurnableGarbage
//
//  Created by Kentaro Ume on 2022/09/11.
//

import Foundation
import AVFoundation
import SwiftUI

private let Correct = try! AVAudioPlayer(data: NSDataAsset(name: "correct")!.data)
private let Wrong = try! AVAudioPlayer(data: NSDataAsset(name: "wrong")!.data)

public func playSoundCorrect(){
    Correct.stop()
    Correct.currentTime = 0.0
    Correct.play()
}
public func playSoundWrong(){
    Wrong.stop()
    Wrong.currentTime = 0.0
    Wrong.play()
}
