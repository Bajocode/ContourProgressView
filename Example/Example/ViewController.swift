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
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: self, delegateQueue: .main)
    }()
    
    
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
        
        // A quick download example demonstrating progress & bytes written
        session.downloadTask(with: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!).resume()
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Actions
    
    
    
    // MARK: - Navigation
}


// MARK: - URLSessionDownloadDelegate

extension ViewController: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // Session is configured to shedule delegate calls on the main thread
        let currentProgress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        rectProgressView.progress = currentProgress
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Download complete")
    }
}


