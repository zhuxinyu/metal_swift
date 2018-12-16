//
//  Vertex.swift
//  play_data
//
//  Created by zhuxinyu on 2018/12/16.
//  Copyright © 2018 havefun. All rights reserved.
//

import Foundation

struct Vertex {
    var x, y, z: Float    // position data
    var r, g, b, a: Float // color data
    
    func floatBuffer() -> [Float] {
        return [x, y, z, r, g, b, a]
    }
}
