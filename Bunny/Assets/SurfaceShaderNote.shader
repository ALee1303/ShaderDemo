Shader "Holistic/HelloShader" { // Beginning of Shader Lab "[Directory]/[Name]"

	Properties{ // Declare input variable to use on your shader processing. Shows up in material inspector
		// [Identifier]("[InspectorDisplay]", [Type]) = [InitialValue]
		_myColour("Example Color", Color) = (1,1,1,1) 
		_myEmission("Example Emission", Color) = (1,1,1,1)
		_myNormal("Example Normal", Color) = (1,1,1,1)
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
			// [ShaderDataType] [NameOfPropertiesYouWantAvailable]
			fixed4 _myColour;
			fixed4 _myEmission;
			fixed4 _myNormal;

			/// The Shader Function:
			/// param@Input IN = Input strcuture declared
			/// param@innout SurfaceOutput o = specifies output data expected. Changes depending on lighting mode used(ex:Lambert=SurfaceOutput)

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = _myColour.rgb;	  // base color
				o.Emission = _myEmission.rgb; // glow color
				o.Normal = _myNormal;
			}

			/* properties of SurfaceOutput
			struct SurfaceOutput {
				fixed3 Albedo;   // diffuse, base, color
				fixed3 Normal;   // tangent space normal, if written
				fixed3 Emission; // Color with no depth and glow, like a light
				half Specular;   // Specular power in 0..1 range
				fixed Gloss;     // specular intensity
				fixed Alpha;     // alpha for transparencies
			};
			*/

		ENDCG     // Shader code End

		//Not WORKING
		//FallBack "Diffuse" // if graphics card is incompatible
	}
}