// 114mm Newtonian Primary Mirror Cell (主镜座)
// 单位: mm
// 配合 M4 推拉螺丝和弹簧使用

mirror_dia = 114.5; // 主镜直径，留有0.5mm公差
mirror_thickness = 15; // 主镜厚度
tube_id = 152; // 镜筒内径 (例如 160mm PVC管的内径)
tube_thickness = 4; // 镜筒壁厚

module mirror_cell() {
    difference() {
        // 主体圆柱
        cylinder(d=tube_id - 1, h=20, $fn=100);
        
        // 主镜放置坑位
        translate([0, 0, 5])
        cylinder(d=mirror_dia, h=20, $fn=100);
        
        // 中心偷轻/通风孔 (加快主镜热平衡)
        translate([0, 0, -1])
        cylinder(d=80, h=30, $fn=64);
        
        // 调节螺丝孔 (3个, 120度均匀分布)
        for(i=[0:2]) {
            rotate([0, 0, i*120])
            translate([mirror_dia/2 + 8, 0, -1])
            cylinder(d=4.5, h=30, $fn=32); // 适用 M4 螺丝
        }
    }
}

mirror_cell();
