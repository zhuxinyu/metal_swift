//
//  Shaders.metal
//  play_data
//
//  Created by zhuxinyu on 2018/12/16.
//  Copyright © 2018 havefun. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

//vertex float4 basic_vertex(const device packed_float3* vertex_array [[buffer(0)]], unsigned int vid [[vertex_id]]){
//    return float4(vertex_array[vid], 1.0);
//}

//fragment half4 basic_fragment(){
//    return half4(1.0); // RGBA return (1,1,1,1) = white
//}

struct VertexIn{
    packed_float3 position;
    packed_float4 color;
};

struct VertexOut{
    float4 position [[position]];
    float4 color;
};

vertex VertexOut basic_vertex(const device VertexIn* vertex_array [[buffer(0)]], unsigned int vid [[vertex_id]]){
    VertexIn VertexIn = vertex_array[vid];
    
    VertexOut VertexOut;
    VertexOut.position = float4(VertexIn.position, 1);
    VertexOut.color = VertexIn.color;
    
    return VertexOut;
}

fragment half4 basic_fragment(VertexOut interpolated [[stage_in]]){
    return half4(interpolated.color[0], interpolated.color[1], interpolated.color[2], interpolated.color[3]);
}



