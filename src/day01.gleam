import gleam/string
import gleam/list
import gleam/result
import gleam/int

const numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

fn convert_numbers(input: String) -> String {
  let string_numbers = [
    #("one", "one1one"),
    #("two", "two2two"),
    #("three", "three3three"),
    #("four", "four4four"),
    #("five", "five5five"),
    #("six", "six6six"),
    #("seven", "seven7seven"),
    #("eight", "eight8eight"),
    #("nine", "nine9nine"),
  ]

  string_numbers
  |> list.fold(input, fn(str, digit) { string.replace(str, digit.0, digit.1) })
}

fn is_number(char: String) -> Bool {
  list.contains(numbers, char)
}

fn map_map(input: List(List(a)), fun: fn(a) -> a) -> List(List(a)) {
  list.map(input, fn(sublist) { list.map(sublist, fun) })
}

pub fn part_1(input: String) -> Int {
  input
  |> string.trim
  |> string.split("\n")
  |> list.map(string.to_graphemes)
  |> list.map(fn(line) { list.filter(line, is_number) })
  |> list.map(fn(line) { #(list.first(line), list.last(line)) })
  |> list.map(fn(line) {
    result.unwrap(line.0, "0") <> result.unwrap(line.1, "0")
  })
  |> list.map(fn(line) { int.parse(line) })
  |> result.all
  |> result.unwrap([])
  |> int.sum
}

pub fn part_2(input: String) -> Int {
  input
  |> convert_numbers
  |> part_1
}
