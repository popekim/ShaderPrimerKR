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
// ColorShader
//--------------------------------------------------------------//
//--------------------------------------------------------------//
// Pass 0
//--------------------------------------------------------------//
string ColorShader_Pass_0_Model : ModelData = ".\\sphere.x";

float4x4 gWorldMatrix : World;         
float4x4 gViewMatrix : View;          
float4x4 gProjectionMatrix : Projection;    


struct VS_INPUT 
{
   float4 mPosition : POSITION;
   
};

struct VS_OUTPUT 
{
   float4 mPosition : POSITION;
};


VS_OUTPUT ColorShader_Pass_0_Vertex_Shader_vs_main( VS_INPUT Input )
{
   VS_OUTPUT Output;

   Output.mPosition = mul( Input.mPosition, gWorldMatrix );
   Output.mPosition = mul( Output.mPosition, gViewMatrix );
   Output.mPosition = mul( Output.mPosition, gProjectionMatrix );
   
   return Output;
}




float4 ColorShader_Pass_0_Pixel_Shader_ps_main() : COLOR
{   
   return float4( 1.0f, 0.0f, 0.0f, 1.0f );
}


//--------------------------------------------------------------//
// Technique Section for ColorShader
//--------------------------------------------------------------//
technique ColorShader
{
   pass Pass_0
   {
      VertexShader = compile vs_2_0 ColorShader_Pass_0_Vertex_Shader_vs_main();
      PixelShader = compile ps_2_0 ColorShader_Pass_0_Pixel_Shader_ps_main();
   }

}

