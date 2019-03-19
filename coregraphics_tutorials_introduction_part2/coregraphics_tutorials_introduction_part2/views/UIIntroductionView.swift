//
//  UIIntroductionView.swift
//  coregraphics_tutorials_introduction_part2

import UIKit

@IBDesignable
class UIIntroductionView: UIView {
    override func draw(_ rect: CGRect) {
        //Делим исходную зону для рисования на 2 равные
        let rect1 = CGRect(x: 0, y: 0, width: rect.width, height: rect.height / 2)
        let rect2 = CGRect(x: 0, y: rect.height / 2, width: rect.width, height: rect.height / 2)
        
        drawCircular(in: rect1) //тут мы будем "рисовать" окружность
        drawLines(in: rect2) //тут работать с линиями
    }
    
    private func drawCircular(in rect: CGRect) {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = (rect.width / 2) - 100
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 3 * CGFloat.pi / 2, clockwise: false)
        
        path.lineWidth = 4
        path.lineCapStyle = .round
        
        let color = UIColor.red
        color.setStroke()
        
        path.stroke()
    }
    
    private func drawLines(in rect: CGRect) {
        let path = UIBezierPath()
        
        let point1 = CGPoint(x: 0, y: rect.origin.y + rect.height / 2)
        let point2 = CGPoint(x: rect.width / 2, y: rect.origin.y)
        let point3 = CGPoint(x: rect.width, y: rect.origin.y + rect.height / 2)
        
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        
        path.lineWidth = 2
        
        let color = UIColor.red
        color.setStroke()
        path.stroke()
    }
}
