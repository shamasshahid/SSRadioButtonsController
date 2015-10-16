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

    private var circleLayer = CAShapeLayer()
    private var fillCircleLayer = CAShapeLayer()
    override var selected: Bool {
        didSet {
            toggleButon()
        }
    }
    /**
        Color of the radio button circle. Default value is UIColor red.
    */
    @IBInspectable var circleColor: UIColor = UIColor.redColor() {
        didSet {
            circleLayer.strokeColor = circleColor.CGColor
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

    private func circleFrame() -> CGRect {
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

    private func initialize() {
        circleLayer.frame = bounds
        circleLayer.lineWidth = 2
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = circleColor.CGColor
        layer.addSublayer(circleLayer)
        fillCircleLayer.frame = bounds
        fillCircleLayer.lineWidth = 2
        fillCircleLayer.fillColor = UIColor.clearColor().CGColor
        fillCircleLayer.strokeColor = UIColor.clearColor().CGColor
        layer.addSublayer(fillCircleLayer)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, (4*circleRadius + 4*circleLayer.lineWidth), 0, 0)
        self.toggleButon()
    }
    /**
        Toggles selected state of the button.
    */
    func toggleButon() {
        if self.selected {
            fillCircleLayer.fillColor = circleColor.CGColor
        } else {
            fillCircleLayer.fillColor = UIColor.clearColor().CGColor
        }
    }

    private func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalInRect: circleFrame())
    }

    private func fillCirclePath() -> UIBezierPath {
        return UIBezierPath(ovalInRect: CGRectInset(circleFrame(), 2, 2))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.frame = bounds
        circleLayer.path = circlePath().CGPath
        fillCircleLayer.frame = bounds
        fillCircleLayer.path = fillCirclePath().CGPath
        self.titleEdgeInsets = UIEdgeInsetsMake(0, (2*circleRadius + 4*circleLayer.lineWidth), 0, 0)
    }

    override func prepareForInterfaceBuilder() {
        initialize()
    }
}
