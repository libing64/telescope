// Galilean Focuser Tube (滑动调焦管)

tube_length = 100;
tube_od = 51.5; // 略小于主管内径(52)，留作滑动和贴植绒布空间
tube_id = 47.5;

module focuser_tube() {
    difference() {
        cylinder(d=tube_od, h=tube_length, $fn=128);
        translate([0, 0, -1])
        cylinder(d=tube_id, h=tube_length + 2, $fn=128);
    }
}

focuser_tube();
