;This function takes an input array of numbers and create boundaries for bins using certain given
;parameters

;Author - Yifan Yu
;Created - 12/12/2012

;output:  3xn array
;[binmin , binmax , n_elements, sum_elements]
;[ , , , ]
;[ , , , ]
;[ , , , ]
;[ , , , ]
;[ , , , ]



function createBins, in_array, initial_n_bin, min_bin_width, min_bin_members, max_bin_start_val
	print, initial_n_bin, max_bin_start_val
	array_max = double(max(in_array))
	array_min = double(min(in_array))
	array_min = array_min - 0.00001 * abs(array_min)  ;for float comparison reasons

	bin_width = (array_max-array_min) / initial_n_bin
	npoints = n_elements(in_array)
	;set up initial bins

	if(bin_width ge min_bin_width) then begin
		bins = dblarr(4, initial_n_bin)
	endif else begin
		initial_n_bin = fix((array_max-array_min) / min_bin_width)
		bin_width = min_bin_width
		bins = dblarr(4, initial_n_bin)
	endelse
	array_mean = mean(in_array)
	cur_n_bin = fix(initial_n_bin/2)

	if (array_max gt max_bin_start_val) then begin
		bin_width = (max_bin_start_val-array_min) / initial_n_bin
		bins = dblarr(4, initial_n_bin+1)
		for i=0, initial_n_bin-1 do begin
			bins[0,i] = array_min + i * bin_width
			bins[1,i] = array_min + (i+1) * bin_width
			bins[2,i] = 0
			bins[3,i] = 0
		endfor

		bins[0,initial_n_bin] = max_bin_start_val
		bins[1,initial_n_bin] = array_max
		bins[2,initial_n_bin] = 0
		bins[3,initial_n_bin] = 0

		initial_n_bin += 1
		
	endif else begin
		
		for i=0, initial_n_bin-1 do begin
			bins[0,i] = array_min + i * bin_width
			bins[1,i] = array_min + (i+1) * bin_width
			bins[2,i] = 0
			bins[3,i] = 0
		endfor
	endelse
	
	;go through input array and add into bins
	for i=0UL, npoints-1 do begin
		for ibin=0, initial_n_bin-2 do begin
			if ((in_array[i] ge bins[0,ibin]) and (in_array[i] lt bins[1,ibin])) then begin
				bins[2,ibin] += 1
				bins[3,ibin] += in_array[i]
				break
			endif
		endfor
		if ((in_array[i] ge bins[0,initial_n_bin-1]) and (in_array[i] le bins[1,initial_n_bin-1])) then begin
			bins[2,initial_n_bin-1] += 1
			bins[3,initial_n_bin-1] += in_array[i]
		endif
	endfor

	
	;combine bins from the outside inward to meet min-bin member requirement
	;temp variables needed for operation
	cur_bin = bins
	cur_n_bins = initial_n_bin
	;find middle bin
	result = max(cur_bin[2,*],max_index)
	print, 'max_index', max_index
	cur_mid_bin = max_index
	;fix strange distributions where max is on the end
	if ((cur_mid_bin eq 0) or (cur_mid_bin eq initial_n_bin-1)) then cur_mid_bin = fix(initial_n_bin / 2)

	print, 'mid_bin', cur_mid_bin
	index = where(cur_bin[2,*] lt min_bin_members, count)
	while(count gt 0) do begin
		;find outter most bin that needs combining for both left and right of the middle bin
		left_index = where(index le cur_mid_bin, left_count)
		right_index = where(index gt cur_mid_bin, right_count)
		

		;new_n_bins = cur_n_bins - (left_count gt 0) - (right_count gt 0)
		;new_bin = dblarr(4,new_n_bins)
			
		;combine either left or right, if both needs combining, randomly 1 first
		new_n_bins = cur_n_bins - 1
		new_bin = dblarr(4,new_n_bins)
		if (left_count gt 0) and (right_count gt 0) then begin
			temp_rand = randomu(seed)
			if (temp_rand lt 0.5) then right_count=0 else left_count=0
		endif
		print, 'mid_bin:', cur_mid_bin
		;combine left side
		if (left_count gt 0) then begin
			comb_bin_index = index[left_index[0]]	
			for i=0, comb_bin_index-1 do begin
				new_bin[*,i] = cur_bin[*,i]
			endfor
			new_bin[0,comb_bin_index] = cur_bin[0,comb_bin_index]
			new_bin[1,comb_bin_index] = cur_bin[1,comb_bin_index+1]
			new_bin[2,comb_bin_index] = cur_bin[2,comb_bin_index] + cur_bin[2,comb_bin_index+1]
			new_bin[3,comb_bin_index] = cur_bin[3,comb_bin_index] + cur_bin[3,comb_bin_index+1]
			for i=comb_bin_index+1, new_n_bins-1 do begin
				new_bin[*,i] = cur_bin[*,i+1]
			endfor
		endif	
		;combine right side
		if (right_count gt 0) then begin
			comb_bin_index = index[right_index[right_count-1]]
			for i=0, comb_bin_index-2 do begin
				new_bin[*,i] = cur_bin[*,i]
			endfor
			new_bin[0,comb_bin_index-1] = cur_bin[0,comb_bin_index-1]
			new_bin[1,comb_bin_index-1] = cur_bin[1,comb_bin_index]
			new_bin[2,comb_bin_index-1] = cur_bin[2,comb_bin_index-1] + cur_bin[2,comb_bin_index]
			new_bin[3,comb_bin_index-1] = cur_bin[3,comb_bin_index-1] + cur_bin[3,comb_bin_index]
			if (comb_bin_index lt cur_n_bins-1) then begin
				for i=comb_bin_index, new_n_bins-1 do begin
					new_bin[*,i] = cur_bin[*,i+1]
				endfor
			endif
		endif
		;update bins and find new middle bin
		print, cur_bin
		print, ''
		cur_bin = new_bin
		temp_size = size(cur_bin)
		cur_n_bins = temp_size[2]
		bin_means = cur_bin[3,*] / cur_bin[2,*]
		temp_min = min(abs(bin_means-array_mean),min_index)
		cur_mid_bin = min_index
		;fix strange distributions where max is on the end
		if ((cur_mid_bin eq 0) or (cur_mid_bin eq cur_n_bins-1)) then cur_mid_bin = fix(cur_n_bins / 2)
		;see if anymore to combine
		index = where(cur_bin[2,*] lt min_bin_members, count)
	endwhile

return, cur_bin

end
