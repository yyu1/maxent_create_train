x_col = 0
y_col = 1
val_col = 3   ;hlorey
class_col = 4
slope_col = -1
max_slope = 30
train_pct = 80
max_bins = 10
max_bin_start = 40
min_bin_width = 3
min_bin_members = 500
valname = 'hlorey'
coordformat = '(d20.1)'
valformat = '(f4.1)'



;;North America
;cl100
in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_nam_aggregate_2plus_30pctslp_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/process_hlorey_nam_v2_cl100.log'
class_to_use = [100]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/train_hlorey_nam_v2_cl100.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/valid_hlorey_nam_v2_cl100.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/bin_hlorey_nam_v2_cl100.csv'
create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

;110 120 130
max_bins = 5
max_bin_start = 20
in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_nam_aggregate_2plus_30pctslp_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/process_hlorey_nam_v2_cl110120130.log'
class_to_use = [110,120,130]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/train_hlorey_nam_v2_cl110120130.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/valid_hlorey_nam_v2_cl110120130.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/bin_hlorey_nam_v2_cl110120130.csv'
create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

;160 170
;max_bins = 3
;max_bin_start = 15
;in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_nam_aggregate_2plus_30pctslp_extract.csv'
;log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/process_hlorey_nam_v2_cl160170.log'
;class_to_use = [160,170]
;out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/train_hlorey_nam_v2_cl160170.csv'
;out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/valid_hlorey_nam_v2_cl160170.csv'
;out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/bin_hlorey_nam_v2_cl160170.csv'
;create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

;40
max_bins = 10
max_bin_start = 40
in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_nam_aggregate_2plus_30pctslp_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/process_hlorey_nam_v2_cl40.log'
class_to_use = [40]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/train_hlorey_nam_v2_cl40.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/valid_hlorey_nam_v2_cl40.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/bin_hlorey_nam_v2_cl40.csv'
create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

;50 60
max_bins = 10
max_bin_start = 30
in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_nam_aggregate_2plus_30pctslp_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/process_hlorey_nam_v2_cl5060.log'
class_to_use = [50,60]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/train_hlorey_nam_v2_cl5060.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/valid_hlorey_nam_v2_cl5060.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/bin_hlorey_nam_v2_cl5060.csv'
create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

;70
max_bins = 10
max_bin_start = 45
in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_nam_aggregate_2plus_30pctslp_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/process_hlorey_nam_v2_cl70.log'
class_to_use = [70]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/train_hlorey_nam_v2_cl70.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/valid_hlorey_nam_v2_cl70.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/bin_hlorey_nam_v2_cl70.csv'
create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

in_file = '/Users/yifan/work/projects/global_carbon/250m/glas/glas_nam_aggregate_2plus_30pctslp_extract.csv'
log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/process_hlorey_nam_v2_cl90.log'
class_to_use = [90]
out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/train_hlorey_nam_v2_cl90.csv'
out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/valid_hlorey_nam_v2_cl90.csv'
out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v2/nam/bin_hlorey_nam_v2_cl90.csv'
create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start



end
