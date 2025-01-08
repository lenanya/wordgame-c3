module create;
import std::io;
import std::collections;

fn int main() {
    String words = $embed("../resources/word_list.txt");
    String[] word_list = words.split("\n");

    File new = file::open("resources/word_list_6.txt", "w")!!;

    foreach (w: word_list) {
        if (w.len == 6) {
            new.write(w.tconcat("\n"))!!;
        }
    }
    
    return 0;
}