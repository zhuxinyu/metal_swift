//
//  Triangle.swift
//  play_data
//
//  Created by zhuxinyu on 2018/12/16.
//  Copyright © 2018 havefun. All rights reserved.
//

import Foundation
import Metal

class Triangle: Node {
    init(device: MTLDevice) {
        let v0 = Vertex.init(x: 0.0, y: 1.0, z: 0.0, r: 2.0, g: 0.0, b: 0.0, a: 2.0)
        let v1 = Vertex.init(x: -1.0, y: -1.0, z: 0.0, r: 0.0, g: 1.0, b: 0.0, a: 1.0)
        let v2 = Vertex.init(x: 1.0, y: -1.0, z: 0.0, r: 0.0, g: 0.0, b: 1.0, a: 1.0)
        
        let verticesArray = [v0, v1, v2]
        super.init(name: "Triangle", vertices: verticesArray, device: device)
    }
}
