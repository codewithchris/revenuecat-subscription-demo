//
//  Meditation.swift
//  calm-mind
//
//  Created by Christopher Ching on 2020-11-24.
//

import Foundation

struct Meditation: Identifiable {
    
    var id = UUID()
    var title:String = ""
    var desc:String = ""
    var imageName = ""
    var productId:String?
    
    static func TestData() -> [Meditation] {
        
        var array = [Meditation]()
        
        var m1 = Meditation()
        m1.title = "Ambition"
        m1.desc = "Channel your inert energy and set a goal that you're scared of achieving."
        m1.imageName = "ambition"
        m1.productId = "ambition"
        array.append(m1)
        
        var m2 = Meditation()
        m2.title = "Reflection"
        m2.desc = "Channel your inert energy and set a goal that you're scared of achieving."
        m2.imageName = "reflect"
        m2.productId = "reflect"
        array.append(m2)
        
        var m3 = Meditation()
        m3.title = "Calm"
        m3.desc = "Channel your inert energy and set a goal that you're scared of achieving."
        m3.imageName = "calm"
        m3.productId = "calm"
        array.append(m3)
        
        var m4 = Meditation()
        m4.title = "Focus"
        m4.desc = "Channel your inert energy and set a goal that you're scared of achieving."
        m4.imageName = "focus"
        m4.productId = "focus"
        array.append(m4)
        
        return array
    }
}

