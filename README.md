# Rsa
This repository contains simple implementation of RSA algorithm. You can encrypt/decrypt files with your parameters. The library has been written for educational purposes. If you want to use RSA encryption in commercial software, or in your company, you should use proven implementations of RSA.

# List of functions
convertToInt(textBlock::AbstractString) - is used to determine numeric representation of text blocks. Pass one string as argument, return integer value of text block. 

convertToText(intResult::Integer, lengthOfTextBlock::Integer) - is used to determine text representation of number with specific lenth. Pass two integers as arguments - first is a numeric representation of tex block, second is the length of text blocks. Return string which is text equivalent of number.
