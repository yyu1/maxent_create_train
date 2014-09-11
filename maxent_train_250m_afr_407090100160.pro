x_col = 0
y_col = 1
val_col = 3   ;hlorey
class_col = 4
slope_col = -1
max_slope = 30
train_pct = 80
max_bins = 10
max_bin_start = 40
min_bin_width = 1
min_bin_members = 500
valname = 'hlorey'
coordformat = '(d20.1)'
valformat = '(f4.1)'



;;Africa
;;[110,120,130], [50,60], [70,90,100], [160,170,180], [40], [misclass]
in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_afr_aggregate_2plus_30pctslp_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sam/process_hlorey_afr_v3_cl407090100160.log'
class_to_use = [40, 70, 90, 100, 160]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/afr/train_hlorey_afr_v3_cl407090100160.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/afr/valid_hlorey_afr_v3_cl407090100160.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/afr/bin_hlorey_afr_v3_cl407090100160.csv'
create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_afr_aggregate_2plus_30pctslp_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sam/process_hlorey_afr_v3_cl407090100160.log'
class_to_use = [14, 20, 30, 140, 150, 230]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/afr/train_hlorey_afr_v3_misclass.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/afr/valid_hlorey_afr_v3_misclass.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/afr/bin_hlorey_afr_v3_misclass.csv'
create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

end
