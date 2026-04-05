// Secondary Mirror Spider for 114mm Newtonian (副镜十字架)
// 单位: mm

tube_id = 152; // 镜筒内径
hub_dia = 32; // 中心毂直径
hub_height = 30; // 中心毂高度
vane_thickness = 2; // 十字架叶片厚度
vane_height = 20; // 十字架叶片高度

module spider() {
    // 中心毂
    difference() {
        cylinder(d=hub_dia, h=hub_height, $fn=64);
        // 中心主螺丝孔
        translate([0, 0, -1]) cylinder(d=5.5, h=hub_height+2, $fn=32); // 适用 M5 中心固定螺丝
        
        // 三个推力螺丝孔 (用于调节副镜倾角)
        for(i=[0:2]) {
            rotate([0, 0, i*120])
            translate([10, 0, -1])
            cylinder(d=3.5, h=hub_height+2, $fn=32); // 可直接攻丝或自攻 M4 螺丝
        }
    }
    
    // 四个支撑叶片
    for(i=[0:3]) {
        rotate([0, 0, i*90])
        translate([hub_dia/2, -vane_thickness/2, (hub_height-vane_height)/2])
        cube([(tube_id-hub_dia)/2, vane_thickness, vane_height]);
    }
    
    // 外圈固定环 (方便固定在管壁内侧)
    difference() {
        cylinder(d=tube_id, h=vane_height, $fn=100);
        translate([0, 0, -1]) cylinder(d=tube_id-4, h=vane_height+2, $fn=100);
    }
}

spider();
