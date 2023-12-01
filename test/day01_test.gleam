import gleeunit/should
import simplifile
import day01

const example_input = "
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
"

const example_input_part_2 = "
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"

fn input() -> String {
  let assert Ok(in) = simplifile.read(from: "./inputs/01.txt")
  in
}

pub fn part_1_example_test() {
  day01.part_1(example_input)
  |> should.equal(142)
}

pub fn part_1_test() {
  day01.part_1(input())
  |> should.equal(54_667)
}

pub fn part_2_example_test() {
  day01.part_2(example_input_part_2)
  |> should.equal(281)
}

pub fn part_2_test() {
  day01.part_2(input())
  |> should.equal(54_203)
}
