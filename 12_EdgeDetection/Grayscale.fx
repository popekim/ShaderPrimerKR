//**************************************************************//
//  Effect File exported by RenderMonkey 1.6
//
//  - Although many improvements were made to RenderMonkey FX  
//    file export, there are still situations that may cause   
//    compilation problems once the file is exported, such as  
//    occasional naming conflicts for methods, since FX format 
//    does not support any notions of name spaces. You need to 
//    try to create workspaces in such a way as to minimize    
//    potential naming conflicts on export.                    
//    
//  - Note that to minimize resulting name collisions in the FX 
//    file, RenderMonkey will mangle names for passes, shaders  
//    and function names as necessary to reduce name conflicts. 
//**************************************************************//

//--------------------------------------------------------------//
// ColorConversion
//--------------------------------------------------------------//
//--------------------------------------------------------------//
// Grayscale
//--------------------------------------------------------------//
string ColorConversion_Grayscale_ScreenAlignedQuad : ModelData = "..\\..\\..\\..\\..\\..\\..\\..\\Program Files (x86)\\AMD\\RenderMonkey 1.82\\Examples\\Media\\Models\\ScreenAlignedQuad.3ds";

struct VS_INPUT 
{
   float4 mPosition: POSITION;
   float2 mUV : TEXCOORD0;
};


struct VS_OUTPUT 
{
   float4 mPosition: POSITION;
   float2 mUV : TEXCOORD0;
};


VS_OUTPUT ColorConversion_Grayscale_Vertex_Shader_vs_main( VS_INPUT Input )
{
   VS_OUTPUT Output;
   
   Output.mPosition = Input.mPosition;
   Output.mUV = Input.mUV;
   
   return Output;
}


struct PS_INPUT 
{
   float2 mUV : TEXCOORD0;
};

texture SceneTexture_Tex
<
   string ResourceName = ".\\";
>;
sampler2D SceneSampler = sampler_state
{
   Texture = (SceneTexture_Tex);
};

float4 ColorConversion_Grayscale_Pixel_Shader_ps_main( PS_INPUT Input ) : COLOR
{
   float4 tex = tex2D(SceneSampler, Input.mUV);
   
   //tex.rgb = (tex.r + tex.g + tex.b ) / 3;
   //tex.rgb = tex.r * 0.3 + tex.g * 0.59 + tex.b * 0.11;
   tex.rgb = dot(tex.rgb, float3(0.3, 0.59, 0.11));
   
   return tex;
}
//--------------------------------------------------------------//
// Technique Section for ColorConversion
//--------------------------------------------------------------//
technique ColorConversion
{
   pass Grayscale
   {
      CULLMODE = NONE;

      VertexShader = compile vs_2_0 ColorConversion_Grayscale_Vertex_Shader_vs_main();
      PixelShader = compile ps_2_0 ColorConversion_Grayscale_Pixel_Shader_ps_main();
   }

}

