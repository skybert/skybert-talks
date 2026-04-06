package main

import (
	"fmt"
	"unicode/utf8"
)

func show_utf8_details(s string) {
	fmt.Printf("%v is encoded using %v bytes\n", s, len(s))
	fmt.Printf("%v consists of %v runes (code points)\n", s, utf8.RuneCountInString(s))

	for i, r := range s {
		fmt.Printf("\tByte %d has code point %v U+%X %q\n", i, r, r, r)
		fmt.Printf("\tCode point %v is encoded using %v bytes\n", r, utf8.RuneLen(r))
	}

	fmt.Printf("\n")

}

func main() {
	// codePoint, size := utf8.DecodeRuneInString(s)
	// fmt.Printf("Character %v has code point %v and uses %v bytes\n", s, codePoint, size)
	show_utf8_details("a")
	show_utf8_details("å")
	show_utf8_details("👻")
	show_utf8_details("👍🏽")
	show_utf8_details("你好嗎")
}
