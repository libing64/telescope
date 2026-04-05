// Full Telescope Assembly (完整组装3D视角)
// 单位: mm
// 包含主镜筒、所有3D打印核心部件及网购配件(主镜、副镜、调焦座)的组装示意图

use <primary_mirror_cell.scad>
use <secondary_mirror_spider.scad>
use <focuser_base.scad>
use <tube_rings.scad>
use <tube_body.scad>

tube_length = 850;
tube_od = 160;

// ====== 3D打印部件 ======

// 1. 主镜筒身 (已移除 % 修饰符，以确保能导出到 STL 中。采用白色半透明便于查看内部)
color("White", 0.3)
tube_body();

// 2. 3D打印: 主镜座 (安装在底部)
color("DodgerBlue")
mirror_cell();

// 3. 3D打印: 副镜十字架 (安装在顶部内部，距前端口约 50mm)
color("Crimson")
translate([0, 0, tube_length - 50])
spider();

// 4. 3D打印: 调焦座底座转接垫块 (侧面安装，距前端口约 100mm)
color("ForestGreen")
translate([tube_od/2, 0, tube_length - 100])
rotate([0, 90, 0])
rotate([0, 0, 90])
focuser_base();

// 5. 3D打印: 抱箍1 (安装在镜筒下部)
color("DarkOrange")
translate([0, 0, 250])
tube_ring();

// 6. 3D打印: 抱箍2 (安装在镜筒上部)
color("DarkOrange")
translate([0, 0, 600])
tube_ring();


// ====== 网购采购配件 (示意模型) ======

// 7. 采购配件: 114mm 主镜 (厚度15mm)
// 放置在主镜座上的内凹槽内
color("LightCyan")
translate([0, 0, 5])
cylinder(d=114, h=15, $fn=100);

// 8. 采购配件: 35mm 短轴平面副镜 及副镜座支杆 (将光路折角90度)
// 安装在光轴中心，距前端口100mm处，与调焦座对齐
color("LightCyan")
translate([0, 0, tube_length - 100])
rotate([0, 45, 0])
scale([1, 35/49.5, 1]) // 椭圆面近似比例
cylinder(d=49.5, h=5, center=true, $fn=64);

// 副镜连接杆 (连接十字架中心毂到副镜背面)
color("Silver")
translate([0, 0, tube_length - 100 + 2.5]) 
cylinder(d=25, h=50 - 2.5, $fn=64); 

// 9. 采购配件: 1.25寸 反射式齿条调焦座 及 目镜
// 固定在调焦座垫块外部
color("DimGray")
translate([tube_od/2 + 10, 0, tube_length - 100])
rotate([0, 90, 0])
union() {
    // 调焦座主体
    cylinder(d=45, h=40, $fn=64);
    // 调焦旋钮及齿条轴
    translate([0, 0, 15]) rotate([90, 0, 0]) cylinder(d=8, h=70, center=true, $fn=32);
    translate([0, 35, 15]) rotate([90, 0, 0]) cylinder(d=25, h=15, center=true, $fn=32);
    translate([0, -35, 15]) rotate([90, 0, 0]) cylinder(d=25, h=15, center=true, $fn=32);
    
    // 1.25寸 PL 目镜 (插在调焦座末端)
    color("Black")
    translate([0, 0, 40])
    union() {
        cylinder(d=31.75, h=25, $fn=64); // 1.25寸接口部分
        translate([0, 0, 25]) cylinder(d=35, h=20, $fn=64); // 目镜视野部分
    }
}
