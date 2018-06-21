// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:2,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:981,x:32603,y:33319,varname:node_981,prsc:2|diff-784-OUT,normal-4667-XYZ,emission-1406-OUT,olwid-5350-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:6635,x:31087,y:32983,varname:node_6635,prsc:2;n:type:ShaderForge.SFN_DDX,id:407,x:31284,y:33167,varname:node_407,prsc:2|IN-6635-XYZ;n:type:ShaderForge.SFN_DDY,id:4782,x:31286,y:33011,varname:node_4782,prsc:2|IN-6635-XYZ;n:type:ShaderForge.SFN_Normalize,id:8413,x:31508,y:33167,varname:node_8413,prsc:2|IN-407-OUT;n:type:ShaderForge.SFN_Normalize,id:2963,x:31522,y:33011,varname:node_2963,prsc:2|IN-4782-OUT;n:type:ShaderForge.SFN_Cross,id:7269,x:31730,y:33043,varname:node_7269,prsc:2|A-2963-OUT,B-8413-OUT;n:type:ShaderForge.SFN_Transform,id:4667,x:31935,y:33064,varname:node_4667,prsc:2,tffrom:0,tfto:2|IN-7269-OUT;n:type:ShaderForge.SFN_Tex2d,id:9115,x:32136,y:32874,ptovrint:False,ptlb:main,ptin:_main,varname:node_9115,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:04a0aebd171500c4299197e9beee9af1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:5350,x:31969,y:34035,ptovrint:False,ptlb:outline,ptin:_outline,varname:node_5350,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.04700855,max:1;n:type:ShaderForge.SFN_NormalVector,id:7914,x:30888,y:33381,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:3231,x:30871,y:33540,varname:node_3231,prsc:2;n:type:ShaderForge.SFN_Dot,id:6933,x:31167,y:33461,varname:node_6933,prsc:2,dt:0|A-7914-OUT,B-3231-OUT;n:type:ShaderForge.SFN_Append,id:2924,x:31396,y:33771,varname:node_2924,prsc:2|A-6924-OUT,B-6924-OUT;n:type:ShaderForge.SFN_Multiply,id:784,x:31830,y:33572,varname:node_784,prsc:2|A-9115-RGB,B-7750-RGB;n:type:ShaderForge.SFN_Code,id:6924,x:31057,y:33762,varname:node_6924,prsc:2,code:cgBlAHQAdQByAG4AIAAwAC4ANQAqAGwAYQBtAGIAZQByAHQAKwAwAC4ANQA7AA==,output:0,fname:Half_lambert,width:247,height:132,input:0,input_1_label:lambert|A-6933-OUT;n:type:ShaderForge.SFN_Tex2d,id:7750,x:31603,y:33754,ptovrint:False,ptlb:ramp,ptin:_ramp,varname:node_7750,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2924-OUT;n:type:ShaderForge.SFN_Slider,id:3926,x:31713,y:33472,ptovrint:False,ptlb:Diffuse_power,ptin:_Diffuse_power,varname:node_3926,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:20;n:type:ShaderForge.SFN_Multiply,id:1406,x:32099,y:33662,varname:node_1406,prsc:2|A-3926-OUT,B-784-OUT;proporder:9115-5350-7750-3926;pass:END;sub:END;*/

Shader "Unlit/flat" {
    Properties {
        _main ("main", 2D) = "white" {}
        _outline ("outline", Range(0, 1)) = 0.04700855
        _ramp ("ramp", 2D) = "white" {}
        _Diffuse_power ("Diffuse_power", Range(0, 20)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 100
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _outline;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_outline,1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(float3(0,0,0),0);
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
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalLocal = mul( tangentTransform, cross(normalize(ddy(i.posWorld.rgb)),normalize(ddx(i.posWorld.rgb))) ).xyz.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
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
                i.normalDir = normalize(i.normalDir);
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
