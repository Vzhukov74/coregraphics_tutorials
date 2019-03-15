//
//  UIIntroductionView.swift
//  coregraphics_tutorials_introduction

import UIKit

@IBDesignable
class UIIntroductionView: UIView {
    override func draw(_ rect: CGRect) {
        let pathRect3 = CGRect(x: 0, y: 0, width: rect.width, height: rect.height / 2)
        let path3 = UIBezierPath(roundedRect: pathRect3, cornerRadius: 0)
        path3.addClip()
        
        let pathRect1 = CGRect(x: 50, y: 50, width: rect.width - 100, height: rect.height - 100)
        let path1 = UIBezierPath(roundedRect: pathRect1, cornerRadius: 24)
        let color1 = UIColor.red
        color1.setFill()
        path1.fill()
        
        let pathRect2 = CGRect(x: 100, y: 100, width: rect.width - 200, height: rect.height - 200)
        let path2 = UIBezierPath(roundedRect: pathRect2, cornerRadius: 24)
        let color2 = UIColor.blue
        color2.setFill()
        path2.fill()
    }
}
