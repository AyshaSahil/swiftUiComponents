//
//  Animation2View.swift
//  Animation
//
//  Created by Aysha on 17/08/2022.
//

import SwiftUI

struct Animation2View: View {
    var body: some View {
        PolygonShape(sides: 7, scale: 0.5).stroke(Color.blue, lineWidth: 3)
            .frame(width: 300, height: 400, alignment: .center)
    }
}

struct Animation2View_Previews: PreviewProvider {
    static var previews: some View {
        Animation2View()
    }
}

struct PolygonShape: Shape {
    
    var sides: Double
    var scale: Double
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(sides, scale) }
        set {
            sides = newValue.first
            scale = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
            
        // hypotenuse
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        
        // center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        
        var path = Path()
                
        let extra: Int = Double(sides) != Double(Int(sides)) ? 1 : 0

        for i in 0..<Int(sides) + extra {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180

            // Calculate vertex
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        
        path.closeSubpath()
        
        return path
    }
    
    
}
