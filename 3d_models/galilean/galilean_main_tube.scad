// Galilean Main Tube (主镜筒)
// 全长200mm，普通3D打印机可竖立打印完成

tube_length = 200;
tube_od = 56;
tube_id = 52;

module main_tube() {
    difference() {
        cylinder(d=tube_od, h=tube_length, $fn=128);
        translate([0, 0, -1])
        cylinder(d=tube_id, h=tube_length + 2, $fn=128);
    }
}

main_tube();
