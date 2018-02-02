# UnityASEBrickWall
![Screenshot of the example scene](https://github.com/Pseudopode/UnityASEBrickWall/blob/master/Docs/poster.png)
This a small Unity example to show what can be done to liven up a simple textured wall.
If you don't want to code a specific shader, you can abuse the detail slot of the standard shader in unity. Put in it the cloud texture (the variations in that texture should be centered around mid-gray level). Decouple the tiling of the details slot from the main slot for various effects.

In the example scene, this is the top right wall (the top left is a plain wall with only an albedo texture).
I used Amplify Shader Editor to create a simple shader : a blend between two textures : 1 'wall texture' that is already tileable, a 2nd 'wall texture', 1 noise or dirt texture.
The blend between the two albedo is based on the third value provided by the black and white cloud texture. The bottom left wall in the example scene is displaying this shader.
The bottom right is the same shader, but I'm also doing the blend on the normal maps.
