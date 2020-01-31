//
//  MetalView.swift
//  hello_metal
//
//  Created by Yihung Lee on 1/25/20.
//  Copyright © 2020 Yihung Lee. All rights reserved.
//

import Foundation
import MetalKit

class MetalView: MTKView {
    var renderer: Renderer!

    required init(coder: NSCoder) {
        super.init(coder: coder)
        // Make sure we are on a device that can run metal!
        guard let defaultDevice = MTLCreateSystemDefaultDevice() else {
            fatalError("Device loading error")
        }
        self.device = defaultDevice
        self.colorPixelFormat = .bgra8Unorm
        // Our clear color, can be set to any color
        self.clearColor = MTLClearColor(red: 0.1, green: 0.57, blue: 0.25, alpha: 1)
        self.createRenderer(device: defaultDevice)
    }

    func createRenderer(device: MTLDevice) {
        renderer = Renderer(device: device)
        delegate = renderer
    }

}
