//
//  Fred.swift
//  you-can-think
//
//  Created by Lee Irvine on 9/10/20.
//  Copyright © 2020 kezzi.co. All rights reserved.
//

import AVFoundation

enum Voice:String {
    case fred = "com.apple.speech.synthesis.voice.Fred"
    
    case nicki = "com.apple.ttsbundle.siri_female_en-US_compact"

    case aaron = "com.apple.ttsbundle.siri_male_en-US_compact"
    
    case samantha = "com.apple.ttsbundle.Samantha-compact"
    
    case alex = "com.apple.speech.voice.Alex"
}

class Fred: NSObject {
    static var speaker: Speaker = {
        let fred = Speaker()
        
        fred.name = "fred"
        
        return fred;
    }()

    class func speak(_ words: [String]) async {
        await withCheckedContinuation { continuation in
            speaker.speak(speed: 0.25, pitch: 1.0, voice: .fred, words) {
                continuation.resume()
            }
        }
    }
}

extension Fred {
    class func praise() -> String {
        let congrats = [
            "Great job!",
            "You got it!",
            "Incredible!",
            "Mathematical!",
            "Correct!",
            "Math cow!"]
        
        let r = Int.random(in: 0..<congrats.count)
        
        return congrats[r]

    }
}



class Nicki: NSObject {
    static var speaker: Speaker = {
        let nikki = Speaker()
        
        nikki.name = "Nicki"
        
        return nikki;
    }()

    class func speak(_ words: [String]) async {
        await withCheckedContinuation { continuation in
            speaker.speak(speed: 0.1, pitch: 0.1, voice: .fred, words) {
                continuation.resume()
            }

        }
    }
}

class SpeakerPerson: NSObject {
    
    var speed: Float = 0.25
    
    var pitch: Float = 1.0
    
    var voice: Voice = .fred
    
    var speaker: Speaker = {
        let s = Speaker()
        
        s.name = "speaker"
        
        return s;
    }()
    func speak(_ words: [String]) async {
        await withCheckedContinuation { continuation in
            speaker.speak(speed: self.speed, pitch: self.pitch, voice: self.voice, words) {
                continuation.resume()
            }

        }
    }
}



