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
    override var selected: Bool {
        didSet {
            toggleButon()
        }
    }
    @IBInspectable var circleColor: UIColor = UIColor.redColor() {
        didSet {
            circleLayer.strokeColor = circleColor.CGColor
            self.toggleButon()
        }
    }
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

    required init(coder aDecoder: NSCoder) {
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
        self.titleEdgeInsets = UIEdgeInsetsMake(0, (2*circleRadius + 4*circleLayer.lineWidth), 0, 0)
        self.toggleButon()
    }

    func toggleButon() {
        if self.selected {
            circleLayer.fillColor = circleColor.CGColor
        } else {
            circleLayer.fillColor = UIColor.clearColor().CGColor
        }
    }

    private func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalInRect: circleFrame())
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.frame = bounds
        circleLayer.path = circlePath().CGPath
    }

    override func prepareForInterfaceBuilder() {
        initialize()
    }
}
