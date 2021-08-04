//
//  Curves.swift
//  HomeWorkProject_2.9
//
//  Created by Максим on 04.08.2021.
//

import Spring

struct Curves {
    
    static var curvesCount: Int {
        Spring.AnimationCurve.allCases.count
    }
    
    static func getCurves() -> [Spring.AnimationCurve] {
        var curves: [Spring.AnimationCurve] = []
        
        for curve in Spring.AnimationCurve.allCases {
            curves.append(curve)
        }
        
        curves.shuffle()
        
        return curves
    }
    
}
