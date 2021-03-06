# auxiliary/unique2.jl
#
# Similar to unique, but removes all occurences of elements that appear more than once.

"""
    unique2(itr)

Returns an array containing only those elements that appear exactly once in itr,
and without any elements that appear more than once.
"""
function unique2(itr)
    out = collect(itr)
    i = 1
    while i < length(out)
        inext = _findnext(equalto(out[i]), out, i+1)
        if inext == nothing || inext == 0
            i += 1
            continue
        end
        while !(inext == nothing || inext == 0)
            deleteat!(out,inext)
            inext = _findnext(equalto(out[i]), out, i+1)
        end
        deleteat!(out,i)
    end
    out
end
