//
//  UIIntroductionView.swift
//  coregraphics_tutorials_introduction_part3

import UIKit

@IBDesignable
class UIIntroductionView: UIView {
    override func draw(_ rect: CGRect) {
        let patternPadding: CGFloat = 5
        let patternRadius: CGFloat = 5
        
        var x: CGFloat = patternPadding
        var y: CGFloat = patternPadding
        
        while y < rect.height {
            let pathRect = CGRect(x: x, y: y, width: patternRadius, height: patternRadius)
            
            let path = self.starIn(rect: pathRect)
            UIColor.black.setFill()
            path.fill()
            
            x += patternRadius + patternPadding
            
            if x > rect.width {
                x = patternPadding
                y += patternRadius + patternPadding
            }
        }
    }
    
    private func starIn(rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        
        let center = CGPoint(x: rect.origin.x + rect.width / 2.0, y: rect.origin.y + rect.height / 2.0)
        
        let pointsOnStar = 10
        
        var angle: CGFloat = CGFloat(CGFloat.pi / 2.0)
        let angleIncrement = CGFloat(Double.pi * 2.0 / Double(pointsOnStar))
        let radius: CGFloat = rect.width / 2.0
        let midRadius: CGFloat = 0.45 * radius
        
        var firstPoint = true
        
        for _ in 1...pointsOnStar {
            let point = pointFrom(angle: angle, radius: midRadius, offset: center)
            let nextPoint = pointFrom(angle: angle + angleIncrement, radius: midRadius, offset: center)
            let midPoint = pointFrom(angle: angle + angleIncrement / 2.0, radius: radius, offset: center)
            
            if firstPoint {
                firstPoint = false
                path.move(to: point)
            }
            path.addLine(to: midPoint)
            path.addLine(to: nextPoint)
            
            angle += angleIncrement
        }
        path.close()
        
        return path
    }
    
    private func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        let x = radius * cos(angle) + offset.x
        let y = radius * sin(angle) + offset.y
        
        return CGPoint(x: x, y: y)
    }
}
