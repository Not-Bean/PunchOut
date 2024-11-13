Shader "Custom/Blinn"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)//changes the colour of the player
        _SpecColor("Spec Colour", Color) = (1,1,1,1)//changes the specular colour of the player
        _Spec("Specular", Range(0,1)) = 0.5 ///sets the level of shine the player lets off
        _Gloss("Gloss", Range(0,1)) = 0.5 //sets the glossiness of the player 
        
    }
    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf BlinnPhong
        float4 _Color;//lets colour be used in output
        half _Spec;//lets specular be used in output
        fixed _Gloss;
        //lets glossiness be used in output
        struct Input
        {
            float2 uv_MainTex; //gets the main texture as an input
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb; //makes the changes the colour of the player be visible
            o.Specular = _Spec;//sets the specular to be the same as slider changes
            o.Gloss = _Gloss;//sets the gloss to be the same as the gloss slider changes
        }
        ENDCG
    }
    FallBack "Diffuse"
}
