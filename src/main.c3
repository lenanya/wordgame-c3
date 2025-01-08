module wordle;
import std::io;
import std::collections;
import std::math;

String words = $embed("../resources/word_list_6.txt");

fn bool is_real_word(String word, String[] word_list) {
	foreach (w: word_list) {
		if (w == word) {
			return true;
		}
	}
	return false;
}

fn int main(String[] args)
{
	String[] word_list = words.split("\n");

	bool exit = false;
	while (!exit) {
		io::printn("Getting a word...");
		usz index = rand(word_list.len);
		String word = word_list[index];

		String shown = "";
		for (usz i = 0; i < word.len; i++) {
			shown = shown.concat("_");
		}

		String input;
		char[1024] buffer;
 		while (input != word) {
			io::printn(shown);
			input = io::readline()!!;
			//if (input == "bruh") {
			//	io::printn(word);
			//	continue;
			//}
			switch {
				case input.len != word.len:
					io::printn("Invalid input, too short or too long");
					continue;
				case !is_real_word(input, word_list):
					io::printn("Invalid word");
					continue;
				case input == word:	
					break;
			}
			for (usz i = 0; i < word.len; i++) {
				if (shown[i] != '_' && input[i] != shown[i]) {
					io::printn("Input doesnt contain the correct letters");
					continue;
				}
			}
			for (usz i = 0; i < word.len; i++) {
				if (input[i] == word[i]) {
					shown[i] = word[i];
				}
			}
		}
		io::printn("Correct! Continue? (y/n)");
		input = io::readline()!!;
		if (input != "y" && input != "Y") {
			exit = true;
		}
	}
	return 0;
}
