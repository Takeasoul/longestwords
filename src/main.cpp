#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <algorithm>

std::vector<std::string> findLongestWords(const std::string& phrase) {
    std::stringstream ss(phrase);
    std::string word;
    size_t maxLen = 0;
    std::vector<std::string> longestWords;

    while (ss >> word) {
        word.erase(std::remove_if(word.begin(), word.end(), ::ispunct), word.end());
        if (word.length() > maxLen) {
            maxLen = word.length();
            longestWords = {word};
        } else if (word.length() == maxLen) {
            longestWords.push_back(word);
        }
    }
    return longestWords;
}

std::vector<std::string> splitToPhrases(const std::string& text) {
    std::vector<std::string> phrases;
    std::string delimiters = ".!?";
    size_t start = 0, end = 0;

    while ((end = text.find_first_of(delimiters, start)) != std::string::npos) {
        phrases.push_back(text.substr(start, end - start));
        start = end + 1;
    }
    if (start < text.length()) {
        phrases.push_back(text.substr(start));
    }
    return phrases;
}

int main() {
    std::string text;
    std::cout << "Введите текст: ";
    std::getline(std::cin, text);
    
    while(text.empty()){
      std::cerr << "Error empty text" << std::endl;
      std::getline(std::cin, text);
    }

    auto phrases = splitToPhrases(text);
    std::string result;

    for (const auto& phrase : phrases) {
        auto longestWords = findLongestWords(phrase);
        for (const auto& word : longestWords) {
            result += word + " ";
        }
    }

    std::cout << "Результат: " << result << std::endl;
    return 0;
}
