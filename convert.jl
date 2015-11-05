# function which convert string into integer by using algorithms from site http://157.158.16.139/js/wyklady/krypto/wyklad2.pdf
# in attached link to lecture, you can find mathematical description in section "Przeksztalcenie slowa na liczbe"
# 256 is a length of alphabet - in this case this is extended ASCII Aarray
# each letter from textBlock::AbstractString has equivalent integer in 256-elements alphabet from 0 to 255 <=> (256-1)
# line Int(textBlock[i]) - return character code
# this method gives possibility to write second function wihich convert int to string, beacause the returned intResult
# is te record of this number at the base n=256

function convertToInt(textBlock::AbstractString)

    intResult = 0
    iterations = length(textBlock)
    for i = 1:iterations
        intResult = intResult + ( ( Int(textBlock[i]) ) * (256 ^ (i-1) ) )
    end
    return intResult
end

convertToInt("koks")


# TO:DO Comment it!

# function convertToText(intResult::Int, lengthOfTextBlock::Int)

# TO:DO 

# end
