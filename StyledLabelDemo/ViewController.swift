//
//  ViewController.swift
//  StyledLabelDemo
//
//  Created by Martin Rehder on 15.09.2017.
//  Copyright © 2017 Martin Jacob Rehder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        let label1 = StyledLabel()
        self.view.addSubview(label1)
        label1.text = "Label 1"
        
        let label2 = StyledLabel()
        self.view.addSubview(label2)
        label2.text = "Label 2"
        label2.layerBorders = [StyledShapeLayerBorder(edge: .bottom, thickness: 1, color: .red, insets: .zero)]

        let label3 = StyledLabel()
        self.view.addSubview(label3)
        label3.text = "Label 3"
        label3.layerBorders = [StyledShapeLayerBorder(edge: .right, thickness: 1, color: .blue, insets: UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 10)),
                               StyledShapeLayerBorder(edge: .left, thickness: 2, color: .blue, insets: UIEdgeInsets(top: 0, left: -2, bottom: 0, right: 0))]

        label1.frame = CGRect(x: 25, y: 100, width: 200, height: 18)
        label2.frame = CGRect(x: 25, y: 130, width: 200, height: 18)
        label3.frame = CGRect(x: 25, y: 160, width: 200, height: 18)
    }

}

