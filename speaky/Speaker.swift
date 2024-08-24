//
//  Voices.swift
//  mathyou
//
//  Created by lee on 8/29/22.
//

import AVFoundation

class Speaker: NSObject {
    var speaking: Bool = false
    
    var name: String = "speaker"
    
    private var synthesizer = AVSpeechSynthesizer()
    
    private var utterances:[AVSpeechUtterance: ()->()] = [:]
    
    override init() {
        super.init()
        
        synthesizer.delegate = self
    }
    
    func speak(_ word: [String], completion: @escaping ()->() = { }) {
        let utterance = AVSpeechUtterance(string: word.joined(separator: " "))

        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.voice = AVSpeechSynthesisVoice(identifier: Voice.fred.rawValue)
        utterance.rate = 0.25
        utterance.pitchMultiplier = 1.0
        self.utterances[utterance] = completion
        
        self.speaking = true
        
        synthesizer.speak(utterance)
    }
    
    func speak(speed:Float=0.25, pitch:Float=1.0, voice: Voice = .fred, _ word: [String], completion: @escaping ()->() = { }) {
        let utterance = AVSpeechUtterance(string: word.joined(separator: " "))

        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.voice = AVSpeechSynthesisVoice(identifier: voice.rawValue)
        utterance.rate = speed
        utterance.pitchMultiplier = pitch
        self.utterances[utterance] = completion
        
        self.speaking = true
        
        synthesizer.speak(utterance)
    }

}


extension Speaker: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        guard let completion = self.utterances[utterance] else { return }
        
        completion()
        
        self.speaking = false
        
        self.utterances.removeValue(forKey: utterance)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
//        print("[\(name)] pause")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
//        print("[\(name)] cancel")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
//        print("[\(name)] continue")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("[\(name)] \(utterance.speechString)")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
//        print("[\(name)] will speak")
    }
}
