//
//  ViewController.swift
//  play_data
//
//  Created by zhuxinyu on 2018/12/16.
//  Copyright © 2018 havefun. All rights reserved.
//

import UIKit
import Metal

var device: MTLDevice!
var metalLayer: CAMetalLayer!
var objectToDraw: Triangle! = nil

var pipelineState: MTLRenderPipelineState!
var commandQueue: MTLCommandQueue!
var timer: CADisplayLink!
var vertextBuffer: MTLBuffer! = nil


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        device = MTLCreateSystemDefaultDevice()
        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .bgra8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        view.layer.addSublayer(metalLayer)
        
        objectToDraw = Triangle(device: device)
        
        let defaultLibrary = device.makeDefaultLibrary()!
        let fragmentProgram = defaultLibrary.makeFunction(name: "basic_fragment")
        let vertexProgram = defaultLibrary.makeFunction(name: "basic_vertex")
        
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        pipelineState = try! device.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
        
        commandQueue = device.makeCommandQueue()
        
        timer = CADisplayLink(target: self, selector: #selector(gameloop))
        timer.add(to: RunLoop.main, forMode: .default)
    
    }
    
    func render() {
        guard let drawable = metalLayer.nextDrawable() else {
            return
        }
        objectToDraw.render(commandQueue: commandQueue, pipelineState: pipelineState, drawable: drawable, clearColor: nil)
    }
    
    @objc func gameloop() {
        autoreleasepool{
            self.render()
        }
    }

}

