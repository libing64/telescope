// Galilean Eyepiece Cell (目镜座)
// 用于固定 30mm 凹透镜

lens_dia = 30.5;
lens_thickness = 3;
tube_od = 51.5; // 匹配滑动管外径
tube_id = 47.5; // 匹配滑动管内径
insert_length = 10;

module eyepiece_cell() {
    difference() {
        union() {
            // 外部手持挡圈
            cylinder(d=tube_od + 4, h=8, $fn=100);
            // 插入调焦管的部分
            translate([0, 0, 8])
            cylinder(d=tube_id - 0.2, h=insert_length, $fn=100);
        }
        
        // 通光孔 (人眼观察孔)
        translate([0, 0, -1])
        cylinder(d=24, h=20 + insert_length + 2, $fn=100);
        
        // 放置目镜的凹槽
        translate([0, 0, 8 - lens_thickness])
        cylinder(d=lens_dia, h=lens_thickness + insert_length + 2, $fn=100);
    }
}

eyepiece_cell();
