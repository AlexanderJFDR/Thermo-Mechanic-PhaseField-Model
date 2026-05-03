SetFactory("OpenCASCADE");
lc = 0.1;

//定义点
Point(1) = {0, 0, 0, lc};
Point(2) = {5, 0, 0, lc};
Point(3) = {5, 5, 0, lc};
Point(4) = {0, 5, 0, lc};

//定义曲线
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

//定义封闭环
Curve Loop(1) = {1, 2, 3, 4};

//定义面
Plane Surface(1) = {1};

//划分物理区域
Physical Curve("bottom") = {1};
Physical Curve("right") = {2};
Physical Curve("top") = {3};
Physical Curve("left") = {4};
Physical Surface("plate") = {1};

// 可选：设置网格尺寸
Field[1] = Box;
Field[1].Thickness = 1;  
Field[1].VIn = 0.02;
Field[1].VOut = 0.5;
Field[1].XMax = 6;
Field[1].XMin = -1;
Field[1].YMax = 6;
Field[1].YMin = 4;
Field[1].ZMax = 0.1;
Field[1].ZMin = -0.1;

// 应用网格场
Background Field = 1;

Mesh.MeshSizeFromPoints = 0;
Mesh.Smoothing = 5;
Mesh.Algorithm = 6;

Mesh 2;

//保存网格文件
Mesh.MshFileVersion = 2.2; // 设置为版本 2 ASCII
Mesh.Format = 1; // 设置为 ASCII 格式（1 = ASCII, 2 = Binary）
Save "plane.msh";
