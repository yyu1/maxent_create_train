in_file = '~/glas/glas_agb_4.2.5_30pctslp_2shotmin_aggregate.csv'
log_file = '~/glas/glas_agb_maxent_train_v4.2.5_sam.log'
x_col = 0
y_col = 1
val_col = 3
class_col = -1
slope_col = -1
max_slope = 30
class_to_use = 0
out_train_file = '~/glas/glas_agb_maxent_train_v4.2.5.csv'
out_valid_file = '~/glas/glas_agb_maxent_validation_v4.2.5.csv'
out_bin_file = '~/glas/glas_agb_maxent_bin_v4.2.5.csv'
train_pct = 80
max_bins = 12
min_bin_width = 2
min_bin_members = 500
valname = 'agb'
coordformat = '(d20.1)'
valformat = '(f6.1)'


create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

end
