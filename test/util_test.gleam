import gleam/int
import gleeunit/should
import util

pub fn is_digit_test() {
  util.is_digit("0")
  |> should.equal(True)

  util.is_digit("9")
  |> should.equal(True)

  util.is_digit("a")
  |> should.equal(False)
}

pub fn map_map_test() {
  [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  |> util.map_map(fn(a) { a + a })
  |> should.equal([[2, 4, 6], [8, 10, 12], [14, 16, 18]])
}

pub fn map_filter_test() {
  [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  |> util.map_filter(int.is_even)
  |> should.equal([[2], [4, 6], [8]])
}
