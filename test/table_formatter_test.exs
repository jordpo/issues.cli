defmodule TableFormatterTest do
  use ExUnit.Case
  doctest Issues

  alias Issues.TableFormatter, as: TF

  @rows [
    [c1: "r1 c1", c2: "r1 c2", c3: "r1, c3", c4: "r1+++c4"],
    [c1: "r2 c1", c2: "r2 c2", c3: "r2, c3", c4: "r2 c4"],
    [c1: "r3 c1", c2: "r3 c2", c3: "r3, c3", c4: "r3 c4"],
    [c1: "r4 c1", c2: "r4 c2", c3: "r4, c3", c4: "r4 c4"]
  ]

  @headers [:c1, :c2, :c4]

  def columns, do: TF.split_into_columns(@rows, @headers)

  test "split_into_columns" do
    assert length(columns) === length(@headers)
    assert List.first(columns) === ["r1 c1", "r2 c1", "r3 c1", "r4 c1"]
    assert List.last(columns) === ["r1+++c4", "r2 c4", "r3 c4", "r4 c4"]
  end
end
