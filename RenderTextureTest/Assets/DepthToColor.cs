using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class DepthToColor : MonoBehaviour {
	public Material mat;
	public Shader replacementShader;
	public Material shadowMapMat;

	void Start() {
		GetComponent<Camera>().depthTextureMode = DepthTextureMode.Depth;
		GetComponent<Camera>().SetReplacementShader (replacementShader, null);
	}

	void Update() {
		Matrix4x4 matrix = GetComponent<Camera> ().projectionMatrix * GetComponent<Camera> ().worldToCameraMatrix;
		shadowMapMat.SetMatrix ("lightMatrix", matrix);
	}

	void OnRenderImage(RenderTexture source, RenderTexture destination){
		Graphics.Blit(source, destination, mat);
	}
}