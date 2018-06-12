/**************************************************************************

Copyright:@cartzhang

Author: cartzhang

Date:[2016/1/6]

Description:

**************************************************************************/



using UnityEngine;
using System.Collections;
using System.IO;

#if UNITY_EDITOR
using UnityEditor;
#endif

public class GenerateFolders : MonoBehaviour
{
#if UNITY_EDITOR
    [MenuItem("Tools/CreateBasicFolder #&_b")]
    private static void CreateBasicFolder()
    {
        GenerateFolder();
        Debug.Log("Folders Created");
    }

    [MenuItem("Tools/CreateALLFolder")]
    private static void CreateAllFolder()
    {
        GenerateFolder(1);
        Debug.Log("Folders Created");
    }


    private static void GenerateFolder(int flag = 0)
    {
        // 文件路径
        string prjPath = Application.dataPath + "/miccall/";
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


#endif


}