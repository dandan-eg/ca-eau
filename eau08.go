package main

// Chiffre only
import (
	"fmt"
	"os"
)

func numberOnly(input string) bool {
	for _, char := range input {
		if char < '0' || char > '9' {
			return false
		}

	}
	return true
}

func main() {
	args := os.Args[1:]
	if len(args) != 1 {
		fmt.Println("usage: go run eau08.go")
		return
	}

	input := args[0]
	fmt.Println(numberOnly(input))
}
