// Galilean Objective Cell (物镜座)
// 用于固定 50mm 凸透镜

lens_dia = 50.5; // 透镜直径预留公差
lens_thickness = 4; // 透镜边缘厚度
tube_od = 56; // 主管外径
tube_id = 52; // 主管内径
insert_length = 15; // 插入主管的长度

module objective_cell() {
    difference() {
        union() {
            // 外部挡环
            cylinder(d=tube_od, h=10, $fn=100);
            // 插入主管的部分
            translate([0, 0, 10])
            cylinder(d=tube_id - 0.2, h=insert_length, $fn=100);
        }
        
        // 通光孔
        translate([0, 0, -1])
        cylinder(d=46, h=20 + insert_length + 2, $fn=100);
        
        // 放置透镜的凹槽
        translate([0, 0, 10 - lens_thickness])
        cylinder(d=lens_dia, h=lens_thickness + 0.1, $fn=100);
    }
}

objective_cell();
