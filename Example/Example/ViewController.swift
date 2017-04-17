//
//  ViewController.swift
//  Example
//  Released under the MIT license.
//  http://github.com/Bajocode/ContourProgressView
//
//  Created by Fabijan Bajo on 17/04/2017.
//  Copyright © 2017 Fabijan Bajo. All rights reserved.
//

import UIKit
import ContourProgressView

class ViewController: UIViewController {

    
    // MARK: - Properties
    
    fileprivate var rectProgressView: ContourProgressView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Progress
        rectProgressView = ContourProgressView(frame: view.bounds, isRect: true)
        rectProgressView.isLineCapSquared = true
        rectProgressView.trackTintColor = .clear
        rectProgressView.progressTintColor = .black
        rectProgressView.lineWidth = 4
        view.addSubview(rectProgressView)
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Actions
    
    
    
    // MARK: - Navigation
}

