Shader "Unlit/myflat" {

    Properties {
        _main ("main", 2D) = "white" {}
        _outline ("outline", Range(0, 1)) = 0.04700855
        _ramp ("ramp", 2D) = "white" {}
        _Diffuse_power ("Diffuse_power", Range(0, 20)) = 0
    }
    
    SubShader {
    
        Tags {
            "RenderType" = "Opaque"
        } 
        
        LOD 100
        
        Pass {
            Name "Outline"
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            
            uniform float _outline;
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.pos = UnityObjectToClipPos( float4( v.vertex.xyz + v.normal *  _outline , 1 ) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4( float3(0,0,0) , 0 );
            }
            ENDCG
        }
        
        Pass {
        
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            
            uniform float4 _LightColor0;
            uniform sampler2D _main; 
            uniform float4 _main_ST;
            
            float Half_lambert( float lambert ){
                return 0.5 * lambert + 0.5 ;
            } 
            
            uniform sampler2D _ramp; 
            uniform float4 _ramp_ST;
            uniform float _Diffuse_power;
            
            struct VertexInput {
            
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                
            };
            struct VertexOutput {
            
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
                
            };
            VertexOutput vert (VertexInput v) {
            
                VertexOutput o ;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir =  mul( unity_ObjectToWorld , float4( v.tangent.xyz, 0.0 ) ).xyz ; 
                o.bitangentDir = cross(o.normalDir, o.tangentDir) * v.tangent.w ;
                o.posWorld = mul( unity_ObjectToWorld, v.vertex );
                float3 lightColor = _LightColor0.rgb ;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
            
                i.normalDir = normalize( i.normalDir ); 
                i.tangentDir = normalize(i.tangentDir);
                i.bitangentDir = normalize(i.tangentDir);
                
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(  UnityWorldSpaceViewDir(i.posWorld ) );
                float3 normalLocal = mul( tangentTransform, cross( normalize( ddy(i.posWorld.rgb) ), normalize( ddx(i.posWorld.rgb))) ).xyz.rgb;
                float3 normalDirection = normalize( mul( normalLocal , tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize( _WorldSpaceLightPos0.xyz );
                float3 lightColor = _LightColor0.rgb ;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _main_var = tex2D(_main,TRANSFORM_TEX(i.uv0, _main));
                float node_6924 = Half_lambert( dot(i.normalDir,lightDirection) );
                float2 node_2924 = float2(node_6924,node_6924);
                float4 _ramp_var = tex2D(_ramp,TRANSFORM_TEX(node_2924, _ramp));
                float3 node_784 = (_main_var.rgb*_ramp_var.rgb);
                float3 diffuseColor = node_784;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (_Diffuse_power*node_784);
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
                
            }
            ENDCG
        } 
        
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _main; uniform float4 _main_ST;
            
            float Half_lambert( float lambert ){
                return 0.5*lambert+0.5;
            }
            
            uniform sampler2D _ramp; uniform float4 _ramp_ST;
            uniform float _Diffuse_power;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize( i.normalDir ); 
                i.tangentDir = normalize(i.tangentDir);
                i.bitangentDir = normalize(i.tangentDir);
                
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalLocal = mul( tangentTransform, cross(normalize(ddy(i.posWorld.rgb)),normalize(ddx(i.posWorld.rgb))) ).xyz.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _main_var = tex2D(_main,TRANSFORM_TEX(i.uv0, _main));
                float node_6924 = Half_lambert( dot(i.normalDir,lightDirection) );
                float2 node_2924 = float2(node_6924,node_6924);
                float4 _ramp_var = tex2D(_ramp,TRANSFORM_TEX(node_2924, _ramp));
                float3 node_784 = (_main_var.rgb*_ramp_var.rgb);
                float3 diffuseColor = node_784;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        
    }
    
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
