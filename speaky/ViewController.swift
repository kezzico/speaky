//
//  ViewController.swift
//  speaky
//
//  Created by lee on 6/4/22.
//

import UIKit

class Model {
    
    var speaker:SpeakerPerson!
    
    static var shared:Model = {
        let model = Model()
        
        model.speaker = SpeakerPerson()
        
        return model
    }()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var speakButton: UIButton!
    
    @IBOutlet weak var speakText: UITextView!
    
    @IBOutlet weak var speakSpeedSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.speakText.becomeFirstResponder()
        
        speakSpeedSlider.minimumValue = 0
        speakSpeedSlider.maximumValue = 100
        speakSpeedSlider.value = 50 // Set an initial value
        updateSliderValueLabel()
        
        // Add target-action for the slider
        speakSpeedSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    // Action called when slider value changes
    @objc func sliderValueChanged(_ sender: UISlider) {
        updateSliderValueLabel()
    }
    
    // Update the label to reflect the current slider value
    private func updateSliderValueLabel() {
        print(speakSpeedSlider.value)
        
        Model.shared.speaker.pitch = speakSpeedSlider.value * 0.05 + 0.01
        
        
    }

    @IBAction func didTapSpeak(_ sender :Any) {
        guard let text = speakText.text else {
            return
        }
        
        guard Model.shared.speaker.speaker.speaking == false else {
            return
        }
        
        Task {
            await Model.shared.speaker.speak([text])
        }
    }

}

