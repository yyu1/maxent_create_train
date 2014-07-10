;pass in a value and the bin array, returns index of which bin the value falls in

function whichbin, bin_array, in_val
	n_bins = (size(bin_array))[2]
	return_val = uint(0)
	for i=0, n_bins-2 do begin
		binmax = bin_array[1,i]
		if (in_val ge binmax) then return_val += 1
	endfor
	return, return_val
end
