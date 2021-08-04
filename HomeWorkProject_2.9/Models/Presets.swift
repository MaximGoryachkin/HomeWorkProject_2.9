//
//  Presets.swift
//  HomeWorkProject_2.9
//
//  Created by Максим on 04.08.2021.
//

import Spring

struct Presets {
    
    static var presetsCount: Int {
        Spring.AnimationPreset.allCases.count
    }
    
    static func getPresets() -> [Spring.AnimationPreset] {
        var presets: [Spring.AnimationPreset] = []
        
        for preset in Spring.AnimationPreset.allCases {
            presets.append(preset)
        }
        
        presets.shuffle()
        
        return presets
    }
    
}


