x_col = 0
y_col = 1
val_col = 3   ;hlorey
class_col = 4
slope_col = -1
max_slope = 20
train_pct = 80
max_bins = 15
max_bin_start = 35
min_bin_width = 1
min_bin_members = 500
valname = 'hlorey'
coordformat = '(d20.1)'
valformat = '(f4.1)'


;South America
;[110,120,130], [160,170], [40], [50,60,100], [misclass]
;in_file = '/Volumes/Global_250m/samples/glas/glas_sam.csv'
;log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sam_v1_cl110120130.log'
;class_to_use = [110,120,130]
;out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sam_v1_cl110120130.csv'
;out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/valid_hlorey_sam_v1_cl110120130.csv'
;out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/bin_hlorey_sam_v1_cl110120130.csv'
;create_maxent_train_proc, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start
;
;in_file = '/Volumes/Global_250m/samples/glas/glas_sam.csv'
;log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sam_v1_cl160170.log'
;class_to_use = [160,170]
;out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sam_v1_cl160170.csv'
;out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/valid_hlorey_sam_v1_cl160170.csv'
;out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/bin_hlorey_sam_v1_cl160170.csv'
;create_maxent_train_proc, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start
;
in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_aggregate_2plus_sam_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sam/process_hlorey_sam_v3_cl40160.log'
class_to_use = [40,160]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sam/train_hlorey_sam_v3_cl40160.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sam/valid_hlorey_sam_v3_cl40160.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v3/sam/bin_hlorey_sam_v3_cl40160.csv'
create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

;in_file = '/Volumes/Global_250m/samples/glas/glas_sam.csv'
;log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sam_v1_cl5060100.log'
;class_to_use = [50,60,100]
;out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sam_v1_cl5060100.csv'
;out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/valid_hlorey_sam_v1_cl5060100.csv'
;out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/bin_hlorey_sam_v1_cl5060100.csv'
;create_maxent_train_proc, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start
;
;in_file = '/Volumes/Global_250m/samples/glas/glas_sam.csv'
;log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sam_v1_misclass.log'
;class_to_use = [14,20,30,140,150,230]
;out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sam_v1_misclass.csv'
;out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/valid_hlorey_sam_v1_misclass.csv'
;out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/bin_hlorey_sam_v1_misclass.csv'
;create_maxent_train_proc, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

end
