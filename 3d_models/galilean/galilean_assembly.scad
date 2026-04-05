// Galilean Telescope Assembly (伽利略望远镜完整组装视角)

use <galilean_main_tube.scad>
use <galilean_objective_cell.scad>
use <galilean_focuser_tube.scad>
use <galilean_eyepiece_cell.scad>

// 1. 主镜筒 (半透明灰色)
color("DimGray", 0.3)
main_tube();

// 2. 3D打印: 物镜座 (倒置插入最前端)
color("DodgerBlue")
translate([0, 0, 200])
rotate([180, 0, 0])
objective_cell();

// 采购配件: 物镜 (50mm 凸透镜)
color("LightCyan", 0.7)
translate([0, 0, 200 - 10 + 4/2])
cylinder(d=50, h=4, center=true, $fn=64);

// 3. 3D打印: 滑动调焦管 (从尾部插入)
color("ForestGreen")
translate([0, 0, -50])
focuser_tube();

// 4. 3D打印: 目镜座 (安装在调焦管末端)
color("Crimson")
translate([0, 0, -50])
rotate([180, 0, 0])
eyepiece_cell();

// 采购配件: 目镜 (30mm 凹透镜)
color("LightCyan", 0.7)
translate([0, 0, -50 - 8 + 3/2])
cylinder(d=30, h=3, center=true, $fn=64);
