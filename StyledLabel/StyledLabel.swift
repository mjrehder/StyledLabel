// Original copyright notice (Imported from SnappingStepper)
/*
 * StyledLabel
 * Created by Martin Rehder.
 *
 * SnappingStepper
 *
 * Copyright 2015-present Yannick Loriot.
 * http://yannickloriot.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import UIKit

/// The `StyledLabel` object is an `UILabel` with a custom shape.
open class StyledLabel: UIView {
    open var label = UILabel()
    var styleColor: UIColor? = UIColor.clear
    var shapeLayer           = CAShapeLayer()
    
    open var style: ShapeStyle = .box {
        didSet {
            applyStyle()
        }
    }
    
    /// The label bounds is the rect in which the label is filled into. `self.bounds` is used when not set. Default is nil.
    open var labelBounds: CGRect? = nil {
        didSet {
            applyStyle()
        }
    }
    
    open var text: String? {
        didSet {
            label.text = text
        }
    }
    
    open var attributedText: NSAttributedString? {
        didSet {
            label.attributedText = attributedText
        }
    }
    
    open var textColor: UIColor = .black {
        didSet {
            label.textColor = textColor
        }
    }
    
    open override var backgroundColor: UIColor? {
        get {
            return .clear
        }
        set {
            styleColor = newValue
            
            applyStyle()
        }
    }
    
    open var borderColor: UIColor? {
        didSet {
            applyStyle()
        }
    }
    
    open var borderWidth: CGFloat = 1.0 {
        didSet {
            applyStyle()
        }
    }
    
    open var font: UIFont? {
        didSet {
            label.font = font
        }
    }
    
    open var textAlignment: NSTextAlignment = .center {
        didSet {
            label.textAlignment = textAlignment
        }
    }
    
    open var rotationInRadians: CGFloat = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    open var layerBorders: [StyledShapeLayerBorder] = [] {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        self.layer.addSublayer(self.shapeLayer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.addSublayer(self.shapeLayer)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        self.applyStyle()
        label.removeFromSuperview()
        
        self.label.frame = self.labelBounds ?? bounds
        self.label.transform = CGAffineTransform(rotationAngle: self.rotationInRadians)
        self.label.frame = self.labelBounds ?? bounds
        self.addSubview(label)
    }
    
    open func applyStyle() {
        let bgColor = styleColor ?? .clear
        let sLayer: CAShapeLayer
        
        if let borderColor = borderColor {
            sLayer = StyledShapeLayer.createShape(style, bounds: bounds, color: bgColor, borderColor: borderColor, borderWidth: borderWidth)
        }
        else {
            sLayer = StyledShapeLayer.createShape(style, bounds: bounds, color: bgColor)
        }
        
        sLayer.frame = self.bounds
        
        for lBorder in self.layerBorders {
            lBorder.apply(toLayer: sLayer)
        }
        
        if self.shapeLayer.superlayer != nil {
            self.layer.replaceSublayer(shapeLayer, with: sLayer)
        }
        
        self.shapeLayer = sLayer
    }
}
