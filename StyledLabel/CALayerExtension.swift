//
//  CALayerExtension.swift
//  StyledLabel
//
//  Created by Martin Rehder on 15.09.2017.
/*
 * Copyright 2016-present Martin Jacob Rehder
 * http://www.rehsco.com
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

import Foundation
import UIKit

public extension CALayer {
    
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat, insets: UIEdgeInsets) {
        self.removeBorder(edge)
        
        let border = CALayer()
        
        var borderFrame = border.frame
        switch edge {
        case UIRectEdge.top:
            borderFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: thickness)
            border.frame = CGRect(x: borderFrame.origin.x + insets.left, y: borderFrame.origin.y + insets.top, width: borderFrame.size.width - (insets.left + insets.right), height: borderFrame.size.height)
        case UIRectEdge.bottom:
            borderFrame = CGRect(x: 0, y: self.bounds.height - thickness, width: self.bounds.width, height: thickness)
            border.frame = CGRect(x: borderFrame.origin.x + insets.left, y: borderFrame.origin.y - insets.bottom, width: borderFrame.size.width - (insets.left + insets.right), height: borderFrame.size.height)
        case UIRectEdge.left:
            borderFrame = CGRect(x: 0, y: 0, width: thickness, height: self.bounds.height)
            border.frame = CGRect(x: borderFrame.origin.x + insets.left, y: borderFrame.origin.y + insets.top, width: borderFrame.size.width, height: borderFrame.size.height - (insets.top + insets.bottom))
        case UIRectEdge.right:
            borderFrame = CGRect(x: self.bounds.width - thickness, y: 0, width: thickness, height: self.bounds.height)
            border.frame = CGRect(x: borderFrame.origin.x - insets.right, y: borderFrame.origin.y + insets.top, width: borderFrame.size.width, height: borderFrame.size.height - (insets.top + insets.bottom))
        default:
            break
        }
        
        border.backgroundColor = color.cgColor
        border.name = "style_border_\(edge.rawValue)"
        
        self.addSublayer(border)
    }
    
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        self.addBorder(edge, color: color, thickness: thickness, insets: UIEdgeInsets.zero)
    }
    
    func removeBorder(_ edge: UIRectEdge? = nil) {
        if let sublayers = self.sublayers {
            var idx = 0
            for layer in sublayers {
                if let layerName = layer.name {
                    if let e = edge {
                        if layerName.contains("style_border_\(e.rawValue)") {
                            self.sublayers?.remove(at: idx)
                            break
                        }
                    }
                    else if layerName.contains("style_border") {
                        self.sublayers?.remove(at: idx)
                        break
                    }
                }
                idx += 1
            }
        }
    }
}
