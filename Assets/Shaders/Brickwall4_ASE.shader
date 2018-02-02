// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Brickwall4_ASE"
{
	Properties
	{
		_AlbedoLerp("Albedo Lerp", 2D) = "white" {}
		_NormalMap2("Normal Map 2", 2D) = "bump" {}
		_Albedo2("Albedo2", 2D) = "white" {}
		_Albedo1("Albedo1", 2D) = "white" {}
		_NormalMap1("Normal Map 1", 2D) = "bump" {}
		_Scale2("Scale 2", Float) = 0
		_Scale1("Scale 1", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Scale1;
		uniform sampler2D _NormalMap1;
		uniform float4 _NormalMap1_ST;
		uniform float _Scale2;
		uniform sampler2D _NormalMap2;
		uniform float4 _NormalMap2_ST;
		uniform sampler2D _AlbedoLerp;
		uniform float4 _AlbedoLerp_ST;
		uniform sampler2D _Albedo1;
		uniform float4 _Albedo1_ST;
		uniform sampler2D _Albedo2;
		uniform float4 _Albedo2_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_NormalMap1 = i.uv_texcoord * _NormalMap1_ST.xy + _NormalMap1_ST.zw;
			float2 uv_NormalMap2 = i.uv_texcoord * _NormalMap2_ST.xy + _NormalMap2_ST.zw;
			float2 uv_AlbedoLerp = i.uv_texcoord * _AlbedoLerp_ST.xy + _AlbedoLerp_ST.zw;
			float4 tex2DNode3 = tex2D( _AlbedoLerp, uv_AlbedoLerp );
			float3 lerpResult12 = lerp( UnpackScaleNormal( tex2D( _NormalMap1, uv_NormalMap1 ) ,_Scale1 ) , UnpackScaleNormal( tex2D( _NormalMap2, uv_NormalMap2 ) ,_Scale2 ) , tex2DNode3.r);
			o.Normal = lerpResult12;
			float2 uv_Albedo1 = i.uv_texcoord * _Albedo1_ST.xy + _Albedo1_ST.zw;
			float2 uv_Albedo2 = i.uv_texcoord * _Albedo2_ST.xy + _Albedo2_ST.zw;
			float4 lerpResult9 = lerp( tex2D( _Albedo1, uv_Albedo1 ) , tex2D( _Albedo2, uv_Albedo2 ) , tex2DNode3.r);
			o.Albedo = lerpResult9.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14301
281;90;1361;1157;1072.058;348.7126;1.034769;True;False
Node;AmplifyShaderEditor.RangedFloatNode;13;-783.755,397.0681;Float;False;Property;_Scale1;Scale 1;6;0;Create;True;0;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-771.4116,567.755;Float;False;Property;_Scale2;Scale 2;5;0;Create;True;0;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;10;-596.8981,348.5256;Float;True;Property;_NormalMap1;Normal Map 1;4;0;Create;True;f42bd331d4cf3104aa53e011713d59d8;f3c94d14135e75844b0a926f4a818cc4;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-597,131;Float;True;Property;_AlbedoLerp;Albedo Lerp;0;0;Create;True;578f647141116b54f9d35fb84646201d;a29c42c8c97562249869d0c96e8f37ba;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;11;-611.426,533.5816;Float;True;Property;_NormalMap2;Normal Map 2;1;0;Create;True;2e84ccc1469f9a34b91001d4dc0c0850;2ec79e77fba798540adf67dfa6c76a7c;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-579,-288;Float;True;Property;_Albedo1;Albedo1;3;0;Create;True;f42bd331d4cf3104aa53e011713d59d8;578f647141116b54f9d35fb84646201d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-575,-76;Float;True;Property;_Albedo2;Albedo2;2;0;Create;True;2e84ccc1469f9a34b91001d4dc0c0850;f42bd331d4cf3104aa53e011713d59d8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;9;-203.1707,85.06953;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;12;-214.1884,309.9106;Float;True;3;0;FLOAT3;0,0,0,0;False;1;FLOAT3;0,0,0,0;False;2;FLOAT;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;95.10394,211.4269;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Brickwall4_ASE;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;5;13;0
WireConnection;11;5;14;0
WireConnection;9;0;1;0
WireConnection;9;1;2;0
WireConnection;9;2;3;0
WireConnection;12;0;10;0
WireConnection;12;1;11;0
WireConnection;12;2;3;0
WireConnection;0;0;9;0
WireConnection;0;1;12;0
ASEEND*/
//CHKSM=858174CA8A8CC49649E7440B9D504911E35F5412