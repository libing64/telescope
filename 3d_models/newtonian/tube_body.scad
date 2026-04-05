// Main Telescope Tube (完整的主镜筒身)
// 单位: mm
// 警告：114/900 牛顿反射的镜筒长达 850mm 左右，普通3D打印机无法一次打印完成。
// 建议：在 3D 切片软件（如 Bambu Studio）中使用“切割”功能将此 STL 模型分割为多段（如 200mm 一段）进行打印，并在两端设计连接件或通过胶水拼接。
// 或者，您可以直接在线下建材市场购买 160mm 的 PVC 排水管代替本文件。

tube_length = 850; // 镜筒总长度
tube_od = 160;     // 外径
tube_id = 152;     // 内径
focuser_hole = 42; // 调焦座中心通光孔径
focuser_dist = 100; // 调焦座中心距离镜筒前端的距离

module tube_body() {
    difference() {
        // 镜筒外壁
        cylinder(d=tube_od, h=tube_length, $fn=200);
        
        // 切除内壁，使其成为空心管
        translate([0, 0, -1])
        cylinder(d=tube_id, h=tube_length+2, $fn=200);
        
        // 切割调焦座光路通孔
        translate([tube_od/2, 0, tube_length - focuser_dist])
        rotate([0, 90, 0])
        cylinder(d=focuser_hole, h=20, center=true, $fn=64);
        
        // 切割调焦座底座固定螺丝孔 (4个)
        // 注意：这些孔位需与 focuser_base.scad 的孔位匹配
        base_width = 70;
        base_length = 80;
        for(x=[-base_width/2+10, base_width/2-10]) {
            for(y=[-base_length/2+10, base_length/2-10]) {
                // 圆柱面上计算打孔位置
                translate([tube_od/2, x, tube_length - focuser_dist + y])
                rotate([0, 90, 0])
                cylinder(d=4.5, h=20, center=true, $fn=32);
            }
        }
        
        // 为副镜架切割固定螺丝孔 (3个, 均布，距离前端约 50mm)
        spider_hub_dist = 50;
        for(i=[0:2]) {
            rotate([0, 0, i*120])
            translate([tube_od/2, 0, tube_length - spider_hub_dist])
            rotate([0, 90, 0])
            cylinder(d=5.5, h=20, center=true, $fn=32);
        }
        
        // 为主镜座切割固定螺丝孔 (3个, 均布，距离底端约 10mm)
        mirror_cell_dist = 10;
        for(i=[0:2]) {
            rotate([0, 0, i*120])
            translate([tube_od/2, 0, mirror_cell_dist])
            rotate([0, 90, 0])
            cylinder(d=4.5, h=20, center=true, $fn=32);
        }
    }
}

tube_body();
