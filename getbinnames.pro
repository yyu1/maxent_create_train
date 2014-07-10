;pass in array of bins produced by createBins function and returns
;array of bin names

function getbinnames, bin_array
	dec_form = '(f6.3)'
	is_dec = 0
	n_bins = (size(bin_array))[2]
	name_array = strarr(n_bins)
	for i=0, n_bins-2 do begin
		binmin = bin_array[0,i]
		binmax = bin_array[1,i]
		if ((binmax - binmin) gt 1) then begin
			name_array[i] = strtrim(string(fix(binmin)),2) + '-' + strtrim(string(fix(binmax)),2)
		endif else begin	
			is_dec = 1
			name_array[i] = strtrim(string(binmin,format=dec_form),2) + '-' + strtrim(string(binmax,format=dec_form),2)
		endelse
	endfor
	binmin = bin_array[0,n_bins-1]
	if (is_dec) then begin
		name_array[n_bins-1] = '>' + strtrim(string(binmin,format=dec_form),2)
	endif else begin
		name_array[n_bins-1] = '>' + strtrim(string(fix(binmin)),2)
	endelse
	return, name_array
end
