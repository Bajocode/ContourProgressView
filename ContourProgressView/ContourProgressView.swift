//
//  ContourProgressView.swift
//  ContourProgressView
//  Released under the MIT license.
//  http://github.com/Bajocode/ContourProgressView
//
//  Created by Fabijan Bajo on 17/04/2017.
//  Copyright © 2017 Fabijan Bajo. All rights reserved.
//

import UIKit

@IBDesignable
public class ContourProgressView: UIView {
    
    
    // MARK: - Properties
    
    // Public
    @IBInspectable
    public var isRect: Bool = true { didSet { setNeedsLayout() } }
    
    @IBInspectable
    public var isLineCapSquared: Bool = true { didSet { setNeedsLayout() } }
    
    @IBInspectable
    public var lineWidth: CGFloat = 2.0 { didSet { setNeedsLayout() } }
    
    @IBInspectable
    public var progressTintColor: UIColor = .blue { didSet{ setNeedsLayout() } }
    
    @IBInspectable
    public var trackTintColor: UIColor = .gray { didSet { setNeedsLayout() } }
    
    @IBInspectable
    public var progress: CGFloat {
        get {
            return progressLayer.strokeEnd
        } set {
            // Validate input & update progress line
            if newValue > 1 {
                progressLayer.strokeEnd = 1
            } else if newValue < 0 {
                progressLayer.strokeEnd = 0
            } else {
                progressLayer.strokeEnd = newValue
            }
        }
    }
    
    // Private
    private let trackLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    
    
    // MARK: - Lifecycle
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        // Layers don’t have autoresizingMask: respond to changes in the view’s size
        trackLayer.frame = bounds
        trackLayer.path = path(forIsRect: isRect).cgPath
        trackLayer.lineWidth = lineWidth
        trackLayer.strokeColor = trackTintColor.cgColor
        trackLayer.lineCap = isLineCapSquared ? kCALineCapSquare : kCALineCapRound

        progressLayer.frame = bounds
        progressLayer.path = path(forIsRect: isRect).cgPath
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeColor = progressTintColor.cgColor
        progressLayer.lineCap = isLineCapSquared ? kCALineCapSquare : kCALineCapRound
    }
    
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    public convenience init(frame: CGRect, isRect: Bool) {
        self.init(frame: frame)
        self.isRect = isRect
    }
    
    
    // MARK: - Methods
    
    private func configure() {
        // Track layer
        trackLayer.frame = bounds
        trackLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(trackLayer)
        
        // Progress layer
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(progressLayer)
        progress = 0.0
        
        // View
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
    }
    
    private func frameForContour() -> CGRect {
        // CALayer.lineWidth is by default centered on the line
        let lineWidthHalf = lineWidth / 2
        return bounds.insetBy(dx: lineWidthHalf, dy: lineWidthHalf)
    }
    
    private func path(forIsRect isRect: Bool) -> UIBezierPath {
        return isRect ? UIBezierPath(rect: frameForContour()) : UIBezierPath(ovalIn: frameForContour())
    }
}
