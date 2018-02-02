// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Brickwall3_ASE"
{
	Properties
	{
		_AlbedoLerp("Albedo Lerp", 2D) = "white" {}
		_Albedo2("Albedo2", 2D) = "white" {}
		_Albedo1("Albedo1", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Albedo1;
		uniform float4 _Albedo1_ST;
		uniform sampler2D _Albedo2;
		uniform float4 _Albedo2_ST;
		uniform sampler2D _AlbedoLerp;
		uniform float4 _AlbedoLerp_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Albedo1 = i.uv_texcoord * _Albedo1_ST.xy + _Albedo1_ST.zw;
			float2 uv_Albedo2 = i.uv_texcoord * _Albedo2_ST.xy + _Albedo2_ST.zw;
			float2 uv_AlbedoLerp = i.uv_texcoord * _AlbedoLerp_ST.xy + _AlbedoLerp_ST.zw;
			float4 lerpResult9 = lerp( tex2D( _Albedo1, uv_Albedo1 ) , tex2D( _Albedo2, uv_Albedo2 ) , tex2D( _AlbedoLerp, uv_AlbedoLerp ).r);
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
231;251;1177;877;873.2723;363.4905;1;True;False
Node;AmplifyShaderEditor.SamplerNode;1;-579,-288;Float;True;Property;_Albedo1;Albedo1;2;0;Create;True;f42bd331d4cf3104aa53e011713d59d8;578f647141116b54f9d35fb84646201d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-575,-76;Float;True;Property;_Albedo2;Albedo2;1;0;Create;True;2e84ccc1469f9a34b91001d4dc0c0850;f42bd331d4cf3104aa53e011713d59d8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-597,131;Float;True;Property;_AlbedoLerp;Albedo Lerp;0;0;Create;True;578f647141116b54f9d35fb84646201d;a29c42c8c97562249869d0c96e8f37ba;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;9;-169,-135;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;64,-136;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Brickwall3_ASE;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;9;0;1;0
WireConnection;9;1;2;0
WireConnection;9;2;3;0
WireConnection;0;0;9;0
ASEEND*/
//CHKSM=7FC462E6FC1DA8AFAF9F014322495B0763051CE4