//
//  Keyboard.swift
//
//  Created by Heru on 2/28/23.
//  Copyright © 2023 kezzi.co. All rights reserved.
//

import UIKit

class Keyboard {
    static var shared: Keyboard = Keyboard()
    
    let numbers = {
        [1,2,3,4,5,6,7,8,9,0].map { String($0) }
    }()
    
//    weak var delegate: Any?
    
    func post(key: UIKey) {
//        let value = key.characters
//
//        if key.keyCode == .keyboardReturnOrEnter {
//            self.thinkpad?.didTapOkayButton()
//        }
//
//        else if key.keyCode == .keyboardDeleteOrBackspace {
//            self.thinkpad?.didTapClearButton()
//        }
//
//        else if numbers.contains(key.characters) {
//            self.thinkpad?.didTapNumberButton(value)
//        }
    }
}
    
