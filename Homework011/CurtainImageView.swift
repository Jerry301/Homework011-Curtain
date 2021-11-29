//
//  curtainImageView.swift
//  Homework011
//
//  Created by Chun-Yi Lin on 2021/11/27.
//

import UIKit

class CurtainImageView: UIImageView {
    
    var upNumber : Double = 50
    var downNumber : Double = 50

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.width * upNumber / 100, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: bounds.width * downNumber / 100, y: bounds.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
        shapeLayer.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    }
    
    @IBAction func upCurtainChange(_ sender: UISlider) {
        sender.value = sender.value.rounded()
        upNumber = Double(sender.value)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.width * upNumber / 100, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: bounds.width * downNumber / 100, y: bounds.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
    
    @IBAction func downCurtainChange(_ sender: UISlider) {
        sender.value = sender.value.rounded()
        downNumber = Double(sender.value)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.width * upNumber / 100, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: bounds.width * downNumber / 100, y: bounds.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }

    
}
