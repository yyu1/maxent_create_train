x_col = 0
y_col = 1
val_col = 3   ;hlorey
class_col = 4
slope_col = -1
max_slope = 20
train_pct = 80
max_bins = 15
max_bin_start = 45
min_bin_width = 1
min_bin_members = 500
valname = 'hlorey'
coordformat = '(d20.1)'
valformat = '(f4.1)'



;;Southeast Asia
;;[110,120,130], [50,60], [70,90,100], [160,170,180], [40], [misclass]
in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_aggregate_2plus_sea_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sam/process_hlorey_sea_v3_cl40.log'
class_to_use = [40]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sea/train_hlorey_sea_v3_cl40.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sea/valid_hlorey_sea_v3_cl40.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sea/bin_hlorey_sea_v3_cl40.csv'
create_maxent_train_proc, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_aggregate_2plus_sea_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sam/process_hlorey_sea_v3_cl7090100.log'
class_to_use = [70,90,100]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sea/train_hlorey_sea_v3_cl7090100.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sea/valid_hlorey_sea_v3_cl7090100.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sea/bin_hlorey_sea_v3_cl7090100.csv'
create_maxent_train_proc, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_aggregate_2plus_sea_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sam/process_hlorey_sea_v3_misclass.log'
class_to_use = [14,20,30,140,150,230]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sea/train_hlorey_sea_v3_misclass.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sea/valid_hlorey_sea_v3_misclass.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sea/bin_hlorey_sea_v3_misclass.csv'
create_maxent_train_proc, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

end
