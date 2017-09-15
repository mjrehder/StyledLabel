//
//  StyledShapeLayerBorder.swift
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

import UIKit

open class StyledShapeLayerBorder {
    open var thickness: CGFloat = 1
    open var color: UIColor = .black
    open var edge: UIRectEdge = .bottom
    open var insets: UIEdgeInsets = .zero

    public init() {}
    
    public init(edge: UIRectEdge = .bottom, thickness: CGFloat = 1, color: UIColor = .black, insets: UIEdgeInsets = .zero) {
        self.edge = edge
        self.thickness = thickness
        self.color = color
        self.insets = insets
    }
    
    open func apply(toLayer layer: CALayer) {
        layer.addBorder(self.edge, color: self.color, thickness: self.thickness, insets: self.insets)
    }
    
    open func remove(fromLayer layer: CALayer) {
        layer.removeBorder(self.edge)
    }
}
