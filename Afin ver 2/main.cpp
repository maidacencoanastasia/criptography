#include <iostream>
#include <stdio.h>
#include <conio.h>
#include <algorithm>

int gcd(int a, int b);
int modInverse(int a, int b);

int main(){
    std::string choice, x;
    std::cout << "Encrypt or Decrypt? [e/d] = ";
    std::getline(std::cin, choice);
    std::cout << "\nInput string: ";
    std::string input;
    std::getline(std::cin, input);

    int a, b;
    do{
        std::cout << "\na and b must be coprime\na = ";
        std::cin >> a;
        std::cout << "b = ";
        std::cin >> b;
    } while(std::cin.fail() || gcd(a,b) != 1);

    std::cout << '\n';

    if(choice == "e"){
        for(int i = 0; i < input.length(); ++i){
            if(input[i] >= 'a' && input[i] <= 'z'){
                std::cout << (char)((a * (input[i] - 'a') + b) % 26 + 'a');
            } else if(input[i] >= 'A' && input[i] <= 'Z'){
                std::cout << (char)((a * (input[i] - 'A') + b) % 26 + 'A');
            } else{
                std::cout << input[i];
            }
        }
    } else
        {
        for(int i = 0; i < input.length(); ++i){
            if(input[i] >= 'a' && input[i] <= 'z'){
                std::cout << (char)(modInverse(a, 26) * (26 + input[i] - 'a' - b) % 26 + 'a');
            } else if(input[i] >= 'A' && input[i] <= 'Z'){
                std::cout << (char)(modInverse(a, 26) * (26 + input[i] - 'A' - b) % 26 + 'A');
            } else{
                std::cout << input[i];
            }
        }
    }


    return 0;
}

int gcd(int a, int b){
    return b == 0 ? a : gcd(b, a % b);
}

int modInverse(int a, int b){
    int b0 = b, t, q;
    int x0 = 0, x1 = 1;
    if (b == 1) return 1;
    while (a > 1) {
        q = a/b;
        t = b, b = a % b, a = t;
        t = x0, x0 = x1 - q * x0, x1 = t;
    }
    if (x1 < 0) x1 += b0;
    return x1;
}
