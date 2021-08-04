//
//  Animation.swift
//  HomeWorkProject_2.9
//
//  Created by Максим on 04.08.2021.
//

import Spring

struct Animation {
    
    let preset: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
    // Свойства нужны чтобы не искать в коде, можно сменить анимацию кнопок тут :)
    static let runButtonAnimation =
        Spring.AnimationPreset.pop.rawValue
    static let againButtonAnimationIn =
        Spring.AnimationPreset.fadeIn.rawValue
    static let againButtonAnimationOut =
        Spring.AnimationPreset.fadeOut.rawValue
    
    static func setAnimation() -> [Animation] {
        let presets = Presets.getPresets()
        let curves = Curves.getCurves()

        var animations: [Animation] = []
        var count: Int {
            min(Presets.presetsCount, Curves.curvesCount)
        }
        
        for index in 0..<count {
            let animation = Animation(preset: presets[index].rawValue,
                                      curve: curves[index].rawValue,
                                      force: CGFloat.random(in: 1.0...1.2),
                                      duration: CGFloat.random(in: 1.0...1.5),
                                      delay: 0.5)
            animations.append(animation)
        }
        
       return animations
    }
    
}
