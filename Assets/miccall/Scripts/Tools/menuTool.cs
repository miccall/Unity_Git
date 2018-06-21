using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using NUnit.Framework.Constraints;
using UnityEngine.Networking;
using System.IO;

namespace miccall.Scripts.Tools
{
    public class Ramp : EditorWindow {
        
        [SerializeField]
        private Gradient mGradient;
        private int textureWidth = 256;
        private bool editMode;
        private bool textureEdited;
        private Texture2D linkedTexture;
        private AssetImporter linkedImporter;
        private Material[] linkedMaterials;
        private bool editModeFromMaterial;

        public static Ramp OpenWindow()
        {
            var window = GetWindow<Ramp>(true,"window",true);
            window.editMode = false;
            window.linkedTexture = null;
            window.minSize = new Vector2(352f,168f);
            window.maxSize = new Vector2(352f,168f);
            return window;
        }

        private void OnEnable()
        {
            Init();
        }

        private void OnDestroy()
        {
            if (!textureEdited) return;
            if( EditorUtility.DisplayDialog("Edited Ramp Texture", "There are pending edits on the following ramp texture:\n\n" + linkedTexture.name + "\n\nSave them?", "Yes", "Discard"))
            {
                SaveEditedTexture();
            }
            else
            {
                DiscardEditedTexture();
            }
        }
        
        private static GUIStyle _LineStyle;
        private static GUIStyle LineStyle
        {
            get
            {
                if (_LineStyle != null)  return _LineStyle;
                
                _LineStyle = new GUIStyle
                {
                    normal =
                    {
                        background = EditorGUIUtility.whiteTexture
                    },
                    
                    stretchWidth = true
                };

                return _LineStyle;
            }
        }
        
        private void Init()
        {
            mGradient = new Gradient
            {
                colorKeys = new GradientColorKey[]
                {
                    new GradientColorKey(Color.green, 0.49f),
                    new GradientColorKey(Color.cyan, 0.5f),
                },
                alphaKeys = new GradientAlphaKey[]
                {
                    new GradientAlphaKey(1f, 0f),
                    new GradientAlphaKey(1f, 1f),
                }
            };

        }

        static void GUILine( Color color, float height = 2f ) 
        {
            var position = GUILayoutUtility.GetRect( 0f, float.MaxValue, height, height , LineStyle );
            
            if ( Event.current.type != EventType.Repaint ) return ;
            var orgColor = GUI.color ;
            GUI.color = orgColor * color;
            LineStyle.Draw( position, false, false, false, false );
            GUI.color = orgColor ;
            
        }
 
        private void OnGUI()
        {
            // title :
            
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField( new GUIContent("Ramp Generator") );
            EditorGUILayout.EndHorizontal();
            
            // line :
            GUILayout.Space(4);
            GUILine(new Color(.3f,.3f,.3f), 5);
            GUILayout.Space(4);
            
            
            // ramp edit : 
            GUILayout.Label(" Click on the gradient to edit it: "); 
            var so = new SerializedObject( this );
            var sp = so.FindProperty("mGradient");
            EditorGUILayout.PropertyField(sp, GUIContent.none);
                
            // setting ramp size : 
                textureWidth = EditorGUILayout.IntField("TEXTURE SIZE:", textureWidth);
                EditorGUILayout.BeginHorizontal();
                if(GUILayout.Button("64", EditorStyles.miniButtonLeft)) textureWidth = 64;
                if(GUILayout.Button("128", EditorStyles.miniButtonMid)) textureWidth = 128;
                if(GUILayout.Button("256", EditorStyles.miniButtonMid)) textureWidth = 256;
                if(GUILayout.Button("512", EditorStyles.miniButtonMid)) textureWidth = 512;
                if(GUILayout.Button("1024", EditorStyles.miniButtonRight)) textureWidth = 1024;
                EditorGUILayout.EndHorizontal();
            
            //  apply changed 
            if (GUI.changed)
            {
                so.ApplyModifiedProperties();
                mGradient.alphaKeys = new []
                {
                    new GradientAlphaKey(1f,0f),
                    new GradientAlphaKey(1f,1f), 
                };
                if (editMode)
                {
                    textureEdited = true;
                    var pixels = GetPixelsFromGradient(mGradient, linkedTexture.width);
                    linkedTexture.SetPixels(pixels);
                    linkedTexture.Apply(true,false);
                }
            }

            // save button : 
            var savebutton = GUILayout.Button("Generate", GUILayout.Width(120f), GUILayout.Height(34f));

            if (savebutton)
            {
                var path = EditorUtility.SaveFilePanel(
                    "Save texture as PNG",
                    "",
                    "myramp.png",
                    "png");
                if (string.IsNullOrEmpty(path)) return;
                var projectpath = path.Replace(Application.dataPath, "Assets");
                GenerateAndSaveTexture(projectpath);
            }
        }

