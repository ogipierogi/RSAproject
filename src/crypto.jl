# function which convert string into integer by using algorithms from site http://157.158.16.139/js/wyklady/krypto/wyklad2.pdf
# in attached link to lecture, you can find mathematical description in section "Przeksztalcenie slowa na liczbe"
# 256 is a length of alphabet - in this case this is extended ASCII Aarray
# each letter from textBlock::AbstractString has equivalent integer in 256-elements alphabet from 0 to 255 <=> (256-1)
# line Int(textBlock[i]) - return character code
# this method gives possibility to write second function wihich convert int to string, beacause the returned intResult
# is te record of this number at the base n=256

function power(number::Integer, power::Integer)
    result = 1
    for i = 0:(power-1)
        result = BigInt(result*number)
    end
    return result
end
power(256,9)

function convertToInt(textBlock::AbstractString)

    convertStringToCharArray = collect(textBlock)
    
    intResult = 0
    iterations = length(textBlock)

    for i = 1:iterations
        intResult = intResult + ( ( Int(convertStringToCharArray[i]) ) * power(256,i) )
    end
    return intResult
end

# function reverse to convertToInt

function convertToText(intResult::Integer, lengthOfTextBlock::Integer)

    result = Char[]
    tmp = intResult
    for i = 1:lengthOfTextBlock+1
        intResult = tmp % 256
        tmp = div(tmp,256)
        nic = Char(intResult)
	push!(result,nic)
    end
    text = AbstractString(result)
    return text[2:lengthOfTextBlock+1]
end

# gen random prime

function generateRandomPrime(range::Integer)
    prime = 0
    while isprime(prime) != true
        prime = rand(1:range)
    end
    return prime

end

generateRandomPrime(676386763728328772883712873871872632781387637831782378237237187)

function writeToFile(path::AbstractString, what::Any)
    outputFile = open(path, "w")
    try
    	write(outputFile, what)
    finally
    	close(outputFile)
    end
end

function readKeyFromFile(path::AbstractString)
    inputFile = open(path)
    key = ""
    try
    	key = readline(inputFile)
    finally
    	close(inputFile)
    end

    return key
end

function readCipherFromFile(path::AbstractString)
    
    encryptedInts = []

    inputFile = open(path, "r")
    try
        for line in eachline(inputFile)
           push!(encryptedInts, line)
        end
    finally
        close(inputFile)
    end
    return encryptedInts

end

function readPlainFromFile(path::AbstractString)
    inputFile = open(path)
    plain = ""
    try
    	plain = readall(inputFile)
    finally
        close(inputFile)
    end
    
    return plain
end

function generateKeys(nPath::AbstractString, ePath::AbstractString, dPath::AbstractString, whichRangeOfp::Integer, whichRangeOfq::Integer)
    p=generateRandomPrime(whichRangeOfp)
    q=generateRandomPrime(whichRangeOfq)
    n=p*q
    fi=(p-1)*(q-1)
    e=rand(1:fi)
    
    while gcd(e,fi) != 1
	e=rand(1:fi)
    end
    
    d=invmod(e,fi)
    writeToFile(nPath,join(n)) # n and e is public key
    writeToFile(ePath,join(e)) # n and d is private key
    writeToFile(dPath,join(d))
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
        return l-1
end

function determineK(n::Integer)
    k = determineL(n) - 1
    return k
end

function encrypt(plainPath::AbstractString,nPath::AbstractString, ePath::AbstractString, dPath::AbstractString, cipherPath::AbstractString, whichRangeOfp::Integer, whichRangeOfq::Integer)
    generateKeys(nPath,ePath,dPath, whichRangeOfp, whichRangeOfq)

    n=parse(BigInt,readKeyFromFile(nPath))
    e=parse(BigInt,readKeyFromFile(ePath))
    d=parse(BigInt,readKeyFromFile(dPath))

    l=determineL(n)
    k=determineK(n)

    plain = readPlainFromFile(plainPath)

    println("Plain text is: ")    
    println(plain)

    size = sizeof(plain)
    
    cipherText = ""
    encipherText = ""
    
    # encrypt/decrypt
    
    encryptedInts = Integer[]
    
    for i = 1:k:size
	  ifNull = ((i+k)-1)
       if ifNull < size
          intRepresent = convertToInt(string(plain[i:ifNull])) 
	  encryptedAsInt = powermod(intRepresent, e, n)
	  encryptedAsText = convertToText(encryptedAsInt, l)
          
          push!(encryptedInts, BigInt(encryptedAsInt))

	  cipherText = cipherText * encryptedAsText
        end
    end

    writedlm(cipherPath, encryptedInts)

    println("Encrypted text is: ")
    println(cipherText)   
end

encrypt("/Users/i321387/RSAproject/src/testowy.txt", "/Users/i321387/RSAproject/src/n.txt", "/Users/i321387/RSAproject/src/e.txt", "/Users/i321387/RSAproject/src/d.txt", "/Users/i321387/RSAproject/src/cipherInts.txt", 25555555555556788888863432434342344234234242423423999, 25555555555556788888863432434342344234234242423423423)

function decrypt(cipherPath::AbstractString, decipherPath::AbstractString, nPath::AbstractString, dPath::AbstractString)

    n=parse(BigInt,readKeyFromFile(nPath))
    d=parse(BigInt,readKeyFromFile(dPath))

    l=determineL(n)
    k=determineK(n)
    
    encryptedInts = readCipherFromFile(cipherPath)
    
    decipherText = ""

    for i = 1:length(encryptedInts)
       encryptedAsInt = parse(BigInt, encryptedInts[i])
       decryptedAsInt = powermod(encryptedAsInt, d, n)
       decryptedAsText = convertToText(decryptedAsInt, l)
       decipherText = decipherText * decryptedAsText
    end
    
    writeToFile(decipherPath, decipherText)

    println("Decrypted text is: ")
    println(decipherText)
end

decrypt("/Users/i321387/RSAproject/src/cipherInts.txt", "/Users/i321387/RSAproject/src/decipher.txt",  "/Users/i321387/RSAproject/src/n.txt", "/Users/i321387/RSAproject/src/d.txt")
