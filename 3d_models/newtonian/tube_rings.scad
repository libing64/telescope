// Tube Rings (镜筒抱箍)
// 单位: mm

tube_od = 160; // 镜筒外径
ring_thickness = 15; // 抱箍壁厚
ring_width = 25; // 抱箍宽度
base_flat = 60; // 底部连接鸠尾板的平底宽度

module tube_ring() {
    difference() {
        union() {
            // 主体圆环
            cylinder(d=tube_od + ring_thickness*2, h=ring_width, $fn=128);
            // 底部加强/平底部位
            translate([-base_flat/2, -(tube_od/2 + ring_thickness), 0])
            cube([base_flat, ring_thickness, ring_width]);
        }
        
        // 切除内径孔
        translate([0, 0, -1])
        cylinder(d=tube_od, h=ring_width+2, $fn=128);
        
        // 侧面切开槽 (便于套入并用螺丝锁紧)
        translate([0, tube_od/2, -1])
        cube([4, tube_od/2 + ring_thickness + 2, ring_width+2]);
        
        // 锁紧螺丝孔位
        translate([-10, tube_od/2 + ring_thickness/2, ring_width/2])
        rotate([0, 90, 0])
        cylinder(d=5.5, h=25, $fn=32); // 适用 M5 长螺丝
        
        // 底部连接鸠尾板的安装孔
        for(x=[-15, 15]) {
            translate([x, -(tube_od/2 + ring_thickness/2), -1])
            cylinder(d=6.5, h=ring_thickness+2, $fn=32); // M6螺丝孔
        }
    }
}

tube_ring();
