import gleam/list

const digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

pub fn is_digit(char: String) -> Bool {
  list.contains(digits, char)
}

pub fn map_map(input: List(List(a)), fun: fn(a) -> a) -> List(List(a)) {
  list.map(input, fn(sublist) { list.map(sublist, fun) })
}

pub fn map_filter(input: List(List(a)), fun: fn(a) -> Bool) -> List(List(a)) {
  list.map(input, fn(sublist) { list.filter(sublist, fun) })
}
