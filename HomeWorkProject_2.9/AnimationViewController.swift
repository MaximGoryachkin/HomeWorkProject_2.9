//
//  ViewController.swift
//  HomeWorkProject_2.9
//
//  Created by Максим on 03.08.2021.
//

import Spring

class AnimationViewController: UIViewController {
    
    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var buttonLabel: SpringButton!
    @IBOutlet weak var viewLabel: SpringLabel!
    @IBOutlet weak var againButton: SpringButton!
    
    private let animation = Animation.setAnimation()
    
    private var counter = 0
    private var count: Int {
        min(Presets.presetsCount, Curves.curvesCount) - 1
    }
    
    @IBAction func changeAnimation(_ sender: SpringButton) {
        springAnimationView.animation = animation[counter].preset
        springAnimationView.curve = animation[counter].curve
        springAnimationView.force = animation[counter].force
        springAnimationView.duration = animation[counter].duration
        springAnimationView.delay = animation[counter].delay
        
        springAnimationView.animate()
        
        viewLabel.animation = animation[counter].preset
        viewLabel.delay = animation[counter].delay + 0.3
        viewLabel.text = """
                        Preset: \(animation[counter].preset)
                        Curve: \(animation[counter].curve)
                        Force: \(string(for: animation[counter].force))
                        Duration: \(string(for: animation[counter].duration))
                        Delay: \(string(for: animation[counter].delay))
                        """
        
        viewLabel.animate()
        
        buttonLabel.animation = Animation.runButtonAnimation
        
        buttonLabel.animate()
        
        if counter < count {
            buttonLabel.setTitle("Next - \(animation[counter + 1].preset)",
                                 for: .normal)
            counter += 1
        } else if counter == count {
            buttonLabel.setTitle("Finish", for: .normal)
            buttonLabel.isEnabled = false
            againButton.isHidden = false
            againButton.animation = Animation.againButtonAnimationIn
            againButton.force = 1.0
            againButton.animate()
        }
    }
    
    @IBAction func againAction() {
        counter = 0
        buttonLabel.setTitle("Run Animation", for: .normal)
        buttonLabel.isEnabled = true
        againButton.animation = Animation.againButtonAnimationOut
        againButton.force = 1.0
        againButton.animate()
    }
    
    private func string(for value: CGFloat) -> String {
        String(format: "%.2f", value)
    }
    
}
