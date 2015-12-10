# function which convert string into integer by using algorithms from site http://157.158.16.139/js/wyklady/krypto/wyklad2.pdf
# in attached link to lecture, you can find mathematical description in section "Przeksztalcenie slowa na liczbe"
# 256 is a length of alphabet - in this case this is extended ASCII Aarray
# each letter from textBlock::AbstractString has equivalent integer in 256-elements alphabet from 0 to 255 <=> (256-1)
# line Int(textBlock[i]) - return character code
# this method gives possibility to write second function wihich convert int to string, beacause the returned intResult
# is te record of this number at the base n=256

function power(number::Integer, power::Integer)
    result = 1
    for i = 1:(power-1)
        result = BigInt(result*number)
    end
    return result
end
power(256,9)

function convertToInt(textBlock::AbstractString)

    intResult = 0
    iterations = length(textBlock)
    for i = 1:iterations
        intResult = intResult + ( ( Int(textBlock[i]) ) * power(256,i) )
    end
    return intResult
end

convertToInt("koks")


# function reverse to convertToInt

function convertToText(intResult::Integer, lengthOfTextBlock::Integer)

    result = Char[]
    tmp = intResult
    for i = 1:lengthOfTextBlock
        intResult = tmp % 256
        tmp = div(tmp,256)
        nic = Char(intResult)
        push!(result,nic)
    end
    return UTF8String(result)
end

convertToText(1936420715,4)

# gen random prime

function generateRandomPrime(range::Integer)
    prime = 0
    while isprime(prime) != true
        prime = rand(1:range)
    end
    return prime

end

generateRandomPrime(676386763728328772883712873871872632781387637831782378237237187)

function writeKeyToFile(path::AbstractString, what::Any)
    outputFile = open(path, "w")
    write(outputFile, what)
    close(outputFile)
end

function readKeyFromFile(path::AbstractString)
    inputFile = open(path)
    key = readline(inputFile)
    close(inputFile)
    return key
end

function readPlainText(path::AbstractString)
    plain = readall(path)
    return plain
end

function generateKeys(nPath::AbstractString, ePath::AbstractString, dPath::AbstractString)
    p=generateRandomPrime(123123321312312312312312312312312312312312312312312312312312312)
    q=generateRandomPrime(123123321312312312312312312312312312312312312312312312312312312324324234322)
    n=p*q
    fi=(p-1)*(q-1)
    e=generateRandomPrime(fi)

    while gcd(e,fi) != 1
        e=generateRandomPrime(fi)
    end

    d=invmod(e,n)
    writeKeyToFile(nPath,join(n)) # n and e is public key
    writeKeyToFile(ePath,join(e)) # n and d is private key
    writeKeyToFile(dPath,join(d))
end

function determineL(n::Integer)
    k=0 # parts of plain textblock, k=l-1
    l=0 # parts of cipher textblock
    for i = 1:100
            if k<=n
                k = power(256, i)
            elseif k>n
                break
            end
            l+=1
        end
        return l
end

function determineK(n::Integer)
    k = determineL(n) - 1
    return k
end

function encrypt()
    generateKeys("/Users/i321387/RSAproject/src/n.txt", "/Users/i321387/RSAproject/src/e.txt", "/Users/i321387/RSAproject/src/d.txt")

    n=parse(BigInt,readKeyFromFile("/Users/i321387/RSAproject/src/n.txt"))
    e=parse(BigInt,readKeyFromFile("/Users/i321387/RSAproject/src/e.txt"))
    
    l=determineL(n)
    k=determineK(n)

    plain = readPlainText("/Users/i321387/RSAproject/src/testowy.txt")
    cipher = ""

    size = sizeof(plain)
    plainToEncrypt = ""
    
    for i = 1:size
         if k + i > size
            k = size - i
        end
    println(plain[i:k])
    end    
end

encrypt()

#function decrypt()
    #n=readKeyFromFile("/Users/i321387/RSAproject/src/n.txt")
    #d=readKeyFromFile("/Users/i321387/RSAproject/src/d.txt")
    
    #l=determineL(n)
    #k=determineK(n)
#end