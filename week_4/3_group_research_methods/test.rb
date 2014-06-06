find_all might work
array.find_all {|i| !i.include? ___}
hash.find_all {|k,v| !v.include? ___}

better yet...
array.reject {|i| i.include? ___}
#returns a new array
#reject! returns same array, but nil if no changes were made

better yet...
array.delete_if {|i| i.include? ___}