//
//  ViewController.swift
//  UIKIT_FlashlightApp
//
//  Created by michael on 06/08/2024.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var isFlashlightOn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func lightaction(_ sender: UIButton) {
        isFlashlightOn.toggle()
        updateFlashlight()
    }
    func updateFlashlight() {
            guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else { return }
            do {
                try device.lockForConfiguration()
                device.torchMode = isFlashlightOn ? .on : .off
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        }
}

