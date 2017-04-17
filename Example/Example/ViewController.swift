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
import AVKit
import AVFoundation
import ContourProgressView

class ViewController: UIViewController {

    
    // MARK: - Properties
    
    fileprivate var rectProgressView: ContourProgressView!
    fileprivate var trailerLocation: URL {
        let documentsDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDir.appendingPathComponent("trailer.mp4")
    }
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: self, delegateQueue: .main)
    }()
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var ovalProgressView: ContourProgressView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    // MARK: - Methods
    
    private func configure() {
        // ScrollView
        scrollView.delegate = self
        
        // Progress
        rectProgressView = ContourProgressView(frame: view.bounds, isRect: true)
        rectProgressView.isLineCapSquared = true
        rectProgressView.trackTintColor = .clear
        rectProgressView.progressTintColor = .black
        rectProgressView.lineWidth = 4
        view.addSubview(rectProgressView)
    }
    
    
    // MARK: - Actions
    
    @IBAction func downloadButtonPressed(_ sender: UIButton) {
        // A quick download example demonstrating progress & bytes written
        session.downloadTask(with: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!).resume()
    }
    
    
    // MARK: - Navigation
}


// MARK: - UIScrollViewDelegate

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // ContourProgressView progress does not go beyond 1.0
        let maxOffset: CGFloat = -150
        let relativeProgress = CGFloat(scrollView.contentOffset.y / maxOffset)
        rectProgressView.progress = relativeProgress
        ovalProgressView.progress = relativeProgress
    }
}


// MARK: - URLSessionDownloadDelegate

extension ViewController: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // Session is configured to shedule delegate calls on the main thread
        let currentProgress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        rectProgressView.progress = currentProgress
        ovalProgressView.progress = currentProgress
        downloadLabel.text = "\(Int(currentProgress * 100)) %"
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Download complete")
    }
}


