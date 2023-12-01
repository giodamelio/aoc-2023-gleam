import gleam/string
import gleam/list
import gleam/result
import gleam/int
import util

const string_numbers = [
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

fn convert_numbers(input: String) -> String {
  string_numbers
  |> list.fold(input, fn(str, digit) { string.replace(str, digit.0, digit.1) })
}

fn get_first_and_last(input: List(String)) -> String {
  let assert Ok(first) = list.first(input)
  let assert Ok(last) = list.last(input)
  first <> last
}

pub fn part_1(input: String) -> Int {
  input
  |> string.trim
  |> string.split("\n")
  |> list.map(string.to_graphemes)
  |> util.map_filter(util.is_digit)
  |> list.map(get_first_and_last)
  |> list.map(int.parse)
  |> result.all
  |> result.unwrap([])
  |> int.sum
}

pub fn part_2(input: String) -> Int {
  input
  |> convert_numbers
  |> part_1
}
