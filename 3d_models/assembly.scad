// Full Telescope Assembly (完整组装3D视角)
// 单位: mm
// 包含主镜筒及所有3D打印核心部件的组装示意图，可用于在 OpenSCAD 或 3D 浏览器中查看整体装配效果

use <primary_mirror_cell.scad>
use <secondary_mirror_spider.scad>
use <focuser_base.scad>
use <tube_rings.scad>
use <tube_body.scad>

tube_length = 850;
tube_od = 160;

// 1. 半透明的主镜筒身 (OpenSCAD 中 % 代表透明/半透明显示)
%tube_body();

// 2. 主镜座 (安装在底部)
color("DodgerBlue")
mirror_cell();

// 3. 副镜十字架 (安装在顶部内部，距前端口约 50mm)
color("Crimson")
translate([0, 0, tube_length - 50])
spider();

// 4. 调焦座底座转接垫块 (侧面安装，距前端口约 100mm)
color("ForestGreen")
translate([tube_od/2, 0, tube_length - 100])
rotate([0, 90, 0])
rotate([0, 0, 90])
focuser_base();

// 5. 抱箍1 (安装在镜筒下部，支撑重心，例如距底端约 250mm)
color("DarkOrange")
translate([0, 0, 250])
tube_ring();

// 6. 抱箍2 (安装在镜筒上部，例如距底端约 600mm)
color("DarkOrange")
translate([0, 0, 600])
tube_ring();
