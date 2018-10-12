Shader "Holistic/HelloShader" { // Beginning of Shader Lab "[Directory]/[Name]"

	Properties{ // Declare input variable to use on your shader processing. Shows up in material inspector
		_myColour("Example Colour", Color) = (1,1,1,1)
	}

	SubShader{ // Where CG/HSLS code goes

		CGPROGRAM // Shader code Start

			// Compiler Directive: Decides how the code should be used
			#pragma surface surf Lambert //[Type of shader] [Name of shader function] [type of lighting]

			// Input data required by your function: vertex, uv, infos of models mesh
			struct Input { 
				float2 uvMainTex;
			};
					
			// make Properties available to Shader Function by declaring matching variable
			fixed4 _myColour; // [ShaderDataType] [NameOfPropertiesWantAvailable]

			/// The Shader Function:
			/// param@Input IN = Input strcuture declared
			/// param@innout SurfaceOutput o = specifies output data expected. Changes depending on lighting mode used(ex:Lambert=SurfaceOutput)
			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = _myColour.rgb; // diffuse color. Type=fixed3
			}
		ENDCG     // Shader code End

		//FallBack "Diffuse" // if graphics card is incompatible
	}
}