// Focuser Base for round tube (调焦座弧面底座转接垫块)
// 单位: mm

tube_od = 160; // 镜筒外径
focuser_hole = 42; // 调焦座中心通光孔径
base_width = 70; // 底座宽
base_length = 80; // 底座长
base_thickness = 10; // 底座最薄处厚度

module focuser_base() {
    difference() {
        // 基础块
        translate([-base_width/2, -base_length/2, 0])
        cube([base_width, base_length, base_thickness]);
        
        // 切割出匹配镜筒外径的弧面
        translate([0, 0, tube_od/2 + base_thickness])
        rotate([90, 0, 0])
        cylinder(d=tube_od, h=base_length+2, center=true, $fn=200);
        
        // 中心通孔
        translate([0, 0, -1])
        cylinder(d=focuser_hole, h=base_thickness+2, $fn=64);
        
        // 调焦座固定螺丝孔 (4个)
        for(x=[-base_width/2+10, base_width/2-10]) {
            for(y=[-base_length/2+10, base_length/2-10]) {
                translate([x, y, -1])
                cylinder(d=4.5, h=base_thickness+2, $fn=32);
            }
        }
    }
}

focuser_base();
