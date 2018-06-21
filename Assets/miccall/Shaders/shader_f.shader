// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2821,x:33032,y:32807,varname:node_2821,prsc:2|emission-7626-OUT,olwid-3589-OUT,olcol-7796-RGB;n:type:ShaderForge.SFN_LightVector,id:9826,x:31483,y:32657,varname:node_9826,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:5687,x:31483,y:32798,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:903,x:31669,y:32727,varname:node_903,prsc:2,dt:0|A-9826-OUT,B-5687-OUT;n:type:ShaderForge.SFN_Step,id:7451,x:32400,y:32643,varname:node_7451,prsc:2|A-7790-OUT,B-3859-OUT;n:type:ShaderForge.SFN_Slider,id:7790,x:32097,y:32516,ptovrint:False,ptlb:node_7790,ptin:_node_7790,varname:node_7790,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.8,cur:0.9895369,max:1;n:type:ShaderForge.SFN_Append,id:2148,x:32013,y:33213,varname:node_2148,prsc:2|A-3859-OUT,B-3859-OUT;n:type:ShaderForge.SFN_Tex2d,id:5371,x:32209,y:33213,ptovrint:False,ptlb:ramp,ptin:_ramp,varname:node_5371,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3cd62c3f9b6104548a63fd9ca1c88151,ntxv:0,isnm:False|UVIN-2148-OUT;n:type:ShaderForge.SFN_Code,id:3859,x:31849,y:32727,varname:node_3859,prsc:2,code:cgBlAHQAdQByAG4AIAAwAC4ANQAqAEwAXwBOACsAMAAuADUAOwA=,output:0,fname:Lambert,width:247,height:132,input:0,input_1_label:L_N|A-903-OUT;n:type:ShaderForge.SFN_Slider,id:3589,x:32941,y:33705,ptovrint:False,ptlb:outline,ptin:_outline,varname:node_3589,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.05514865,max:1;n:type:ShaderForge.SFN_Color,id:7796,x:33001,y:33521,ptovrint:False,ptlb:outline_color,ptin:_outline_color,varname:node_7796,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:7263,x:32209,y:33000,ptovrint:False,ptlb:main_tex,ptin:_main_tex,varname:node_7263,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:04a0aebd171500c4299197e9beee9af1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:711,x:32415,y:33160,varname:node_711,prsc:2|A-7263-RGB,B-5371-RGB;n:type:ShaderForge.SFN_Add,id:7626,x:32560,y:32830,varname:node_7626,prsc:2|A-7451-OUT,B-711-OUT;proporder:7790-5371-3589-7796-7263;pass:END;sub:END;*/

Shader "Unlit/shader_f" {
    Properties {
        _node_7790 ("node_7790", Range(0.8, 1)) = 0.9895369
        _ramp ("ramp", 2D) = "white" {}
        _outline ("outline", Range(0, 1)) = 0.05514865
        _outline_color ("outline_color", Color) = (0.5,0.5,0.5,1)
        _main_tex ("main_tex", 2D) = "white" {}
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
            uniform float4 _outline_color;
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
                return fixed4(_outline_color.rgb,0);
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
            uniform float _node_7790;
            uniform sampler2D _ramp; uniform float4 _ramp_ST;
            float Lambert( float L_N ){
            return 0.5*L_N+0.5;
            }
            
            uniform sampler2D _main_tex; uniform float4 _main_tex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_3859 = Lambert( dot(lightDirection,i.normalDir) );
                float4 _main_tex_var = tex2D(_main_tex,TRANSFORM_TEX(i.uv0, _main_tex));
                float2 node_2148 = float2(node_3859,node_3859);
                float4 _ramp_var = tex2D(_ramp,TRANSFORM_TEX(node_2148, _ramp));
                float3 emissive = (step(_node_7790,node_3859)+(_main_tex_var.rgb*_ramp_var.rgb));
                float3 finalColor = emissive;
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
            uniform float _node_7790;
            uniform sampler2D _ramp; uniform float4 _ramp_ST;
            float Lambert( float L_N ){
            return 0.5*L_N+0.5;
            }
            
            uniform sampler2D _main_tex; uniform float4 _main_tex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float3 finalColor = 0;
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