        // GenerateAndSaveTexture
        private void GenerateAndSaveTexture(string path)
        {
            if( string.IsNullOrEmpty(path) )
                return;

            SaveGradientTexture( mGradient, textureWidth, path );
        }

        private static string ColorToHex( Color32 color )
        {
            var hex = color.r.ToString("X2") + color.g.ToString("X2") + color.b.ToString("X2");
            return hex;
        }
        
        // as userdata for local stronge  
        private static string GradientToUserData(Gradient gradient)
        {
            var output = "GRADIENT\n";
            for(int i = 0; i < gradient.colorKeys.Length; i++)
                output += ColorToHex(gradient.colorKeys[i].color) + "," + gradient.colorKeys[i].time + "#";
            output = output.TrimEnd('#');
            output += "\n";
            for(int i = 0; i < gradient.alphaKeys.Length; i++)
                output += gradient.alphaKeys[i].alpha + "," + gradient.alphaKeys[i].time + "#";
            output = output.TrimEnd('#');
#if UNITY_5_5_OR_NEWER
            output += "\n" + gradient.mode.ToString();
#endif

            return output;
        }
        
        // saveGradient  grandient with path 
        private static void SaveGradientTexture(Gradient gradient, int width, string unityPath)
        {
            // Create texture 
            var ramp = CreateGradientTexture(gradient, width);
            // texture to png 
            var png = ramp.EncodeToPNG();
            DestroyImmediate(ramp);
            
            // remove "Assets/" == 7 character 
            var systemPath = Application.dataPath + "/" + unityPath.Substring(7);
            File.WriteAllBytes(systemPath, png);
            
            // import asset 
            AssetDatabase.ImportAsset(unityPath);
            var ti = AssetImporter.GetAtPath(unityPath) as TextureImporter;
            
            // import setting 
            if (ti == null) return;                  
            ti.wrapMode = TextureWrapMode.Clamp;
            ti.isReadable = true;

#if UNITY_5_5_OR_NEWER
            ti.textureCompression = TextureImporterCompression.Uncompressed;
            ti.alphaSource = TextureImporterAlphaSource.None; 
#else
		    ti.textureFormat = TextureImporterFormat.RGB24;
#endif
            // Gradient data embedded in userData
            ti.userData = GradientToUserData(gradient);
            ti.SaveAndReimport();
            
        }
        
        // CreateGradientTexture [gradient width]
        private static Texture2D CreateGradientTexture(Gradient gradient, int width)
        {
            var colors = GetPixelsFromGradient( gradient, width ); 
            //  Texture2D ( with , height , format , mipmap , liner )
            var ramp = new Texture2D( width , 4 , TextureFormat.RGB24 , true ,  true );
            ramp.SetPixels(colors);
            ramp.Apply(true);
            return ramp;
        }
        
        // PixelsF data  Gradient 
        private static Color[] GetPixelsFromGradient(Gradient gradient, int width)
        {
            var pixels = new Color[ width * 4 ];
            
            // loop width 
            for( var x = 0 ; x < width ; x++ )
            {
                // clamp value to 0-1  
                var delta = Mathf.Clamp01 ( x / ( float ) width );
                var col = gradient.Evaluate( delta ) ;
                
                // loop height 
                for (var height = 0 ; height < 4; height++)
                {
                    pixels[ x + height * width ] = col;
                }
            }
            return pixels;
        }
        
        private void SaveEditedTexture()
        {
            if(textureEdited)
            {
                // Save data to file
                File.WriteAllBytes(Application.dataPath + AssetDatabase.GetAssetPath(linkedTexture).Substring(6), linkedTexture.EncodeToPNG());

                // Update linked texture userData
                linkedImporter.userData = GradientToUserData(mGradient);
            }
            textureEdited = false;
        }

        private void DiscardEditedTexture()
        {
            AssetDatabase.ImportAsset(AssetDatabase.GetAssetPath(linkedTexture), ImportAssetOptions.ForceSynchronousImport | ImportAssetOptions.ForceUpdate);
            textureEdited = false;
        }
        
    }
}
