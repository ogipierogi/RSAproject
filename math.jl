#contains mathematical methods

function generateRandomPrime(startRange::Any, endRange::Any)
    prime = 0
    while isprime(prime) != true
        prime = rand(startRange:endRange)
    end
    return prime
    
end

generateRandomPrime(1,676386763728328772883712873871872632781387637831782378237237187)
