# Rsa library
This repository contains simple implementation of RSA algorithm. You can encrypt/decrypt files with your parameters. The library has been written for educational purposes. If you want to use RSA encryption in commercial software, or in your company, you should use proven implementations of RSA.

# List of functions

> - **convertToInt**(textBlock::**AbstractString**) - is used to determine numeric representation of text blocks. Pass one string as argument (this is text block), return integer value of text block (passed argument). 

> - **convertToText**(intResult::**Integer**, lengthOfTextBlock::**Integer**) - is used to determine text representation of number with specific lenth. Pass two integers as arguments - first is a numeric representation of text block, second is the length of text blocks. Return string which is text equivalent of number.

> - **function power**(number::**Integer**, power::**Integer**) - is used to exponentiation. Pass two integers as arguments - first is the base and second is the exponent n. Return integer value of exponentiation.

> - **function generateRandomPrime**(range::**Integer**) - is used to generation random primes. Pass one integer as argument, which define the end of the range from which the prime is generated. Return prime number.

> - **function determineK**(n::**Integer**) - is used to determine length of text block which is encrypted. Pass one integer as argument, which is the n from the public key pair (length is determine based on n). Return the length to which it is divided the plain text.

> - **function determineL**(n::**Integer**) - is used to determine length of text block which is dencrypted. Pass one integer as argument, which is the n from the public key pair (length is determine based on n). Return the length to which it is divided the cipher text.

> - **function readKeyFromFile**(path::**AbstractString**) - is used to read keys n, e, d from files. Pass one string as argument, which is the path to file containing integer value of key. Return key value.

> - **function readCipherFromFile**(path::**AbstractString**) - is used to read cipher from file. Pass one string as argument, which is the path to file containing cipher. Return cipher.

> - **function readPlainFromFile**(path::**AbstractString**) - is used to read cipher from file. Pass one string as argument, which is the path to file containing plain text. Return plain text.

> - **function writeToFile**(path::**AbstractString**, what::**Any**) - is used to write data to file. Pass one string as argument, which is the path to place where file is saved.

> - **function generateKeys**(nPath::**AbstractString**, ePath::**AbstractString**, dPath::**AbstractString**, whichRangeOfp::**Integer**, whichRangeOfq::**Integer**) - is used to determine public and private keys. Pass three strings as arguments, which are the paths to directory where keys are saved. Pass two integer as arguments, which are the ranges for determine p and q primes. Function save public and private key to file.

> - **function encrypt**(plainPath::**AbstractString**,nPath::**AbstractString**, ePath::**AbstractString**, dPath::**AbstractString**, cipherPath::**AbstractString**, whichRangeOfp::**Integer**, whichRangeOfq::**Integer**) - is used to encryption of text. Pass five string as arguments, which are paths to file with plain text, public and private key, and path to directory where cipher is saved. Pass two integer as arguments, which are the ranges for determine p and q primes. Function save cipher into file.

> - **function decrypt**(cipherPath::**AbstractString**, decipherPath::**AbstractString**, nPath::**AbstractString**, dPath::**AbstractString**) - is used to decryption of text. Pass four string arguments, which are the paths to private key, cipher, and path to directory where plaintext is saved. Function save plain text into file.

