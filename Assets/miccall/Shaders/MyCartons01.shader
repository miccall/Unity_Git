// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Standard,iptp:0,cusa:False,bamd:0,cgin:VQBuAGkAdAB5AEMARwA=,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2821,x:32780,y:32700,varname:node_2821,prsc:2|diff-2852-OUT;n:type:ShaderForge.SFN_LightVector,id:9826,x:32019,y:32789,varname:node_9826,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:5687,x:32019,y:32596,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:903,x:32168,y:32680,varname:node_903,prsc:2,dt:0|A-5687-OUT,B-9826-OUT;n:type:ShaderForge.SFN_Color,id:6266,x:32308,y:33085,ptovrint:False,ptlb:node_6266,ptin:_node_6266,varname:node_6266,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7720588,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:2852,x:32484,y:32796,varname:node_2852,prsc:2|A-3013-OUT,B-6266-RGB;n:type:ShaderForge.SFN_Max,id:3013,x:32322,y:32751,varname:node_3013,prsc:2|A-903-OUT,B-2677-OUT;n:type:ShaderForge.SFN_Vector1,id:2677,x:32168,y:32891,varname:node_2677,prsc:2,v1:0;proporder:6266;pass:END;sub:END;*/

Shader "RealToon/Version 2/Single Light/Outline/Default" {
    Properties {
        [Header(RealToon V2.0.0 Single Light x Outline Default )]


        [Header(MainMap__________________________________________________________________)]
        _Texture ("Texture", 2D) = "white" {}
        _Color ("Color", Color) = (0.8014706,0.8014706,0.8014706,1)
        [MaterialToggle] _Transparent ("Transparent", Float ) = 0

        [Space(20)]
        [Header(NormalMap__________________________________________________________________)]
        [Normal] _NormalMap ("Normal Map", 2D) = "bump" {}
        _NormalIntensity ("Normal Intensity 法线贴图融合强度 ", Float ) = 1

        [Space(20)]
        [Header(Color Adjustment__________________________________________________________________)]
        _Saturation ("Saturation 饱和度 ", Range(0, 2)) = 1
        _ReduceWhite ("Reduce White 白噪", Range(0, 1)) = 0

        [Space(20)]
        [Header(Outline__________________________________________________________________)]
        _OutlineWidth ("Outline Width 边缘线宽度", Range(0, 1)) = 0.003
        _OutlineNoiseIntensity ("Outline Noise Intensity 边缘线强度", Range(0, 1)) = 0
        _OutlineColor ("Outline Color 边缘线颜色 ", Color) = (0,0,0,1)

        [Space(20)]
        [Header(Self Lit__________________________________________________________________)]
        _SelfLitIntensity ("Self Lit Intensity", Range(0, 1)) = 0
        _SelfLitPower ("Self Lit Power", Float ) = 1
        _SelfLitColor ("Self Lit Color", Color) = (1,1,1,1)
        _MaskSelfLit ("Mask Self Lit", 2D) = "white" {}

        [Space(20)]
        [Header(Gloss__________________________________________________________________)]
        _GlossIntensity ("Gloss Intensity", Float ) = 0
        _Glossiness ("Glossiness", Range(0, 1)) = 0.5
        _GlossColor ("Gloss Color", Color) = (1,1,1,1)
        [MaterialToggle] _SoftGloss ("Soft Gloss", Float ) = 0
        _GlossMask ("Gloss Mask", 2D) = "white" {}
        
        [Space(20)]
        [Header(Shadow__________________________________________________________________)]
        _ShadowIntensity ("Shadow Intensity", Range(0, 1)) = 1
        _ShadowColor ("Shadow Color", Color) = (0,0,0,1)
        [MaterialToggle] _MainTextureColorShadow ("Main Texture Color Shadow", Float ) = 0
        _ReceiveShadowsIntensity ("Receive Shadows Intensity", Range(0, 1)) = 1
        _ShadowPTextureIntensity ("Shadow PTexture Intensity", Range(0, 1)) = 0
        _ShadowPTexture ("Shadow PTexture", 2D) = "black" {}
        
        [Space(20)]
        [Header(Self Shadow__________________________________________________________________)]
        _SelfShadowIntensity ("Self Shadow Intensity", Range(0, 1)) = 1
        _SelfShadowSize ("Self Shadow Size", Range(0, 1)) = 0.56
        _SelfShadowHardness ("Self Shadow Hardness", Range(0, 1)) = 1
        [MaterialToggle] _SelfShadowatViewDirection ("Self Shadow at View Direction", Float ) = 0


        [Space(20)]
        [Header(AO__________________________________________________________________)]
        _AOIntensity ("AO Intensity", Range(0, 1)) = 0
        _AOTexture ("AO Texture", 2D) = "white" {}
        [MaterialToggle] _MainTextureColorAO ("Main Texture Color AO", Float ) = 0
        [MaterialToggle] _ShowAOonLight ("Show AO on Light", Float ) = 0
        [MaterialToggle] _ShowAOonAmbientLight ("Show AO on Ambient Light", Float ) = 1
        
        
        [Space(20)]
        [Header(FReflection__________________________________________________________________)]
        _FReflectionIntensity ("FReflection Intensity", Range(0, 1)) = 0
        _FReflection ("FReflection", 2D) = "white" {}
        _MaskFReflection ("Mask FReflection", 2D) = "white" {}


        [Space(20)]
        [Header(Fresnel__________________________________________________________________)]
        _FresnelIntensity ("Fresnel Intensity", Range(0, 1)) = 0
        _FresnelColor ("Fresnel Color", Color) = (1,1,1,1)
        _FresnelFill ("Fresnel Fill", Float ) = 1
        [MaterialToggle] _HardEdgeFresnel ("Hard Edge Fresnel", Float ) = 0
        [MaterialToggle] _FresnelVisibleOnDarkAmbientLight ("Fresnel Visible On Dark/Ambient Light", Float ) = 0
        [MaterialToggle] _FresnelOnLight ("Fresnel On Light", Float ) = 1
        [MaterialToggle] _FresnelOnShadow ("Fresnel On Shadow", Float ) = 1
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
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
            #pragma exclude_renderers xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Texture; 
            uniform float4 _Texture_ST;
            uniform float4 _OutlineColor;
            uniform float _OutlineWidth;
            uniform fixed _Transparent;
            uniform float _OutlineNoiseIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 node_2257 = _Time + _TimeEditor;
                float node_5371_ang = node_2257.g;
                float node_5371_spd = 0.002;
                float node_5371_cos = cos(node_5371_spd*node_5371_ang);
                float node_5371_sin = sin(node_5371_spd*node_5371_ang);
                float2 node_5371_piv = float2(0.5,0.5);
                float2 node_5371 = (mul(o.uv0-node_5371_piv,float2x2( node_5371_cos, -node_5371_sin, node_5371_sin, node_5371_cos)) + node_5371_piv);
                float2 node_7493_skew = node_5371 + 0.2127+node_5371.x*0.3713*node_5371.y;
                float2 node_7493_rnd = 4.789*sin(489.123*(node_7493_skew));
                float node_7493 = frac(node_7493_rnd.x*node_7493_rnd.y*(1+node_7493_skew.x));
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*(lerp(1.0,node_7493,_OutlineNoiseIntensity)*_OutlineWidth),1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                clip(lerp( 1.0, _Texture_var.a, _Transparent ) - 0.5);
                return fixed4(_OutlineColor.rgb,0);
            }
            ENDCG
        }
        
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One OneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Texture; 
            uniform float4 _Texture_ST;
            uniform float4 _Color;
            uniform float _Glossiness;
            uniform float4 _GlossColor;
            uniform float4 _ShadowColor;
            uniform sampler2D _NormalMap; 
            uniform float4 _NormalMap_ST;
            uniform float _SelfShadowHardness;
            uniform float _NormalIntensity;
            uniform float _Saturation;
            uniform float _SelfShadowIntensity;
            uniform sampler2D _MaskSelfLit; 
            uniform float4 _MaskSelfLit_ST;
            uniform sampler2D _FReflection; 
            uniform float4 _FReflection_ST;
            uniform sampler2D _MaskFReflection; 
            uniform float4 _MaskFReflection_ST;
            uniform float _FReflectionIntensity;
            uniform sampler2D _GlossMask; 
            uniform float4 _GlossMask_ST;
            uniform fixed _SoftGloss;
            uniform float _SelfLitIntensity;
            uniform fixed _Transparent;
            uniform float _SelfShadowSize;
            uniform float _GlossIntensity;
            uniform float4 _SelfLitColor;
            uniform float _SelfLitPower;
            uniform float _ReduceWhite;
            uniform float _FresnelFill;
            uniform float4 _FresnelColor;
            uniform float _FresnelIntensity;
            uniform fixed _HardEdgeFresnel;
            uniform sampler2D _ShadowPTexture; 
            uniform float4 _ShadowPTexture_ST;
            uniform float _ShadowPTextureIntensity;
            uniform fixed _SelfShadowatViewDirection;
            uniform float _ReceiveShadowsIntensity;
            uniform sampler2D _AOTexture; 
            uniform float4 _AOTexture_ST;
            uniform float _AOIntensity;
            uniform fixed _ShowAOonLight;
            uniform fixed _ShowAOonAmbientLight;
            uniform float _ShadowIntensity;
            uniform fixed _MainTextureColorShadow;
            uniform fixed _MainTextureColorAO;
            uniform fixed _FresnelOnLight;
            uniform fixed _FresnelOnShadow;
            uniform fixed _FresnelVisibleOnDarkAmbientLight;
            
            
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
                float4 screenPos : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = lerp(float3(0,0,1),_NormalMap_var.rgb,_NormalIntensity);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform ));
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                clip( lerp( 1.0 , _Texture_var.a , _Transparent ) - 0.5 ); 
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float node_6003 = pow(1.0-max(0,dot(normalDirection, viewDirection)),exp2((1.0 - _FresnelFill)));
                float _HardEdgeFresnel_var = lerp( node_6003, smoothstep( 0.38, 0.4, node_6003 ), _HardEdgeFresnel );
                float node_3815 = 1.0;
                float node_9545 = smoothstep( lerp(0.3,0.899,_SelfShadowHardness), 0.9, saturate((0.5*dot(lerp( lightDirection, viewDirection, _SelfShadowatViewDirection ),normalDirection)+0.5*lerp(2.8,0.79,_SelfShadowSize))) );
                float node_2697 = (attenuation*node_9545);
                float node_4725 = (_HardEdgeFresnel_var*lerp(0.0,_HardEdgeFresnel_var,(lerp( node_3815, node_2697, _FresnelOnLight )*lerp( node_3815, (1.0 - node_2697), _FresnelOnShadow ))));
                float3 node_137 = ((node_4725*_FresnelColor.rgb)*_FresnelIntensity);
                float3 node_4607 = (_Texture_var.rgb*_Color.rgb);
                float3 node_7134 = (float3(i.screenPos.rg,0.0)+normalDirection);
                float4 _FReflection_var = tex2D(_FReflection,TRANSFORM_TEX(node_7134, _FReflection));
                float4 _MaskFReflection_var = tex2D(_MaskFReflection,TRANSFORM_TEX(i.uv0, _MaskFReflection));
                float3 node_3766 = lerp(node_4607,lerp(_FReflection_var.rgb,node_4607,(1.0 - _MaskFReflection_var.rgb)),_FReflectionIntensity);
                float node_1736 = 1.0;
                float node_939 = 0.0;
                float node_1159 = 1.0;
                float4 _AOTexture_var = tex2D(_AOTexture,TRANSFORM_TEX(i.uv0, _AOTexture));
                float3 node_2724 = lerp(float3(node_1736,node_1736,node_1736),lerp(lerp(float3(node_939,node_939,node_939),(_Texture_var.rgb*0.9),_MainTextureColorAO),float3(node_1159,node_1159,node_1159),lerp(_AOTexture_var.rgb,dot(_AOTexture_var.rgb,float3(0.3,0.59,0.11)),1.0)),lerp(0.0,lerp(1.0,10.0,_MainTextureColorAO),_AOIntensity));
                float3 node_4224 = (node_3766*UNITY_LIGHTMODEL_AMBIENT.rgb*lerp( 1.0, node_2724, _ShowAOonAmbientLight ));
                float4 _MaskSelfLit_var = tex2D(_MaskSelfLit,TRANSFORM_TEX(i.uv0, _MaskSelfLit));
                float node_5038 = (1.0 - _ReduceWhite);
                float node_3161 = (1.0 - _Saturation);
                float3 emissive = lerp(saturate(min((lerp((0.0*node_137),((node_4725*_FresnelColor.rgb)*_FresnelIntensity),_FresnelVisibleOnDarkAmbientLight)+lerp(node_4224,lerp(node_4224,(_SelfLitColor.rgb*node_3766*_SelfLitPower),_MaskSelfLit_var.rgb),lerp(0.0,1.0,_SelfLitIntensity))),node_5038)),dot(saturate(min((lerp((0.0*node_137),((node_4725*_FresnelColor.rgb)*_FresnelIntensity),_FresnelVisibleOnDarkAmbientLight)+lerp(node_4224,lerp(node_4224,(_SelfLitColor.rgb*node_3766*_SelfLitPower),_MaskSelfLit_var.rgb),lerp(0.0,1.0,_SelfLitIntensity))),node_5038)),float3(0.3,0.59,0.11)),node_3161);
                float node_7397 = (lerp(1.0,attenuation,_ReceiveShadowsIntensity)*lerp(1.0,node_9545,_SelfShadowIntensity));
                float node_2192 = lerp(1.0,node_7397,lerp(0.0,lerp(1.0,2.6,_MainTextureColorShadow),_ShadowIntensity));
                float node_6054 = (1.0 - node_2192);
                float node_6731 = 0.0;
                float node_7988 = 0.0;
                float node_557 = 1.0;
                float4 _ShadowPTexture_var = tex2D(_ShadowPTexture,TRANSFORM_TEX(float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg, _ShadowPTexture));
                float node_3933 = 0.0;
                float node_3448 = 1.0;
                float node_7581 = 0.0;
                float node_9744 = pow(max(0,dot(normalDirection,halfDirection)),exp2(lerp(-2,15,_Glossiness)));
                float _SoftGloss_var = lerp( smoothstep( 0.79, 0.9, (node_9744*3.0) ), node_9744, _SoftGloss );
                float4 _GlossMask_var = tex2D(_GlossMask,TRANSFORM_TEX(i.uv0, _GlossMask));
                float node_2583 = 0.0;
                float node_8388_if_leA = step(_GlossIntensity,node_2583);
                float node_8388_if_leB = step(node_2583,_GlossIntensity);
                float node_8355 = 0.0;
                float3 finalColor = emissive + 
                                    lerp( 
                                        saturate(  
                                            min(   
                                                ((((node_3766*(lerp(float3(node_2192,node_2192,node_2192),
                                                lerp(lerp((node_6054*_ShadowColor.rgb),
                                                lerp(float3(node_6731,node_6731,node_6731),
                                                saturate((1.0-((1.0-0.44)/_Texture_var.rgb))),node_6054),
                                                _MainTextureColorShadow),lerp(float3(node_7988,node_7988,node_7988),
                                                (lerp(lerp(float3(node_557,node_557,node_557),
                                                _ShadowPTexture_var.rgb,
                                                _ShadowPTexture_var.a),
                                                float3(node_3933,node_3933,node_3933),
                                                node_7397)
                                                *
                                                lerp(0.54,1.65,_MainTextureColorShadow)),_ShadowIntensity),_ShadowPTextureIntensity),0.65)*2.86))
                                                *lerp( lerp(node_2724,float3(node_3448,node_3448,node_3448),node_7397), node_2724, _ShowAOonLight ))
                                                +(lerp(float3(node_7581,node_7581,node_7581),lerp(float3(_SoftGloss_var,_SoftGloss_var,_SoftGloss_var)
                                                ,(_SoftGloss_var*_GlossColor.rgb),2.22),_GlossMask_var.rgb)*lerp((node_8388_if_leA*node_2583)+
                                                (node_8388_if_leB*_GlossIntensity),_GlossIntensity,node_8388_if_leA*node_8388_if_leB))+
                                                lerp(node_137,float3(node_8355,node_8355,node_8355),_FresnelVisibleOnDarkAmbientLight))*
                                                _LightColor0.rgb),node_5038)),dot(saturate(min(((((node_3766*(
                                                lerp(float3(node_2192,node_2192,node_2192),lerp(lerp((node_6054*_ShadowColor.rgb),
                                                lerp(float3(node_6731,node_6731,node_6731),saturate((1.0-((1.0-0.44)/_Texture_var.rgb)))
                                                ,node_6054),_MainTextureColorShadow),lerp(float3(node_7988,node_7988,node_7988),
                                                (lerp(lerp(float3(node_557,node_557,node_557),_ShadowPTexture_var.rgb,_ShadowPTexture_var.a),
                                                float3(node_3933,node_3933,node_3933),node_7397)*lerp(0.54,1.65,_MainTextureColorShadow)),
                                                _ShadowIntensity),_ShadowPTextureIntensity),0.65)*2.86))*lerp( 
                                                lerp(node_2724,float3(node_3448,node_3448,node_3448),node_7397), node_2724, _ShowAOonLight ))+(
                                                lerp(float3(node_7581,node_7581,node_7581),
                                                lerp(float3(_SoftGloss_var,_SoftGloss_var,_SoftGloss_var),
                                                (_SoftGloss_var*_GlossColor.rgb),2.22),_GlossMask_var.rgb)*
                                                lerp((node_8388_if_leA*node_2583)+(node_8388_if_leB*_GlossIntensity),
                                                _GlossIntensity,node_8388_if_leA*node_8388_if_leB))+
                                                lerp(node_137,float3(node_8355,node_8355,node_8355),_FresnelVisibleOnDarkAmbientLight))*_LightColor0.rgb),
                                                node_5038)),float3(0.3,0.59,0.11)),node_3161);
                                                
                                                
                                                
                                                
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform fixed _Transparent;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                clip(lerp( 1.0, _Texture_var.a, _Transparent ) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    
}
