;create maxent training file from GLAS data.
;can set aside points for training

;This version takes in unmodified coordinates

;modification 12/5/2014  if class_to_use = 0, means ignore class matching

PRO create_maxent_train_proc_unmodxy, in_file, log_file, x_col, y_col, val_col, class_col, slope_col, max_slope, class_to_use, out_train_file, out_valid_file, out_bin_file, train_pct, max_bins, min_bin_width, min_bin_members, valname, coordformat, valformat, max_bin_start

;---------------settings--------------------------
;in_file = '/Volumes/Global_250m/samples/glas/glas_sea.csv'
;log_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sea_v1_misclass.log'
;x_col = 0 		;0 index
;y_col = 1 		;0 index
;val_col = 2 	;0 index
;class_col = 7 ;0 index
;slope_col = 5  ;0 index  ;use pctslope for filter here
;max_slope = 20
;class_to_use = [14,20,30,140,150,230]   ;which class to include in this training file (can be array)
;out_train_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/train_hlorey_sea_v1_misclass.csv'
;out_valid_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/validation_hlorey_sea_v1_misclass.csv'
;out_bin_file = '/Volumes/Global_250m/samples/glas/train_hlorey_v1/bin_hlorey_sea_v1_misclass.csv'
;train_pct = 80
;max_bins = 40 ;# of bins to start with
;min_bin_width = 1 
;min_bin_members = 500 ;minimum of 100 plots per class, since 20% need to be set aside for validation
PI = 3.141592653589793238d0
;valname = 'hlorey'  ; name of value
;coordformat = '(d20.1)' ; format code for output 
;valformat = '(f4.1)' ;format code for value
;-------------------------------------------------

max_bin_start = 600


;**************
journal, log_file
;print configuration
print, 'configurations:'
print, 'in_file', in_file
print, 'log_file', log_file
print, 'lon_col', x_col
print, 'lat_col', y_col
print, 'val_col', val_col
print, 'class_col', class_col
print, 'slope_col', slope_col
print, 'max_slope', max_slope
print, 'class_to_use', class_to_use
print, 'out_train_file', out_train_file
print, 'out_valid_file', out_valid_file
print, 'out_bin_file', out_bin_file
print, 'train_pct', train_pct
print, 'out_train_file', out_train_file
print, 'out_valid_file', out_valid_file
print, 'max_bins', max_bins
print, 'min_bin_width', min_bin_width
print, 'min_bin_members', min_bin_members
print, 'max_bin_start', max_bin_start
;end of configuration for log file

;load modsingrid transformation routine


outheader = 'class,modsin_x,modsin_y,' + valname + ',category'
openr, 1, in_file
openw, 2, out_train_file
openw, 3, out_valid_file
openw, 4, out_bin_file

raw_data = read_csv(in_file)
raw_n_plots = (size(raw_data.(0)))[1]
raw_n_data_cols = n_tags(raw_data)
raw_tag_names = tag_names(raw_data)

;filter for the specified class(es)
size_result = size(class_to_use)
if (size_result[0] gt 1) then begin
	print, 'ERROR in setting file, class must be scalar or 1-dimensional array!'
endif
if (size_result[0] eq 0) then n_class = 1 else n_class = size_result[1]
indices_ptr = ptrarr(n_class)
counts = lonarr(n_class)
for i=0, n_class-1 do begin
	if (class_to_use[i] eq 0) then begin
		;index = where((raw_data.(val_col) lt 60), count)
		index = where((raw_data.(val_col) gt 0), count)
	endif else begin
		index = where((raw_data.(class_col) eq class_to_use[i]) and (raw_data.(val_col) lt 60), count) ;ignore hlorey = 60
	endelse
	counts[i] = count
	if (count gt 0) then begin
		indices_ptr[i] = ptr_new(index)
	endif
endfor
;create index containing filtered plots
indices = lonarr(total(counts))
cur_index = 0L
for i=0, n_class-1 do begin
	if (counts[i] gt 0) then begin
		indices[cur_index:cur_index+counts[i]-1] = *indices_ptr[i]
		cur_index += counts[i]
	endif
endfor

if (slope_col ne -1) then begin
	indices2 = where(raw_data.(slope_col) le max_slope)

	final_index = setintersection(indices,indices2)
endif else begin
	final_index = indices
endelse

data = create_struct(raw_tag_names[0], (raw_data.(0))[final_index])
for i=1, raw_n_data_cols-1 do begin
	data = create_struct(data, raw_tag_names[i], (raw_data.(i))[final_index])
endfor

n_plots = (size(data.(0)))[1]

;now that we created the filtered data, free the heap variables
for i=0, n_class-1 do begin
	if (counts[i] gt 0) then ptr_free, indices_ptr[i]
endfor

;create bins 
bins = createBins(data.(val_col), max_bins, min_bin_width, min_bin_members, max_bin_start)
bin_names = getbinnames(bins)
n_bins = (size(bins))[2]
print, 'binning results: binname, binmin, binmax, n_elements, sum_elements, bin average'
for i=0, n_bins-1 do begin
	print, bin_names[i], bins[*,i], bins[3,i]/bins[2,i]
	printf, 4, bin_names[i], bins[*,i], bins[3,i]/bins[2,i], format='(A,",",2(f0.6,","),I0,",",(f0.3),",",(f0.3))'
endfor

;write output training file
printf, 2, outheader   ;write header
printf, 3, outheader   ;write header
for i=0ULL, n_plots-1 do begin
	;convert coordinates from lat/lon to modis sinusoidal
	;rad_lon = (data.(x_col))[i] / 180.d0 * PI
	;rad_lat = (data.(y_col))[i] / 180.d0 * PI
	;coords = lonlat_to_sin(rad_lon, rad_lat)
	coords = [(data.(x_col))[i], (data.(y_col))[i]]
	cur_val = (data.(val_col))[i]
	cur_bin = whichbin(bins, cur_val)
	cur_name = bin_names[cur_bin]
	if (randomu(seed) lt (0.01 * train_pct)) then out_fid = 2 else out_fid = 3
	printf, out_fid, cur_name + ',' + strtrim(string(coords[0],format=coordformat),2) + ',' + strtrim(string(coords[1],format=coordformat),2) + ',' + strtrim(string(cur_val,format=valformat),2) + ',' + strtrim(string(fix(cur_bin)),2)
endfor

close, /all

end
