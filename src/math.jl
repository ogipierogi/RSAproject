#contains mathematical methods

function generateRandomPrime(endRange::Integer)
    println("test")
    prime = 0
    startRange = 1
    while isprime(prime) != true
        prime = rand(startRange:endRange)
    end
    return prime
    
end

generateRandomPrime(676386763728328772883712873871872632781387637831782378237237187)
