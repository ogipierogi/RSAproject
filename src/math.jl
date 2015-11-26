#contains mathematical methods

function generateRandomPrime(startRange::Integer, endRange::Integer)
    prime = 0
    while isprime(prime) != true
        prime = rand(startRange:endRange)
    end
    return prime
    
end

generateRandomPrime(1,676386763728328772883712873871872632781387637831782378237237187)
#convertToInt("koks")
