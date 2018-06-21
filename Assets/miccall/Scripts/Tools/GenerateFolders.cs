using UnityEngine;
using System.IO;
using UnityEditor;

namespace miccall.Scripts.Tools
{
    public class GenerateFolders : MonoBehaviour
    {
        [MenuItem("Tools/CreateFolder/BasicFolder")]
        private static void CreateBasicFolder()
        {
            GenerateFolder();
        }

        [MenuItem("Tools/CreateFolder/ALLFolder")]
        private static void CreateAllFolder()
        {
            GenerateFolder(1);
        }

        [MenuItem("Tools/Cartoon/Ramp Generator")]
        public static void Ramp_Generator()
        {
            Ramp.OpenWindow();
        }
        
        private static void GenerateFolder(int flag = 0)
        {
            // 文件路径
            var prjPath = Application.dataPath + "/miccall/";
            Directory.CreateDirectory(prjPath + "Audio");
            Directory.CreateDirectory(prjPath + "Prefabs");
            Directory.CreateDirectory(prjPath + "Materials");
            Directory.CreateDirectory(prjPath + "Resources");
            Directory.CreateDirectory(prjPath + "Scripts");
            Directory.CreateDirectory(prjPath + "Textures");
            Directory.CreateDirectory(prjPath + "Scenes");
            Directory.CreateDirectory(prjPath + "Model");
            Directory.CreateDirectory(prjPath + "Shaders");

            if (1 == flag)
            {
                Directory.CreateDirectory(prjPath + "Meshes");
                Directory.CreateDirectory(prjPath + "GUI");
            }

            AssetDatabase.Refresh();
        }
    }
}
