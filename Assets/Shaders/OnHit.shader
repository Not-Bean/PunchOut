Shader "Custom/Hologram"
{
    Properties
    {
        _RimColor("Rim Colour", Color) = (0,0.5,0.5,0.0)//Lets the colour of the player to be changed
        _RimPower("Rim Power", Range(0.5, 8.0)) = 3.0//lets the visibility of the player's edges to be changed
    } 
    SubShader
    {
        Tags{"Queue" = "Transparent"}
        
        Pass
        {
            ZWrite On
            ColorMask 0
        }
        
        CGPROGRAM
        
        #pragma surface surf Lambert alpha:fade//uses lambert shader

        struct Input
        {
            float3 viewDir;//gets direction the model is being viewed from
        };

        float4 _RimColor;//allows rimcolour to be used in output
        float _RimPower;//allows rimpower to be used in output

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = dot (normalize(IN.viewDir), o.Normal);//gets the normal value of the rim
            o.Emission = _RimColor.rgb * rim;//sets the colour of the object
            o.Alpha = pow(rim, _RimPower);//sets the visibility of the rim edges
        }
        ENDCG
    }
    FallBack "Diffuse"
}
