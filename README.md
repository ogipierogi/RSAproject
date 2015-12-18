# Rsa library
This repository contains simple implementation of RSA algorithm. You can encrypt/decrypt files with your parameters. The library has been written for educational purposes. If you want to use RSA encryption in commercial software, or in your company, you should use proven implementations of RSA.

# List of functions

> - **convertToInt**(textBlock::**AbstractString**) - is used to determine numeric representation of text blocks. Pass one string as argument (this is text block), return integer value of text block (passed argument). 

> - **convertToText**(intResult::**Integer**, lengthOfTextBlock::**Integer**) - is used to determine text representation of number with specific lenth. Pass two integers as arguments - first is a numeric representation of text block, second is the length of text blocks. Return string which is text equivalent of number.

> - **function power**(number::**Integer**, power::**Integer**) - is used to exponentiation. Pass two integers as arguments - first is the base and second is the exponent n. Return integer value of exponentiation.

> - **function generateRandomPrime**(range::**Integer**) - is used to generation random primes. Pass one integer as argument, which define the end of the range from which the prime is generated. Return prime number.

> - **function readKeyFromFile**(path::**AbstractString**)

> - **function readCipherFromFile**(path::**AbstractString**)

> - **function readPlainFromFile**(path::**AbstractString**)

> - **function writeToFile**(path::**AbstractString**, what::**Any**)

> - **function generateKeys**(nPath::**AbstractString**, ePath::**AbstractString**, dPath::**AbstractString**, whichRangeOfp::**Integer**, whichRangeOfq::**Integer**)

> - **function determineL**(n::**Integer**)

> - **function determineK**(n::**Integer**)

> - **function encrypt**(plainPath::**AbstractString**,nPath::**AbstractString**, ePath::**AbstractString**, dPath::**AbstractString**, cipherPath::**AbstractString**, whichRangeOfp::**Integer**, whichRangeOfq::**Integer**)

> - **function decrypt**(cipherPath::**AbstractString**, decipherPath::**AbstractString**, nPath::**AbstractString**, dPath::**AbstractString**)

