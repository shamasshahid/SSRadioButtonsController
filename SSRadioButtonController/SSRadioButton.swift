//
//  SSRadioButton.swift
//  SampleProject
//
//  Created by Shamas on 18/05/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

class SSRadioButton: UIButton {

    fileprivate var circleLayer = CAShapeLayer()
    fileprivate var fillCircleLayer = CAShapeLayer()
    override var isSelected: Bool {
        didSet {
            toggleButon()
        }
    }
    /**
        Color of the radio button circle. Default value is UIColor red.
    */
    @IBInspectable var circleColor: UIColor = UIColor.red {
        didSet {
            circleLayer.strokeColor = circleColor.cgColor
            self.toggleButon()
        }
    }
    /**
        Radius of RadioButton circle.
    */
    @IBInspectable var circleRadius: CGFloat = 5.0
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    fileprivate func circleFrame() -> CGRect {
        var circleFrame = CGRect(x: 0, y: 0, width: 2*circleRadius, height: 2*circleRadius)
        circleFrame.origin.x = 0 + circleLayer.lineWidth
        circleFrame.origin.y = bounds.height/2 - circleFrame.height/2
        return circleFrame
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    fileprivate func initialize() {
        circleLayer.frame = bounds
        circleLayer.lineWidth = 2
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = circleColor.cgColor
        layer.addSublayer(circleLayer)
        fillCircleLayer.frame = bounds
        fillCircleLayer.lineWidth = 2
        fillCircleLayer.fillColor = UIColor.clear.cgColor
        fillCircleLayer.strokeColor = UIColor.clear.cgColor
        layer.addSublayer(fillCircleLayer)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, (4*circleRadius + 4*circleLayer.lineWidth), 0, 0)
        self.toggleButon()
    }
    /**
        Toggles selected state of the button.
    */
    func toggleButon() {
        if self.isSelected {
            fillCircleLayer.fillColor = circleColor.cgColor
        } else {
            fillCircleLayer.fillColor = UIColor.clear.cgColor
        }
    }

    fileprivate func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: circleFrame())
    }

    fileprivate func fillCirclePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: circleFrame().insetBy(dx: 2, dy: 2))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.frame = bounds
        circleLayer.path = circlePath().cgPath
        fillCircleLayer.frame = bounds
        fillCircleLayer.path = fillCirclePath().cgPath
        self.titleEdgeInsets = UIEdgeInsetsMake(0, (2*circleRadius + 4*circleLayer.lineWidth), 0, 0)
    }

    override func prepareForInterfaceBuilder() {
        initialize()
    }
}
